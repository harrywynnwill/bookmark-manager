feature 'new user sign up' do
  scenario 'user can sign up and log to database' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, harry@smith.com'
    expect(User.first.email).to eq 'harry@smith.com'
  end
end