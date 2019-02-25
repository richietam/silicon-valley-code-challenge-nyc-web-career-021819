require 'pry'
require_relative './funding_round.rb'
require_relative './startup.rb'
require_relative './venture_capitalist.rb'


coffeeCo = Startup.new("CoffeeCo", "CoffeeDad", "Cofee")
teaInc = Startup.new("TeaInc", "TeeMom", "Tea")
pastryBros = Startup.new("PastryBros", "PastryDude", "Pastry")

diana= Venture_capitalist.new("diana", 15000000000)
rich= Venture_capitalist.new("rich", 5)
alex = Venture_capitalist.new("alex", 30000000000)
vicky = Venture_capitalist.new("vicky", 10000)

coffeeCo.sign_contract(diana, "Angel", 10000)
coffeeCo.sign_contract(alex, "Angel", 1000000)
teaInc.sign_contract(vicky, "Seed", 10000)
pastryBros.sign_contract(rich, "Series A", 10000)

diana.offer_contract(coffeeCo, "Series A", 20000)
alex.offer_contract(coffeeCo, "Series A", 100000)
rich.offer_contract(coffeeCo, "Series A", 1)
diana.offer_contract(teaInc, "Series B", 30000)


#
# coffeeCo.pivot("Tea", "CoffeeCo")
# print Startup.find_by_founder("CoffeeDad")
# #expect alex and diana
# Venture_capitalist.tres_commas_club
# #expect new instance of funding_found to include arguments given
# coffeeCo.total_funds expect to return 1,010,000
# coffeeCo.num_funding_rounds expect to return 2 rounds
# coffeeCo.investors to return list of investors
# coffeeCo.big_investors should return Diana and Alex

# diana.funding_rounds should return two instances of fundingRounds
# diana.portfolio should return two unique instances of funding
# diana.invested("Cofee") should return 30,000

puts Startup.all

binding.pry
0
