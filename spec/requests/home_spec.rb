require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  it 'displays a list of categories and a link to create a new category' do
    user = User.create(full_name: 'User', email: 'user@user.com', password: 'password123')
    category1 = GroupTransaction.create(name: 'Category1', icon: 'Icon1', author: user)
    category2 = GroupTransaction.create(name: 'Category2', icon: 'Icon2', author: user)

    assign(:categories, [category1, category2])
    render
    expect(rendered).to have_content('Categories')
    expect(rendered).to have_selector('.row', count: 2)
    expect(rendered).to have_selector('.section-title', count: 1)
    expect(rendered).to have_link('Add A New Category', href: new_group_transaction_path)
  end
end
