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
      let!(:productlocation) {FactoryGirl.create(Spree::Location)}
      let!(:productlocation1) {FactoryGirl.create(Spree::Location, :latitude => 23.139, :longitude => -82.58)}
      let!(:productlocation2) {FactoryGirl.create(Spree::Location, :latitude => 23.139, :longitude => -82.48)}
      let!(:product) {create(:product, :name => 'apache baseball cap', :price => 10, :location => productlocation)}
      let!(:product1) {create(:product, :name => 'apache baseball jersey', :price => 11, :location => productlocation1)}
      let!(:product2) {create(:product, :name => 'apache baseball mug', :price => 12, :location => productlocation2)}

      before(:each) do
        click_link("Neighbors Settings")
      end

      it 'displays existing locatable items in the view' do
        within("#listing_locatables") do
          expect(page).to have_content(product.name)
          expect(page).to have_content(product1.name)
          expect(page).to have_content(product2.name)
        end
      end

      it 'displays edit locatable item link' do
        within("#listing_locatables") do
          expect(page).to have_css('a.edit.icon_link.with-tip.icon-edit.no-text')
        end
      end

    end
  end
end
