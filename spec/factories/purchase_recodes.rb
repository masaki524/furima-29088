FactoryBot.define do
  factory :purchase_recode do
    
    user_id { 2 }
    item_id { 2 }
    post_num {"111-1111"}
    prefecture_id {2}
    city {"tokyo"}
    banch {"1-11-1"}
    phone_num {"09012341234"}
    building_name {"test"}

    token {"tok_abcdefghijk00000000000000000"}
  end
end
