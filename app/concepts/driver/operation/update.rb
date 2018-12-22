class Driver::Update < Trailblazer::Operation
  self['contract.default.class'] = Driver::Contract::Create

  step :model!
  step Contract::Build()
  step Contract::Validate( key: :driver )
  step Contract::Persist()

  def model!(cxt, current_user:, params:, **)
    cxt['model'] = current_user.drivers.find_by(id: params[:id])
  end
end
