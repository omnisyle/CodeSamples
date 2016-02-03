def create_user
  user = FactoryGirl.create(:user)  
  user.confirm
  user
end

#create user and sign in
def create_user_sign_in(options = {})
  user = create_user(options)
  sign_in user
  user
end

# capybara 

def sign_up_with(name, email, password)
   visit new_user_registration_path
   within("#new_user") do
     fill_in 'Name', with: name
     fill_in 'Email', with: email
     fill_in 'Password', with: password
     fill_in 'Password confirmation', with: password
     click_button 'Sign up'
   end
end

#config database cleaner
config.before(:suite) do
  DatabaseCleaner.clean_with(:truncation)
end

config.before(:each) do |example|
  DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
  DatabaseCleaner.start
end

config.after(:each) do
  DatabaseCleaner.clean
end