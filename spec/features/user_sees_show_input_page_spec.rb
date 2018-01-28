describe "user visits merchant show page" do
  context "visit /merchants/show_input" do
    it "user sees navbar links" do
      visit "/merchants/show_input"

      expect(current_path).to eq("/merchants/show_input")
      expect(page).to have_content("Home")
      expect(page).to have_content("Merchants")
      expect(page).to have_content("Items")
      expect(page).to have_content("Please enter merchant id")
    end

    it "user can click home button" do
      visit "/merchants/show_input"
      click_on("Home")

      expect(current_path).to eq("/")
    end

    it "user can click new merchant button" do
      visit "/merchants/show_input"

      within("#merchant-dropdown") do
        click_on("New")

        expect(current_path).to eq("/merchants/new")
      end
    end

    it "user can click edit merchant button" do
      visit "/merchants/show_input"

      within("#merchant-dropdown") do
        click_on("Edit")

        expect(current_path).to eq("/merchants/edit_input")
      end
    end

    it "user can click index merchant button" do
      visit "/merchants/show_input"

      within("#merchant-dropdown") do
        click_on("Index")

        expect(current_path).to eq("/merchants")
      end
    end

    it "user can click show merchant button" do
      visit "/merchants/show_input"

      within("#merchant-dropdown") do
        click_on("Show")

        expect(current_path).to eq("/merchants/show_input")
      end
    end

    it "user sees text box" do
      visit "/merchants/show_input"

      expect(page.first(:css, "#id-box")[:value]).to be_nil
    end

    it "user can see submit button" do
      visit "/merchants/show_input"

      expect(page).to have_selector('input[type=submit]')
    end

    it "clicking submit button redirects and adds to merchant index page" do
      visit "/merchants/new"
      fill_in "number-box", with: "420"
      fill_in "text-box", with: "Example Merchant"
      click_on("submit-button")

      visit "/merchants/show_input"
      fill_in "id-box", with: "420"
      click_on("submit-button")

      expect(current_path).to eq("/merchants/")
      expect(page).to have_content("Home")
      expect(page).to have_content("Merchants")
      expect(page).to have_content("Items")
      expect(page).to have_content("Id / 420")
      expect(page).to have_content("Merchant / Example Merchant")
      expect(page).to have_content("Created-at / ")
      expect(page).to have_content("Updated-at / ")
    end
  end
end
