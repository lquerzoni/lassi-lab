FactoryBot.define do
  factory :user do
    
  end
    factory :movie do
        title "Back to the future"
        rating "PG-13"
        release_date "2013-07-07 00:00:00"
    end
    factory :review do
		potatoes 5
        comments "Nice movie!"
    end
    factory :moviegoer do
		name "Mario"
    end
end