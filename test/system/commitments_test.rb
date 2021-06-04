require "application_system_test_case"

class CommitmentsTest < ApplicationSystemTestCase
  setup do
    @commitment = commitments(:one)
  end

  test "visiting the index" do
    visit commitments_url
    assert_selector "h1", text: "Commitments"
  end

  test "creating a Commitment" do
    visit commitments_url
    click_on "New Commitment"

    fill_in "Causes", with: @commitment.causes_id
    fill_in "Description", with: @commitment.description
    fill_in "Donation size", with: @commitment.donation_size
    fill_in "Owner", with: @commitment.owner_id
    fill_in "Status", with: @commitment.status
    fill_in "Target", with: @commitment.target
    click_on "Create Commitment"

    assert_text "Commitment was successfully created"
    click_on "Back"
  end

  test "updating a Commitment" do
    visit commitments_url
    click_on "Edit", match: :first

    fill_in "Causes", with: @commitment.causes_id
    fill_in "Description", with: @commitment.description
    fill_in "Donation size", with: @commitment.donation_size
    fill_in "Owner", with: @commitment.owner_id
    fill_in "Status", with: @commitment.status
    fill_in "Target", with: @commitment.target
    click_on "Update Commitment"

    assert_text "Commitment was successfully updated"
    click_on "Back"
  end

  test "destroying a Commitment" do
    visit commitments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Commitment was successfully destroyed"
  end
end
