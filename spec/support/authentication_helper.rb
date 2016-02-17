module Authentication
  def sign_in_as(owner)
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: owner.email
    fill_in 'Password', with: owner.password
    click_on 'Sign in'
  end

  def sign_out
    visit root_path
    click_on 'Log Out'
  end
end
