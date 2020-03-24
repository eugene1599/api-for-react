class Race::Create < Trailblazer::Operation
  step Model(Race, :new)
  step :assign_current_user!
  step Contract::Build(constant: Race::Contract::Create)
  step Contract::Validate(key: :race)
  step Contract::Persist()

  def assign_current_user!(ctx, current_user:, **)
    ctx['model'].user = current_user
  end
end
