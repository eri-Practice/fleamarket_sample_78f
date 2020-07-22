FactoryBot.define do
  
  factory :user do
    id                           {1}
    nickname                     {"山太郎"}
    email                        {"aa@aa.com"}
    password                     {"1234567"}
    password_confirmation        {"1234567"}
  end

end