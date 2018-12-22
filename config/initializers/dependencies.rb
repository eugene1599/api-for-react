class MyContainer
  extend Dry::Container::Mixin

  register 'car.contract' do
    Car::Contract::Create
  end

  register 'driver.contract' do
    UserProfile::Contract::Create
  end

  register 'customer.contract' do
    UserProfile::Contract::Create
  end

  register 'race.contract' do
    UserProfile::Contract::Create
  end
end
