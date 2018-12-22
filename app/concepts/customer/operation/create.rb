class Customer::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Customer, :new)
    step Contract::Build(constant: Customer::Contract::Create)
  end

  step Nested(Present)
  step :assign_current_user!
  step Contract::Validate(key: :customer)
  failure :log_error!
  step Contract::Persist()

  def log_error!(*)
    puts 'Cannot save'
  end

  def assign_current_user!(ctx, current_user:, **)
    ctx['model'].user = current_user
  end
end
