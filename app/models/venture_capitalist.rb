class Venture_capitalist
  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all<< self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    #return array of venture capitalist with total worth > 1B
    tres_commas_club = []
    @@all.each do |venture_capitalist|
      if venture_capitalist.total_worth > 1000000000
        tres_commas_club << venture_capitalist.name
      end
    end
  tres_commas_club
  end

#given startup object (type of investment) and amount invested as a float
# create new funding round
#associate /w startup and venture capitalist
  def offer_contract(startup, type, investment_amount)
    FundingRound.new(startup, self, type, investment_amount)
  end

#return array of all funding rounds
  def funding_rounds
    FundingRound.all.select do |fundingRound|
      fundingRound.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |fundingRound|
      fundingRound.startup
    end.uniq
  end

#return largest funding round given by this venture capitalist
  def biggest_investment
    funding_rounds.sort_by do |fundingRound|
      fundingRound.investment_amount
    end.last
  end

#given domain string, return total invested in that domain
#domain is inside startup instance

  def funding_rounds_by_domain(domain)
    funding_rounds.select do |fundingRound|
      fundingRound.startup.domain == domain
    end
end

  def invested(domain)
    arr = funding_rounds_by_domain(domain)
    # var= arr.map do |fundingRound|
    #
    #   fundingRound.investment_amount
    #   end
    #   var.inject(:+)

    arr.inject(0) do |result, fundingRound|
      result + fundingRound.investment_amount
      end
    end
