require "application_system_test_case"

class CausesTest < ApplicationSystemTestCase
  setup do
    @cause = causes(:one)
  end

  test "visiting the index" do
    visit causes_url
    assert_selector "h1", text: "Causes"
  end

  test "creating a Cause" do
    visit causes_url
    click_on "New Cause"

    fill_in "Commitments count", with: @cause.commitments_count
    fill_in "Ends", with: @cause.ends
    fill_in "Funds needed", with: @cause.funds_needed
    fill_in "Funds raised", with: @cause.funds_raised
    fill_in "Goal", with: @cause.goal
    fill_in "Image", with: @cause.image
    fill_in "Owner", with: @cause.owner_id
    fill_in "Starts", with: @cause.starts
    fill_in "Status", with: @cause.status
    click_on "Create Cause"

    assert_text "Cause was successfully created"
    click_on "Back"
  end

  test "updating a Cause" do
    visit causes_url
    click_on "Edit", match: :first

    fill_in "Commitments count", with: @cause.commitments_count
    fill_in "Ends", with: @cause.ends
    fill_in "Funds needed", with: @cause.funds_needed
    fill_in "Funds raised", with: @cause.funds_raised
    fill_in "Goal", with: @cause.goal
    fill_in "Image", with: @cause.image
    fill_in "Owner", with: @cause.owner_id
    fill_in "Starts", with: @cause.starts
    fill_in "Status", with: @cause.status
    click_on "Update Cause"

    assert_text "Cause was successfully updated"
    click_on "Back"
  end

  test "destroying a Cause" do
    visit causes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cause was successfully destroyed"
  end
end
