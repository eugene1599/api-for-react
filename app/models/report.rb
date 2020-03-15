class Report
  include Documentable

  field :mileage, type: Integer
  field :fuel, type: Float
  field :fuel_cost, type: Float

  belongs_to :race

  validate :current_mileage_should_be_greater_than_previous_or_eq
  validate :current_mileage_should_be_smaller_than_next, on: :update
  validates :fuel, presence: true, numericality: { only_integer: false, greater_than: 0 }
  validates :fuel_cost, presence: true, numericality: { only_integer: false, greater_than: 0 }
  validates :mileage, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def current_mileage_should_be_greater_than_previous_or_eq
    return if mileage_from_previous_report <= mileage

    errors.add(:mileage, 'should be greater or eq to last report')
  end

  def mileage_from_previous_report
    previous_report = race.reports.where(:created_at.lte => created_at || DateTime.current)
      .where(:id.ne => id)
      .order(mileage: :desc)
      .limit(1)
      .first

    return 0 unless previous_report

    previous_report.mileage
  end

  def current_mileage_should_be_smaller_than_next
    next_report = race.reports
                      .where('mileage >= :current_report', current_report: mileage_was)
                      .where.not(id: id).first

    return unless next_report
    return if next_report.mileage >= mileage

    errors.add(:mileage, "can't be greater than mileage from next report")
  end
end
