class Car::Create < Trailblazer::Operation
  step Contract::Build(constant: Car::Contract::Create)
  step :assign_current_user!
  step Contract::Validate(key: :car)
  step Contract::Persist()

  def assign_current_user!(ctx, current_user:, **)
    ctx['model'].user = current_user
  end
end
