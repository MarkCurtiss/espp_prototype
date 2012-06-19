class Espp
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :contribution, :starting_price, :closing_price, :discount
  validates_presence_of :contribution, :starting_price, :closing_price, :discount

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    unless attributes.empty?
    end
  end

  def persisted?
    false
  end
end
