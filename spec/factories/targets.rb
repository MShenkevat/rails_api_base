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
FactoryBot.define do
  factory :target do
    title { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
    radius { 1.5 }
    topic_id { 1 }
  end
end
