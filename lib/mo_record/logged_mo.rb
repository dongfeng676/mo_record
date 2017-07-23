class LoggedMo < ::ActiveRecord::Base
  belongs_to :target, polymorphic: true
end