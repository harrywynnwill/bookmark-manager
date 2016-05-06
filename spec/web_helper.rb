def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'harry@smith.com'
  fill_in :password, with: '3613'
  click_button 'Sign up'
end