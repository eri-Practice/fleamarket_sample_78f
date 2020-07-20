FactoryBot.define do
  factory :sending_destination do
    association :user
    destination_first_name       {"太郎"}
    destination_family_name      {"山田"}
    destination_family_name_kana {"ヤマダ"}
    destination_first_name_kana  {"タロウ"}
    post_code                    {"1234"}
    city                         {"市町村"}
    house_number                 {"1234"}
    building_name                {"123"}
    phone_number                 {"012345"}
    prefecture_code              {"都道府県"}
  end
end