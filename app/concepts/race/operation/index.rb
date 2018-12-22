class Race
  class Index < Trailblazer::Operation
    step :model!

    def model!(ctx, current_user:, **)
      ctx['model'] = current_user.races
    end
  end
end
