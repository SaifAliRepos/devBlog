require "application_system_test_case"

class SuggestionsTest < ApplicationSystemTestCase
  setup do
    @suggestion = suggestions(:one)
  end

  test "visiting the index" do
    visit suggestions_url
    assert_selector "h1", text: "Suggestions"
  end

  test "should create suggestion" do
    visit suggestions_url
    click_on "New suggestion"

    fill_in "Find", with: @suggestion.find
    fill_in "Replace", with: @suggestion.replace
    click_on "Create Suggestion"

    assert_text "Suggestion was successfully created"
    click_on "Back"
  end

  test "should update Suggestion" do
    visit suggestion_url(@suggestion)
    click_on "Edit this suggestion", match: :first

    fill_in "Find", with: @suggestion.find
    fill_in "Replace", with: @suggestion.replace
    click_on "Update Suggestion"

    assert_text "Suggestion was successfully updated"
    click_on "Back"
  end

  test "should destroy Suggestion" do
    visit suggestion_url(@suggestion)
    click_on "Destroy this suggestion", match: :first

    assert_text "Suggestion was successfully destroyed"
  end
end
