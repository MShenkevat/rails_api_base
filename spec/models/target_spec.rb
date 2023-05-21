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
require 'rails_helper'

RSpec.describe Target, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
