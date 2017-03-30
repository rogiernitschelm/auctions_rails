require 'rails_helper'

RSpec.describe 'User' do
  it 'creates a user' do
    User.create!(
      email: 'abc@mail.com',
      password: 'abcd1234',
      first_name: 'abc',
      last_name: 'abc',
      location: 'abc'
    )

    expect(User.count).to eql(1)
  end

  it 'updates a user' do
    user = User.create!(
      email: 'abc@mail.com',
      password: 'abcd1234',
      first_name: 'aaa',
      last_name: 'aaa',
      location: 'aaa'
    )

    user.update_attributes!(first_name: 'bbb')
    expect(user.first_name).to eql('bbb')
  end

  it 'destroys a user' do
    user = User.create!(
      email: 'abc@mail.com',
      password: 'abcd1234',
      first_name: 'aaa',
      last_name: 'aaa',
      location: 'aaa'
    )

    user.destroy!
    expect(User.count).to eql(0)
  end
end
