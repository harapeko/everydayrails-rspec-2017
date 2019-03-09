FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name "晃"
    last_name "三宅"
    # email "naoko81@nagisa.biz"
    sequence(:email) { |n| "tester#{n}@example.com" }
    password "yDo;8|Pvk);D"
  end
end
