Fabricator(:user) do
  email 'email@example.com'
  username 'username'
  password 'password'
  confirmed_email true
  access_level 1
end

Fabricator(:unconfirmed_user, from: :user) do
  confirmed_email false
end

Fabricator(:admin, from: :user) do
  email 'admin@example.com'
  username 'admin'
  access_level 4
end

Fabricator(:super_user, from: :user) do
  email 'super@example.com'
  username 'superuser'
  access_level 5
end
