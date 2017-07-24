require "active_record"
module MoRecord
  module Logged
    extend ActiveSupport::Concern

    module ClassMethods
      def logged_mo(option = {})
        MoRecord.version = option[:version] if option[:version_count]
        has_many :logged_mos, as: :target, class_name: "MoRecord::LoggedMo"
        before_update :update_logged_mo
        before_destroy :destroy_logged_mo

        private

        ["update","destroy"].each do |action|
          method_name = action + "_logged_mo"
          define_method method_name do
            self.transaction do 
              self.logged_mos.first.destroy if self.logged_mos.count == MoRecord.version
              MoRecord::LoggedMo.create(target_id: self.id, target_type: self.class.name,log_content: self.to_json, action: action, version: self.reload.logged_mos.size + 1)
            end
          end
        end
      end
    end

    module MyLogInstanceMethods
      ["update","destroy"].each do |action|
        method_name = action + "_mos"
        define_method method_name do
          fetch_mos_method(action,action)
        end
      end

      ["version","versions"].each do |version_name|
        method_name = "fetch_mos_" + version_name
        define_method method_name do |versions|
          logged_mos = fetch_mos_method(versions,versions)
          return logged_mos.first unless versions.instance_of? Array
          logged_mos
        end
      end

      ["from_version","to_version"].each do |method_name|
        define_method method_name do |version, number = nil|
          fetch_mos_method(method_name, number)
        end
      end

      ["from_util","to_util"].each do |method_name|
        define_method method_name do |version, number = nil|
          fetch_mos_method(method_name, number)
        end
      end

      private

      def fetch_mos_method(method_name, method_params = nil, number = nil)
        logged_mos = self.logged_mos.send(method_name, method_params)
        logged_mos = logged_mos.descending if method_name == "to_util" || method_name == "to_version"
        return logged_mos.limit(number) if number
        logged_mos
      end

    end
  end
end