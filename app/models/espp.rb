class Espp
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :contribution, :starting_price, :closing_price, :discount, :shares, :sale_price, :amount_from_sale, :profit, :profit_after_taxes_immediate, :profit_after_taxes_delayed, :roi_for_immediate_sale, :roi_for_delayed_sale
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
      self.shares = (contribution / sale_price).to_i
      self.amount_from_sale = shares * [starting_price, closing_price].max
      self.profit = amount_from_sale - contribution

      self.profit_after_taxes_immediate = profit * (1 - 0.30)
      self.roi_for_immediate_sale = profit_after_taxes_immediate/contribution

      self.profit_after_taxes_delayed = profit * (1 - 0.15)
      self.roi_for_delayed_sale = profit_after_taxes_delayed/contribution

    end
  end

  def persisted?
    false
  end
end
