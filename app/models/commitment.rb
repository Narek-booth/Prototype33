# == Schema Information
#
# Table name: commitments
#
#  id            :bigint           not null, primary key
#  description   :text
#  donation_size :integer          default(0)
#  status        :string
#  target        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  cause_id      :bigint           not null
#  owner_id      :bigint           not null
#
# Indexes
#
#  index_commitments_on_cause_id  (cause_id)
#  index_commitments_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (cause_id => causes.id)
#  fk_rails_...  (owner_id => users.id)
#
class Commitment < ApplicationRecord
  belongs_to :causes
  belongs_to :owner, class_name: "User"
end
