module Api
  module V1
    class UserMonthlyReportGeneratorService
      def initialize(user)
        @user = user
        @races = races_from_this_month
        @cars = Car.where(id: @races.pluck(:car_id))
        @customers = Customer.where(id: @races.pluck(:customer_id))
      end

      def call
        return false if @races.blank?

        {
          customers_report: customers_report,
          cars_report: cars_report,
          races_report: races_report
        }
      end

      private

      def races_from_this_month
        @user.races#.where('start_date >= :start_date AND start_date <= :end_date', last_month_date_params)
      end

      def customers_report
        @customers.each_with_object(["Total customers: #{@customers.size}"]) do |customer, info|
          total_races_customer = @races.where(customer: customer).count
          info << "#{customer.company} - (#{customer.first_name} #{customer.last_name}) - RACES: #{total_races_customer}"
        end
      end

      def cars_report
        cars = CarReporter.new(@cars).each_car_report#.for_period(last_month_date_params)
        cars.each_with_object([]) do |row, result|
          result << "#{row.name} - Races: #{row.races_count}"
        end
      end

      def races_report
        @races.each_with_object(['Races in current month:']) do |race, result|
          total_money_spent = 0
          race.reports.each do |report|
            total_money_spent += report.fuel_cost * report.fuel
          end

          profit = race.race_price - total_money_spent

          result << "Race ##{race.id}, Car: ##{race.car_id} #{race.car.name}, Fuel consumption: #{race_fuel_report(race)}, money spent: #{total_money_spent}, PROFIT: #{profit}"
        end
      end

      def race_fuel_report(race)
        return 0 unless race_has_enough_reports?(race)

        reports = race.reports
        start_mileage = reports.minimum(:mileage)
        end_mileage = reports.maximum(:mileage)
        total_fuel = reports.sum(:fuel)

        (total_fuel / (end_mileage - start_mileage)).round(2) * 100
      end

      def race_has_enough_reports?(race)
        race.reports.size > 1
      end
    end
  end
end
