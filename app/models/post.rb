# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cause_id   :bigint           not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_posts_on_cause_id  (cause_id)
#  index_posts_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (cause_id => causes.id)
#  fk_rails_...  (owner_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :cause

  validates :body, presence: true
end
