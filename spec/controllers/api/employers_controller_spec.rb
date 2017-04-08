require 'rails_helper'

RSpec.describe Api::EmployersController do
  it 'creates an employer' do
    post :create,
    params: user_params.merge(employer_params)

    expect(Employer.count).to be(1)
    expect(User.count).to be(1)
  end

  it 'shows an employer' do
    create_employer_and_session
    get :show, params: { id: @employer.id }

    json_response = JSON.parse(response.body)

    expect(json_response['company_name']).to eq('Hoogle')
    expect(json_response['recruitment_agency']).to eq(false)
  end

  it 'updates an employer' do
    create_employer_and_session

    put :update,
    params: {
      id: @employer.id,
      company_name: 'Boogle',
      company_location: 'Silicon Mountain',
      recruitment_agency: true
    }

    @employer.reload

    expect(@employer.company_name).to eq('Boogle')
    expect(@employer.recruitment_agency).to eq(true)
    expect(@employer.company_location).to eq('Silicon Mountain')
  end

  private

  def create_employer_and_session
    Employer.transaction do
      @user = User.new(user_params)
      @employer = Employer.new(employer_params)
      @employer.user = @user
      @employer.save
    end
    session[:user_id] = @user.id
  end

  def user_params
    {
      email: 'mail@hoogle.nom',
      password: 'abcd1234',
      first_name: 'Kees',
      last_name: 'de Sjaak',
      location: 'Amsterdam'
    }
  end

  def employer_params
    {
      chamber_of_commerce: '1234abcd',
      company_name: 'Hoogle',
      company_location: 'Silicon Valley',
      company_business: 'Searchin stuff',
      recruitment_agency: false
    }
  end
end
