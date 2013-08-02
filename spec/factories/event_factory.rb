FactoryGirl.define do
  factory :event1, class: Event do
    # id 1
    title "Brkyn Party"
    start_date "8/9/13"
    start_time "8 pm"
    end_date "8/10/13"
    end_time "2 am"
    street "10 Midwood St"
    street2 "Apt 10"
    city "Brooklyn"
    state "NY"
    zip "11225"
    created_at Time.now
    updated_at Time.now
    price "30.00"
    description "This is going to be a huge beer party."
    image_url "#"
  end

  factory :event2, class: Event do
     # id 1
    title "Beer Tasting"
    start_date "8/10/13"
    start_time "8 pm"
    end_date "8/11/13"
    end_time "12 am"
    street "10 E 21st St"
    street2 ""
    city "New York"
    state "NY"
    zip "10010"
    created_at Time.now
    updated_at Time.now
    price "50.00"
    description "very classy."
    image_url "#"
  end

  factory :updated_event, class: Event do
    title 'my updated Party'
    start_date '8/8/14'
    city "Queens"
  end

  factory :invalid_event, class: Event do
    title nil
    date nil
  end
end


