require "active_record"
module MoRecord
  module Logged
    extend ActiveSupport::Concern

    module ClassMethods
      def logged_mo
        has_many :logged_mos, as: :target
        before_update :update_logged_mo
        before_destroy :destroy_logged_mo

        private

        ["update","destroy"].each do |action|
          method_name = action + "_logged_mo"
          define_method method_name do
            LoggedMo.create(target_id: self.id, target_type: self.class.name, log_content: self.to_json, action: action, version: self.logged_mos.size)
          end
        end
      end
    end

    module MyLogInstanceMethods
      ["update","destroy"].each do |action|
        method_name = "fetch_" + action
        define_method method_name do
          LoggedMo.where(target_id: self.id, target_type: self.class.name, action: action)
        end
      end
    end
  end
end