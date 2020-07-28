FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "t#{n.to_s.rjust(3, '0')}@example.com" }
    password { "abcdefgh" }
  end
end
