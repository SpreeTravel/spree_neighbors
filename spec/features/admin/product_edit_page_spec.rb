require 'spec_helper'

describe "Product Page" do
  context 'as Admin user' do
    #spree helper to enter as admin
    stub_authorization!

    let!(:productlocation) {FactoryGirl.create(Spree::Location)}
    let!(:product) {create(:product, :name => 'apache baseball cap', :price => 10, :location => productlocation)}

    context 'on the product edit view' do
      before(:each) do
        visit spree.admin_product_path(product)
      end

      it "display the links to edit the product neighbors" do
        within '.menu' do
          expect(page).to have_link('Neighbors')
        end
      end

      it 'redirects correctly to the product neighbors view' do
        click_link('Neighbors')
        within '.menu' do
          within'.active' do
            expect(page).to have_content('Neighbors')
          end
        end
      end
    end

    context 'on the product neighbors edition view' do
      before(:each) do
        visit spree.admin_product_path(product)
        click_link('Neighbors')
      end

      it 'shows the input to edit the number of neighbors showed' do
        within '.alpha.twelve.columns' do
          expect(page).to have_css('#neighbors_quantity')
        end
      end

      it 'shows the input to edit neighbors radius' do
        within '.alpha.twelve.columns' do
          expect(page).to have_css('#radius')
        end
      end

      it 'shows the input to edit neighbors_by_property' do
        within '.alpha.twelve.columns' do
          expect(page).to have_css('#property_id')
        end
      end

      it 'shows the elements that allows to edit neighbors manually' do
        pending('Not to sure on how to do it')
      end

    end

  end
end
