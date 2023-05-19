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
class Topic < ApplicationRecord
    validates :label, presence: true, length: { maximum: 100 }
    validates :icon, presence: true, length: { maximum: 50 }
end
