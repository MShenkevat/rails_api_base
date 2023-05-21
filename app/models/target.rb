# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  title      :string
#  latitude   :float
#  longitude  :float
#  radius     :float
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Target < ApplicationRecord
    acts_as_mappable default_units: :kms,
                     default_formula: :sphere,
                     lat_column_name: :latitude,
                     lng_column_name: :longitude

belongs_to :topic, foreign_key: 'topic_id'
end
