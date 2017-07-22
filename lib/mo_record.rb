require "mo_record/version"
require "mo_record/configuration"

module MoRecord
  extend MoRecord::Configuration

  # example 
  # Module.setup do |config|
  #   config.version = 10
  # end
  def self.setup(&_block)
    yield(self)
  end

end
