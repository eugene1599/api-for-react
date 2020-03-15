class RaceSerializer < Blueprinter::Base
  identifier :id do |obj|
    obj.id.to_s
  end

  fields :start_date, :end_date, :cargo_weight, :race_price, :created_at, :updated_at

  %i[car_id customer_id].each do |relation_id|
    field relation_id do |obj|
      obj.public_send(relation_id).to_s
    end
  end
end
