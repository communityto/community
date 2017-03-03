FactoryGirl.define do
  factory :spaces do
    title       { ['Cerulean Gym', 'PokeCenter', 'PokeMart'].sample }
    description { 'this is the same factory-made description for everything!' }
    price       { rand(1..100) }
    capacity    { rand(1..100) }
    bathrooms   { rand(1..10) }
    size        { rand(1..1000) }
    host_id     { rand(1..50) }
  end
end
