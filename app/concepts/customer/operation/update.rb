class Customer::Update < Trailblazer::Operation
  self['contract.default.class'] = Customer::Contract::Create

  step :model!
  step Contract::Build()
  step Contract::Validate( key: :customer )
  step Contract::Persist()

  def model!(cxt, current_user:, params:, **)
    cxt['model'] = current_user.customers.find_by(id: params[:id])
  end
end
