require 'spec_helper'

describe "Product Page" do
  context 'as Admin user' do
    #spree helper to enter as admin
    stub_authorization!

    before(:each) do
      visit spree.admin_path
    end

    let!(:productlocation) {FactoryGirl.create(Spree::Location)}
    let!(:product) {create(:product, :name => 'apache baseball cap', :price => 10, :location => productlocation)}

    it "display the links to edit the product neighbors" do
      visit spree.admin_product_path(product)
      within '.menu' do
        expect(page).to have_link('Neighbors')
      end
    end

    it 'redirects correctly to the product neighbors view' do
      visit spree.admin_product_path(product)
      click_link('Neighbors')
      expect(page).to have_content('Hello World')
    end
  end
end
