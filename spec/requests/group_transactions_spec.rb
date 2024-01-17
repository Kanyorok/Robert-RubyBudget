require 'rails_helper'

RSpec.describe 'group_transactions/new.html.erb', type: :view do
  before(:each) do
    assign(:group_transactions, GroupTransaction.new)
  end

  it 'displays the form for creating a new category' do
    render

    expect(rendered).to have_selector('section.mb-5') do
      have_selector 'h1', text: 'Create Category'
      have_selector 'form[action=?][method=?]', group_transactions_path, 'post'
    end
  end
end
