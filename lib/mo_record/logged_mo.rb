module MoRecord
  class LoggedMo < ::ActiveRecord::Base
    belongs_to :target, polymorphic: true

    scope :ascending, -> { order(:id) }
    scope :descending, -> { order(id: :desc) }
    scope :from_version, ->(version){ where('version > ?', version) }
    scope :to_version, ->(version){ where('version < ?', version) }
    scope :from_util, ->(date_or_time) { where('created_at > ?', date_or_time) }
    scope :to_util, -> (date_or_time) { where(' created_at < ?', date_or_time)}
    scope :action, -> (action) { where(action: action) }
    scope :versions, -> (versions) { where(version: versions) }
  end
end