class MyContainer
  extend Dry::Container::Mixin

  register 'car.contract' do
    Car::Contract::Create
  end

  register 'driver.contract' do
    Driver::Contract::Create
  end

  register 'customer.contract' do
    Customer::Contract::Create
  end

  register 'race.contract' do
    Race::Contract::Create
  end

  register 'user_profile.contract' do
    UserProfile::Contract::Create
  end
end
