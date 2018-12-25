class Report < ApplicationRecord
  belongs_to :race

  validate :check_race_owner
  validate :current_mileage_should_be_greater_than_previous_or_eq
  validate :current_mileage_should_be_smaller_than_next, on: :update
  validates :fuel, presence: true, numericality: { only_integer: false, greater_than: 0 }
  validates :fuel_cost, presence: true, numericality: { only_integer: false, greater_than: 0 }
  validates :mileage, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def check_race_owner
    return if race.user.races.exists?(id: race.id)

    errors.add(:race_id, 'not owned by this user')
  end

  def current_mileage_should_be_greater_than_previous_or_eq
    return if mileage_from_previous_report <= mileage

    errors.add(:mileage, 'should be greater or eq to last report')
  end

  def mileage_from_previous_report
    return 0 unless race.reports.first.persisted?

    return race.reports.where.not(id: nil).last.mileage unless persisted?

    return 0 if race.reports.first.id == id

    race.reports
        .where('mileage <= :current_report', current_report: mileage)
        .where.not(id: id).last.mileage
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
