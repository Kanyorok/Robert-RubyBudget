require 'rails_helper'
# frozen_string_literal: true

RSpec.describe User, type: :model do
  subject(:user) { User.new(full_name: 'James', email: 'rt@gmail.com', password: 'rest12345') }
  before { subject.save }
  it 'is valid subject' do
    expect(user).to be_valid
  end

  it 'is not valid without name' do
    user.full_name = nil
    expect(user).to_not be_valid
  end
end
