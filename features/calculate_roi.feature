Feature: Calculate ROI
  In order to figure out how much cash money I'm getting from my ESPP
  As an employee
  I want to figure out my ROI

  Scenario: Calculate
  Given I am on the new espp page
  When I fill in the following:
      | Contribution   | 10000 |
      | Starting Price | 15    |
      | Closing Price  | 18.75 |
      | Discount       | 15    |
  And I press "Calculate ROI"
  Then I should see "You purchased 784 shares at your discounted price of $12.75"
  And I should see "You sold them for $14700.0 for a profit of $4700.0"
  And I should see "If you sell today, your profit after taxes will be $3290.0 for an ROI of 0.329"
  And I should see "If you sell in 1 year, your profit after taxes will be $3995.0 for an ROI of 0.3995"
