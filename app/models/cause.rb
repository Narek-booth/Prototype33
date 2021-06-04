# == Schema Information
#
# Table name: causes
#
#  id                :bigint           not null, primary key
#  commitments_count :integer          default(0)
#  description       :text
#  funds_needed      :integer          default(0)
#  funds_raised      :integer          default(0)
#  image             :string
#  status            :string
#  theme             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  owner_id          :bigint           not null
#
# Indexes
#
#  index_causes_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Cause < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :commitments
  has_many :favorites
  has_many :posts

  validates :status, presence: true
  validates :theme, presence: true
  validates :description, presence: true

  enum status: { fundraising: "fundraising", completed: "completed", stopped: "stopped" }
end
