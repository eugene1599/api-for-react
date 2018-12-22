class Car::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    self['contract.default.class'] = Car::Contract::Create

    step Model(Car, :new)
    step Contract::Build()
  end

  step Nested(Present)
  step :assign_current_user!
  step Contract::Validate(key: :car)
  step Contract::Persist()

  def assign_current_user!(ctx, current_user:, **)
    ctx['model'].user = current_user
  end
end
