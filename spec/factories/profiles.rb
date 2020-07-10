FactoryBot.define do
  factory :profile do
    association :user
    first_name                   {"太郎"}
    family_name                  {"山田"}
    first_name_kana              {"タロウ"}
    family_name_kana             {"ヤマダ"}
    birth_date                   {"2002-01-04"}
  end
end