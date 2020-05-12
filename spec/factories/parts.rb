FactoryBot.define do
  factory :part do
    name { '胸' }
    association :user
  end
end
