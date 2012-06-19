class Espp
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :contribution, :starting_price, :closing_price, :discount, :shares, :sale_price
  validates_presence_of :contribution, :starting_price, :closing_price, :discount

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    unless attributes.empty?
      self.contribution   = contribution.to_f
      self.starting_price = starting_price.to_f
      self.closing_price  = closing_price.to_f
      self.discount       = discount.to_f / 100

      self.sale_price = [self.starting_price, self.closing_price].min * (1 - self.discount)
      #abort "our contribution is #{self.contribution} and our sale_price is #{self.sale_price} and our starting price is #{self.starting_price} and our closing price is #{self.closing_price}"
      self.shares = (contribution / sale_price).to_i
    end
  end

  def persisted?
    false
  end
end
