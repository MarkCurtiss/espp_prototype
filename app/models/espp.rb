class Espp < ActiveRecord::Base
  attr_accessible :contribution, :starting_price, :closing_price, :discount
  validates_presence_of :contribution, :starting_price, :closing_price, :discount

  def sale_price
    [starting_price, closing_price].min * (1 - (discount / 100.0))
  end

  def shares
    (contribution / sale_price).to_i
  end

  def amount_from_sale
   shares * [starting_price, closing_price].max
  end

  def profit
    amount_from_sale - contribution
  end

  def profit_after_taxes_immediate
      profit * (1 - 0.30)
  end

  def roi_for_immediate_sale
    profit_after_taxes_immediate / contribution
  end

  def profit_after_taxes_delayed
    profit * (1 - 0.15)
  end

  def roi_for_delayed_sale
      profit_after_taxes_delayed / contribution
  end

end
