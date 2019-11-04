FactoryBot.define do
  factory :current_forecast do
    summary { "MyString" }
    icon { "MyString" }
    temperature { 1.5 }
    feels_like { 1.5 }
    location { "MyString" }
    datetime { "MyString" }
    high { 1.5 }
    low { 1.5 }
    humidity { 1.5 }
    visibility { 1.5 }
    uv_index { 1 }
  end
end
