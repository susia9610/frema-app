class Shipping_days < ActiveHash::Base
  self.data = [
      {id: 1, name: "1〜２日で発送"}, {id: 2, name: "２〜3日で発送"},{id: 3, "４〜7日で発送"}
  ]
end