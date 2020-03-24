class Customer::Create < Trailblazer::Operation
  step Model(Customer, :new)
  step Contract::Build(constant: Customer::Contract::Create)
  step :assign_current_user!
  step Contract::Validate(key: :customer)
  step Contract::Persist()

  def assign_current_user!(ctx, current_user:, **)
    ctx['model'].user = current_user
  end
end
