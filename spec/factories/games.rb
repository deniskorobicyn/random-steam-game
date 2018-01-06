FactoryGirl.define do
  factory :game do
    sequence(:steam_appid) { |num| num }
    sequence(:name) { |num| "Half-Life 2: Deathmatch_#{num}" }
    image_url "6dd9f66771300f2252d411e50739a1ceae9e5b30"
  end
end
