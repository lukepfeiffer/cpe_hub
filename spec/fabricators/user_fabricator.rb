Fabricator(:user) do
  email 'email@example.com'
  username 'username'
  password 'password'
  confirmed_email true
end

Fabricator(:unconfirmed_user, from: :user) do
  confirmed_email false
end

