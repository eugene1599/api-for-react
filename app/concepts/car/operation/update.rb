class Car::Update < Trailblazer::Operation
  step :model!
  step Contract::Build( constant: Car::Contract::Create )
  step Contract::Validate( key: :car )
  step Contract::Persist()

  def model!(cxt, current_user:, params:, **)
    cxt['model'] = current_user.cars.find(params[:id])
  end
end
