FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code      {"123-4567"}
    prefecture_id    {2}
    municipality     {"青森市"}
    house_number { "1-1" }
    building_name { "品川ビル" }
    phone_number {"08012341234"}
  end
end
