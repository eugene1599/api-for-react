class Race::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    self['contract.default.class'] = Race::Contract::Create
    step :model!
    step Contract::Build()

    def model!(cxt, current_user:, params:, **)
      cxt['model'] = current_user.races.find_by(id: params[:id])
    end
  end

  self['contract.default.class'] = Race::Contract::Create

  step :model!
  #step :parse_dates!
  step Contract::Build()
  step Contract::Validate(key: :race)
  step Contract::Persist()

  def model!(cxt, current_user:, params:, **)
    cxt['model'] = current_user.races.find_by(id: params[:id])
  end

  def parse_dates!(ctx, current_user:, params:, **)
    params = params.fetch(:race) { {} }

    #return true unless params['start_date(1i)']
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
end
