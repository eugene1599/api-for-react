class Customer::Create < Trailblazer::Operation
  # class Present < Trailblazer::Operation
  #   self['contract.default.class'] = Customer::Contract::Create

  #   step Model(Customer, :new)
  #   step Contract::Build()
  # end

  # step Nested(Present)
  step :assign_current_user!
  step Contract::Validate(key: :customer)
  step Contract::Persist()

  def assign_current_user!(ctx, current_user:, **)
    ctx['model'].user = current_user
  end
end
