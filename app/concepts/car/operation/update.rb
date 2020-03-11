class Car::Update < Trailblazer::Operation
  # self['contract.default.class'] = Car::Contract::Create

  step :model!
  step Contract::Build()
  step Contract::Validate( key: :car )
  step Contract::Persist()

  def model!(cxt, current_user:, params:, **)
    cxt['model'] = current_user.cars.find_by(id: params[:id])
  end
end
