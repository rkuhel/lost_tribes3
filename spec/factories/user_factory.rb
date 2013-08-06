FactoryGirl.define do
  factory :user, class: User do
    id 1
    name Faker::Name.name
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
  end
 
  factory :customer, class: User do
    id 1
    name Faker::Name.name
    email Faker::Internet.email
    role 'customer'
    password "password"
    password_confirmation "password"
  end

  factory :vendor, class: User do
    # id 2
    name Faker::Name.name
    email Faker::Internet.email
    role "vendor" 
    zip_code '44122'
    street_address1 "2333 norwood rd"
    city "beachwood"
    state 'Ohio'
    phone "215 666 7777"
    password "wordpass"
    password_confirmation "wordpass"
  end

  factory :admin, class: User do
    # id 3
    name Faker::Name.name
    email Faker::Internet.email
    zip_code '44122'
    password "password"
    password_confirmation "password"
    role "admin"
  end

  factory :invalid_user, class: User do
    name nil
    email nil
  end
  factory :updated_user, class: User do
    name 'my updated name'
    email 'my_updated@email.com'
  end

end

