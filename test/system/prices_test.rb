require "application_system_test_case"

class PricesTest < ApplicationSystemTestCase
  setup do
    @price = prices(:one)
  end

  test "visiting the index" do
    visit prices_url
    assert_selector "h1", text: "Prices"
  end

  test "creating a Price" do
    visit prices_url
    click_on "New Price"

    fill_in "Close price", with: @price.close_price
    fill_in "Date", with: @price.date
    fill_in "Highest price", with: @price.highest_price
    fill_in "Lowest price", with: @price.lowest_price
    fill_in "Open price", with: @price.open_price
    fill_in "Ticket", with: @price.ticket_id
    fill_in "Volume", with: @price.volume
    click_on "Create Price"

    assert_text "Price was successfully created"
    click_on "Back"
  end

  test "updating a Price" do
    visit prices_url
    click_on "Edit", match: :first

    fill_in "Close price", with: @price.close_price
    fill_in "Date", with: @price.date
    fill_in "Highest price", with: @price.highest_price
    fill_in "Lowest price", with: @price.lowest_price
    fill_in "Open price", with: @price.open_price
    fill_in "Ticket", with: @price.ticket_id
    fill_in "Volume", with: @price.volume
    click_on "Update Price"

    assert_text "Price was successfully updated"
    click_on "Back"
  end

  test "destroying a Price" do
    visit prices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Price was successfully destroyed"
  end
end
