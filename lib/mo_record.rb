require "mo_record/version"
require "mo_record/configuration"
require "mo_record/logged"
require "mo_record/logged_mo"
require "active_record"

module MoRecord
  extend MoRecord::Configuration

  # example 
  # Module.setup do |config|
  #   config.version_count = 10
  # end
  def self.setup(&_block)
    yield(self)
  end

end

::ActiveRecord::Base.send :include, MoRecord::Logged
