# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  label      :string
#  icon       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :topic do
    # label { "MyString" }
    # icon { "MyString" }
    # Cambiado para usar Faker
    label { Faker::Lorem.word }
    icon { Faker::Lorem.word }
  end
end
