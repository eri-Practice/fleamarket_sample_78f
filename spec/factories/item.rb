FactoryBot.define do

  factory :item do
    name            {}
    text            {}
    price           {}
    category        {}
    condition       {}
    postage_payer   {}
    prefecture      {}
    standby_day     {}
    trading_status  {}
    seller          {}
    buyer           {}
  end

end