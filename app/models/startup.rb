class Startup

  attr_accessor :name_startup
  attr_reader :name_founder, :domain

  @@all = []

  def initialize(name_startup, name_founder, domain)
    @name_startup = name_startup
    @name_founder = name_founder
    @domain = domain
    @@all << self
  end

  def name
    "#{self.name_startup}"
  end

  def pivot(domain, name_startup)
    @domain = domain
    @name_startup = name_startup
  end

  def self.all
    @@all
  end

#iterate through @@all, find instance of founder name
#then iterate through that instance to find first startup_name
  def self.find_by_founder(founderName)
    startupsByFounder = []
    firstStartUpByFounder = nil
    @@all.select do |startup|
        if startup.name_founder == founderName
          startupsByFounder << startup
        end
      startupsByFounder.find do |startup2|
        firstStartUpByFounder = startup2.name_startup
      end
    end
    firstStartUpByFounder
  end

  def sign_contract(venture_capitalist, type, investment_amount)
    FundingRound.new(self, venture_capitalist, type, investment_amount)
  end

#get number of funding rounds Angel, Pre-Seed, Seed, Series A, Series B, Series C
#create array of possible funding rounds
  def num_funding_rounds
    counter = 0
    FundingRound.all.each do |fundingRound|
      if fundingRound.startup == self
        counter += 1
      end
    end
    counter
  end


#return total sum of all funding rounds for startup
#iterate over .FundingRound instances to find startup in question
#sum all funding
  def total_funds
    sum = 0
    FundingRound.all.each do |fundingRound|
      if fundingRound.startup == self
        sum += fundingRound.investment_amount
      end
    end
    sum
  end

  def investors
    ventCapArr =[]
    FundingRound.all.each do |fundingRound|
      if fundingRound.startup == self
        ventCapArr << fundingRound.venture_capitalist
      end
    end
      ventCapArr.uniq
    end

#return unique array of investors in the tres_commas_club
#find all instances of investor in this instance
    def big_investors
      fundingRounds = []
      FundingRound.all.each do |fundingRound|
        if fundingRound.startup == self
          fundingRounds << fundingRound.venture_capitalist
        end
      end
        fundingRounds.map do |fundRound|
          if fundRound.total_worth > 1000000000
            fundRound
          end
    end
  end

end
