class CarReporter
  attr_accessor :relation

  def initialize(car_relation)
    @relation = car_relation.extending(Scopes)
  end

  def each_car_report
    @relation.left_joins(:races)
             .select('COUNT(races.id) as races_count, cars.*')
             .group('cars.id')
  end

  def report_for_each_car_type
    relation
      .left_joins(:races)
      .select('COUNT(races.id) AS races_count,
               COALESCE(SUM(races.cargo_weight), 0) AS total_weight,
               cars.car_type')
      .group('cars.car_type')
  end

  module Scopes
    def for_period(start_date: nil, end_date: nil)
      scoped = self
      scoped = scoped.where('races.start_date >= :start_date', start_date: start_date) if start_date
      scoped = scoped.where('races.start_date <= :end_date', end_date: end_date) if end_date
      scoped
    end
  end
end
