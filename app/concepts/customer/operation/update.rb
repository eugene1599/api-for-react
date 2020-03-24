class Customer::Update < Trailblazer::Operation
  step :model!
  step Contract::Build(constant: Customer::Contract::Create)
  step Contract::Validate( key: :customer )
  step Contract::Persist()

  def model!(cxt, current_user:, params:, **)
    cxt['model'] = current_user.customers.find_by(id: params[:id])
  end
end
