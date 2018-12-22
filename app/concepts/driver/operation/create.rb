class Driver::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Driver, :new)
    step Contract::Build(constant: Driver::Contract::Create)
  end

  step Nested(Present)
  step :assign_current_user!
  step Contract::Validate(key: :driver)
  step Contract::Persist()

  def assign_current_user!(ctx, current_user:, **)
    ctx['model'].user = current_user
  end
end
