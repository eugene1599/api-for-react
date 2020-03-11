class Race::Create < Trailblazer::Operation
  # class Present < Trailblazer::Operation
  #   self['contract.default.class'] = Race::Contract::Create

  #   step Model(Race, :new)
  #   step Contract::Build()
  # end

  # self['contract.default.class'] = Race::Contract::Create
  step Model(Race, :new)
  #step :parse_dates!
  step :assign_current_user!
  step Contract::Build()
  step Contract::Validate(key: :race)
  step Contract::Persist()

  def parse_dates!(ctx, current_user:, params:, **)
    params = params.fetch(:race) { {} }

    start_date = Time.new(
      params['start_date(1i)'].to_i,
      params['start_date(2i)'].to_i,
      params['start_date(3i)'].to_i,
      params['start_date(4i)'].to_i,
      params['start_date(5i)'].to_i
    )
    end_date = Time.new(
      params['end_date(1i)'].to_i,
      params['end_date(2i)'].to_i,
      params['end_date(3i)'].to_i,
      params['end_date(4i)'].to_i,
      params['end_date(5i)'].to_i
    )
    ctx['model'].start_date = start_date
    ctx['model'].end_date = end_date
  end

  def assign_current_user!(ctx, current_user:, **)
    ctx['model'].user = current_user
  end
end
