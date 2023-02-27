require "application_system_test_case"

class NumbersTest < ApplicationSystemTestCase
  setup do
    @number = numbers(:one)
  end

  test "visiting the index" do
    visit numbers_url
    assert_selector "h1", text: "Numbers"
  end

  test "should create number" do
    visit numbers_url
    click_on "New number"

    check "Prime" if @number.prime
    fill_in "Value", with: @number.value
    click_on "Create Number"

    assert_text "Number was successfully created"
    click_on "Back"
  end

  test "should update Number" do
    visit number_url(@number)
    click_on "Edit this number", match: :first

    check "Prime" if @number.prime
    fill_in "Value", with: @number.value
    click_on "Update Number"

    assert_text "Number was successfully updated"
    click_on "Back"
  end

  test "should destroy Number" do
    visit number_url(@number)
    click_on "Destroy this number", match: :first

    assert_text "Number was successfully destroyed"
  end
end
