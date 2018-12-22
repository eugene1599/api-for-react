class MyContainer
  extend Dry::Container::Mixin

  register 'car_contract' do
    Car::Contract::Create
  end

  register 'driver_contract' do
    UserProfile::Contract::Create
  end

  register 'customer_contract' do
    UserProfile::Contract::Create
  end

  register 'race_contract' do
    UserProfile::Contract::Create
  end

  #register 'driver.contract.create' do
  #  UserProfile::Contract::Create
  #end

  register 'driver.contract.create' do
    UserProfile::Contract::Create
  end
end
