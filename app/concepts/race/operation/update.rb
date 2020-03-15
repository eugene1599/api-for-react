class Race::Update < Trailblazer::Operation
  step :model!
  step Contract::Build(constant: Race::Contract::Create)
  step Contract::Validate(key: :race)
  step Contract::Persist()

  def model!(cxt, current_user:, params:, **)
    cxt['model'] = current_user.races.find_by(id: params[:id])
  end
end
