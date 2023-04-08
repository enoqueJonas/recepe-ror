FactoryBot.define do
  factory :recipe do
    name { 'MyString' }
    preparation_time { '9.99' }
    cooking_time { '9.99' }
    description { 'MyString' }
    public { false }
    user { nil }
  end
end
