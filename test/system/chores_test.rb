require "application_system_test_case"

class ChoresTest < ApplicationSystemTestCase
  setup do
    @chore = chores(:one)
  end

  test "visiting the index" do
    visit chores_url
    assert_selector "h1", text: "Chores"
  end

  test "creating a Chore" do
    visit chores_url
    click_on "New Chore"

    fill_in "Description", with: @chore.description
    fill_in "Title", with: @chore.title
    click_on "Create Chore"

    assert_text "Chore was successfully created"
    click_on "Back"
  end

  test "updating a Chore" do
    visit chores_url
    click_on "Edit", match: :first

    fill_in "Description", with: @chore.description
    fill_in "Title", with: @chore.title
    click_on "Update Chore"

    assert_text "Chore was successfully updated"
    click_on "Back"
  end

  test "destroying a Chore" do
    visit chores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chore was successfully destroyed"
  end
end
