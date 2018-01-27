describe "a user visits new merchant page" do
  context "visit /merchants/new" do
    it "user sees navbar links" do
      visit "/merchants/new"

      expect(current_path).to eq("/merchants/new")
      expect(page).to have_content("Home")
      expect(page).to have_content("Merchants")
      expect(page).to have_content("Items")
      expect(page).to have_content("Enter a new merchant:")
      expect(page).to have_content("Enter merchant id:")
      expect(page).to have_content("Enter a merchant name:")
    end

    it "user can click home button" do
      visit "/merchants/new"
      click_on("Home")

      expect(current_path).to eq("/")
    end

    it "user can click new merchant button" do
      visit "/merchants/new"

      within("#merchant-dropdown") do
        click_on("New")

        expect(current_path).to eq("/merchants/new")
      end
    end

    it "user can click edit merchant button" do
      visit "/merchants/new"

      within("#merchant-dropdown") do
        click_on("Edit")

        expect(current_path).to eq("/merchants/edit_input")
      end
    end

    it "user can click index merchant button" do
      visit "/merchants/new"

      within("#merchant-dropdown") do
        click_on("Index")

        expect(current_path).to eq("/merchants")
      end
    end

    it "user can click show merchant button" do
      visit "/merchants/new"

      within("#merchant-dropdown") do
        click_on("Show")

        expect(current_path).to eq("/merchants/show_input")
      end
    end

    it "user can see number box" do
      visit "/merchants/new"

      expect(page.first(:css, "#number-box")[:value]).to be_nil
    end

    it "user can see text box" do
      visit "/merchants/new"

      expect(page.first(:css, "#text-box")[:value]).to be_nil
    end

    it "user can see submit button" do
      visit "/merchants/new"

      expect(page).to have_selector('input[type=submit]')
    end

    it "clicking submit button redirects and adds to merchant index page" do
      visit "/merchants/new"
      fill_in "number-box", with: "420"
      fill_in "text-box", with: "Example Merchant"
      click_on("submit-button")

      expect(current_path).to eq("/merchants")
      expect(page).to have_content("Home")
      expect(page).to have_content("Merchants")
      expect(page).to have_content("Items")
      expect(page).to have_content("420")
      expect(page).to have_content("Example Merchant")
    end
  end
end
