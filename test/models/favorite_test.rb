# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cause_id   :bigint           not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_favorites_on_cause_id  (cause_id)
#  index_favorites_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (cause_id => causes.id)
#  fk_rails_...  (owner_id => users.id)
#
require "test_helper"

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
