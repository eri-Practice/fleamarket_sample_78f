FactoryBot.define do
  factory :item do
    name            {"中古本"}
    text            {"いい本です。"}
    price           {1000}
    category        {1}
    condition       {"新品、未使用"}
    postage_payer   {"送料込み(出品者負担)"}
    prefecture_id   {1}
    standby_day     {"４〜７日で発送"}
    trading_status  {"出品中"}
    seller          {1}
    images {[build(:image)]}
  end
end