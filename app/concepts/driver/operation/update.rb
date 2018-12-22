class Driver::Update < Trailblazer::Operation
  step :model!
  step Contract::Build( constant: Driver::Contract::Create )
  step Contract::Validate( key: :driver )
  step Contract::Persist()

  def model!(cxt, current_user:, params:, **)
    cxt['model'] = current_user.drivers.find(params[:id])
  end
end
