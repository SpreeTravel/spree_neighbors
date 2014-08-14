require 'spec_helper'

describe "Spree Configuration" do
  context 'as Admin user' do
    #spree helper to enter as admin
    stub_authorization!

    before(:each) do
      visit spree.admin_path
      click_link "Configuration"
    end

    it 'haves the link to Spree_Neighbors configuration' do
      expect(page).to have_link("Neighbors Settings")
    end

    it 'clicking on the Neighbors Settings link redirects correctly to Neighbors Settings edit' do
      click_link("Neighbors Settings")
      within(".page-title") do
         expect(page).to have_content('Spree Neighbors Settings')
      end
    end

    context 'inside the spree neighbors settings edit page' do
      before(:each) do
        click_link("Neighbors Settings")
      end

    end
  end
end
