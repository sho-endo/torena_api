FactoryBot.define do
  factory :menu do
    name { 'ベンチプレス' }
    association :part
    # user { part.user }
  end
end
