FactoryBot.define do
  
  factory :item do
    name                 {"G-SHOCK 腕時計"}
    description          {"新品・未使用です。よろしくお願いします！"}
    category_id          {"1"}
    brand                {"G-SHOCK"}
    condition_id         {"1"}
    prefecture_id        {"1"}
    size                 {"1"}
    price                {"10000"}
    shipping_days_id     {"1"}
    postage_id           {"1"}
    status_id            {"1"}
    seller_id            {"1"}
    buyer_id             {"1"}
  end


end