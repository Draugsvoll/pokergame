 
#         # RIVER #####################
#         #
#         else if currentStreet is 4
#             # facing no bet
#             if hero.getCurrentBet() is 0
#                 # check
#                 if rand < 33 
#                     # check as dealer -> next street
#                     if !heroIsDealer
#                         hideHeroActionBar = true;
#                         setTimeout ( ->
#                             dealNextStreet(currentStreet)
#                         ), 2000
#                     # check to hero if OOP
#                     else if heroIsDealer
#                         renderVillainCheckText()
#                 # small bet
#                 else if rand > 33 && rand < 66
#                     betAmount = hero.getCurrentBet()
#                     betAmount += 100
#                     villainCreateAndMakeBet(betAmount)
#                     renderButtons(betAmount)
#                 # big bet
#                 else if rand > 66
#                     betAmount = hero.getCurrentBet()
#                     betAmount += 200
#                     villainCreateAndMakeBet(betAmount)
#                     renderButtons(betAmount)
#             # facing bet
#             else if hero.getCurrentBet() > 0
#                 facingBet = hero.getCurrentBet() -villain.getCurrentBet()
#                 # fold
#                 if rand < 33
#                     villainFold()
#                     renderVillainFoldText()
#                     hideHeroActionBar = true
#                 # call
#                 else if rand < 66
#                     villain.calls(facingBet)
#                     renderVillainCallText()
#                     # call as dealer -> next street
#                     if !heroIsDealer
#                         setTimeout ( -> 
#                             dealNextStreet()
#                         ), 2000
#                     else if heroIsDealer
#                         renderButtons(0)
#                 # raise
#                 else if rand > 66
#                     betAmount = hero.getCurrentBet() * 2
#                     villainCreateAndMakeBet(betAmount)
#                     renderButtons(betAmount)





























# #######################
# #####################
# ###################
#        #
#         # RIVER #####################
#         #
#         else if currentStreet is 4
#             # facing check
#             if hero.getCurrentBet() is 0
#                 # check IP
#                 if rand < 33 && !heroIsDealer
#                     renderVillainCheckText()
#                     setTimeout ( ->
#                             dealNextStreet(currentStreet)
#                         ), 2000
#                     # check OOP
#                     if heroIsDealer
#                         # check to hero
#                         renderVillainCheckText()
#                 else if rand > 33 && rand < 66
#                     betAmount = hero.getCurrentBet()
#                     betAmount += 100
#                     villainCreateAndMakeBet(betAmount)
#                     renderButtons(betAmount)
#                 else if rand > 66
#                     betAmount = hero.getCurrentBet()
#                     betAmount += 200
#                     villainCreateAndMakeBet(betAmount)
#                     renderButtons(betAmount)
#             # villain faces bet river
#             else ####
#                 if rand < 33
#                     villainFold()
#                     renderVillainFoldText()
#                     hideHeroActionBar = true
#                 else if rand < 66
#                     betAmount = hero.getCurrentBet() - villain.getCurrentBet()
#                     hideHeroActionBar = true;
#                     villain.calls(betAmount) 
#                     renderVillainCallText()
#                     setTimeout ( ->
#                             dealNextStreet(currentStreet)
#                         ), 2000
#                 else
#                     betAmount = hero.getCurrentBet() 
#                     betAmount += 200
#                     villainCreateAndMakeBet(betAmount)
#                     renderButtons(betAmount)
