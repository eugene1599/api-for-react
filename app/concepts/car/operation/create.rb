class Car::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Car, :new)
    step Contract::Build(constant: Car::Contract::Create)
  end

  step Nested(Present)
  step :assign_current_user!
  step Contract::Validate(key: :car)
  failure :log_error!
  step Contract::Persist()

  def assign_current_user!(ctx, current_user:, **)
    ctx['model'].user = current_user
  end
end
