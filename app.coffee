# DOM HOOKS #
# buttons
button_bar = document.querySelector('.button-bar')
fold_btn = document.querySelector(".fold")
check_call_btn = document.querySelector(".check-call")
bet_raise_btn = document.querySelector(".bet-raise")
# graphics
hero_current_bet = document.querySelector(".hero-current-bet")
hero_current_action = document.querySelector(".hero-current-action")
potDOM = document.querySelector('.pot')
hero_dealer = document.querySelector(".hero-dealer")
heroStrength = document.querySelector('.hero-strength')
heroStack = document.querySelector('.hero-stack')
hero_dealer = document.querySelector(".hero-dealer")
villain_dealer = document.querySelector(".villain-dealer")
villain_current_bet = document.querySelector(".villain-current-bet")
villainStack = document.querySelector('.villain-stack')
villainCard1DOM = document.querySelector('#villain-card1')
villainCard2DOM = document.querySelector('#villain-card2')
villainStrength = document.querySelector('.villain-strength')
villainActing = document.querySelector(".villain-acting")
announcementText = document.querySelector(".table-text")
# cards
heroCard1DOM = document.querySelector('#hero-card1')
heroCard2DOM = document.querySelector('#hero-card2')
boardCard1 = document.querySelector('#board-card1')
boardCard2 = document.querySelector('#board-card2')
boardCard3 = document.querySelector('#board-card3')
boardCard4 = document.querySelector('#board-card4')
boardCard5 = document.querySelector('#board-card5')


# variables
currentStreet = 0
defaultStackSize = 1000
heroIsDealer = false;
board = []
heroCards = []
villainCards = []
button_bar.style.visibility = 'hidden'
potSize = 0
winner = undefined

# CREATE CARD DECK
getNewDeck = ->
  myNewDeck = [
    {
      value: '2H'
      rank: 2
    }
    {
      value: '3H'
      rank: 3
    }
    {
      value: '4H'
      rank: 4
    }
    {
      value: '5H'
      rank: 5
    }
    {
      value: '6H'
      rank: 6
    }
    {
      value: '7H'
      rank: 7
    }
    {
      value: '8H'
      rank: 8
    }
    {
      value: '9H'
      rank: 9
    }
    {
      value: '0H'
      rank: 10
    }
    {
      value: 'JH'
      rank: 11
    }
    {
      value: 'QH'
      rank: 12
    }
    {
      value: 'KH'
      rank: 13
    }
    {
      value: 'AH'
      rank: 14
    }
    {
      value: '2C'
      rank: 2
    }
    {
      value: '3C'
      rank: 3
    }
    {
      value: '4C'
      rank: 4
    }
    {
      value: '5C'
      rank: 5
    }
    {
      value: '6C'
      rank: 6
    }
    {
      value: '7C'
      rank: 7
    }
    {
      value: '8C'
      rank: 8
    }
    {
      value: '9C'
      rank: 9
    }
    {
      value: '0C'
      rank: 10
    }
    {
      value: 'JC'
      rank: 11
    }
    {
      value: 'QC'
      rank: 12
    }
    {
      value: 'KC'
      rank: 13
    }
    {
      value: 'AC'
      rank: 14
    }
    {
      value: '2S'
      rank: 2
    }
    {
      value: '3S'
      rank: 3
    }
    {
      value: '4S'
      rank: 4
    }
    {
      value: '5S'
      rank: 5
    }
    {
      value: '6S'
      rank: 6
    }
    {
      value: '7S'
      rank: 7
    }
    {
      value: '8S'
      rank: 8
    }
    {
      value: '9S'
      rank: 9
    }
    {
      value: '0S'
      rank: 10
    }
    {
      value: 'JS'
      rank: 11
    }
    {
      value: 'QS'
      rank: 12
    }
    {
      value: 'KS'
      rank: 13
    }
    {
      value: 'AS'
      rank: 14
    }
    {
      value: '2D'
      rank: 2
    }
    {
      value: '3D'
      rank: 3
    }
    {
      value: '4D'
      rank: 4
    }
    {
      value: '5D'
      rank: 5
    }
    {
      value: '6D'
      rank: 6
    }
    {
      value: '7D'
      rank: 7
    }
    {
      value: '8D'
      rank: 8
    }
    {
      value: '9D'
      rank: 9
    }
    {
      value: '0D'
      rank: 10
    }
    {
      value: 'JD'
      rank: 11
    }
    {
      value: 'QD'
      rank: 12
    }
    {
      value: 'KD'
      rank: 13
    }
    {
      value: 'AD'
      rank: 14
    }
  ]
  myNewDeck



deck = getNewDeck()

# CARD LOGIC
dealCards = ->
    currentStreet++

    # Villain cards
    villainCards = []
    cardId = Math.floor(Math.random() * deck.length)
    villainCards.push(deck[cardId])
    deck.splice(cardId, 1)
    cardId = Math.floor(Math.random() * deck.length)
    villainCards.push(deck[cardId])
    deck.splice(cardId, 1)

    # Hero cards
    heroCards = []
    cardId = Math.floor(Math.random() * deck.length)
    heroCards.push(deck[cardId])
    deck.splice(cardId, 1)
    cardId = Math.floor(Math.random() * deck.length)
    heroCards.push(deck[cardId])
    deck.splice(cardId, 1)

    renderPlayerCards()


dealNextStreet = (currentStreet) ->
    if currentStreet is 1
        renderButtons(0)
        dealFlop()
    else if currentStreet is 2
        renderButtons(0)
        dealTurn()
    else if currentStreet is 3
        renderButtons(0)
        dealRiver()
    else if currentStreet is 4
        button_bar.style.visibility = 'hidden'
        endHand()

dealFlop = ->
    currentStreet++
    renderEmptyTableGraphics()
    # Villain act first if OOP
    if heroIsDealer
        villainAct()
    else
        button_bar.style.visibility = 'visible'
    i = 3
    while i > 0
        cardId = Math.floor(Math.random() * deck.length)
        card = deck[cardId]
        board.push(card)
        deck.splice(cardId, 1)
        i--
    boardCard1.src = "assets/#{board[0].value}.png"
    boardCard2.src = "assets/#{board[1].value}.png"
    boardCard3.src = "assets/#{board[2].value}.png"
    console.log 'flop dealet, det er ' + deck.length + ' kort igjen'
    renderHandSrengths()

dealTurn = ->
    currentStreet++
    renderEmptyTableGraphics()
    if heroIsDealer
        villainAct()
    else    
        button_bar.style.visibility = 'visible'
    cardId = Math.floor(Math.random() * deck.length)
    card = deck[cardId]
    board.push(card)
    deck.splice(cardId, 1)
    boardCard4.src = "assets/#{board[3].value}.png"
    console.log 'turn dealet, det er ' + deck.length + ' kort igjen'
    renderHandSrengths()

dealRiver = ->
    currentStreet++
    renderEmptyTableGraphics()
    if heroIsDealer
        villainAct()
    else    
        button_bar.style.visibility = 'visible'
    cardId = Math.floor(Math.random() * deck.length)
    card = deck[cardId]
    board.push(card)
    deck.splice(cardId, 1)
    boardCard5.src = "assets/#{board[4].value}.png"
    console.log 'river dealet, det er ' + deck.length + ' kort igjen'
    renderHandSrengths()

# determine winning hand at end (rank by integers)
handRank = (hand) ->
    if hand.includes('Four')
        return 9
    else if hand.includes('Full')
        return 8
    else if hand.includes('Flush')
        return 7
    else if hand.includes('Straight')
        return 6
    else if hand.includes('Three')
        return 5
    else if hand.includes('Two')
        return 4
    else if hand.includes('Pair')
        return 3
    else
        return 2

endHand = ->
    # show villain hand
    villainCard1DOM.src = "assets/#{villainCards[0].value}.png"
    villainCard2DOM.src = "assets/#{villainCards[1].value}.png"

    # get players hands
    villainHand = getHandStrength(villainCards, board)
    heroHand = getHandStrength(heroCards, board)

    # hands output as integer
    villainHandStrength = handRank(villainHand)
    heroHandStrength = handRank(heroHand)

    console.log 'hero hand rank: ', heroHandStrength
    console.log 'villain hand rank: ', villainHandStrength

    console.log 'hero has hand: ', heroHand
    console.log 'villain has hand: ', villainHand

    if heroHandStrength > villainHandStrength
        announcementText.innerHTML = 'Hero wins with: '+ heroHand + '<br>' + potSize + '$'
        hero.winsPot()
    else if heroHandStrength < villainHandStrength
        announcementText.innerHTML = 'Villain wins with: '+ villainHand + '<br> Pot: ' + potSize + ' $'
        villain.winsPot()
    else
        announcementText.innerHTML = 'Split pot with: ' + heroHand

#
# GET HAND-STRENGTH INFORMATION
#
getHandStrength = (playerCards, board) ->
    handStrength = ['']
    # get the hand
    hand = []
    for card in playerCards
        hand.push(card)
    for card in board   
        hand.push(card)
    #check for hand strengths
    handStrength.push(hasFlush(hand))
    handStrength.push(hasPairsOrTripsOrQuads(hand))
    handStrength.push(hasStraight(hand))
    # return actual hand (the strongest one)
    for strength, index in handStrength
        if handStrength[index].includes('Four')
            return handStrength[index]
        else if strength.includes('house')
            return handStrength[index]
        else if strength.includes('Flush')
            return handStrength[index]
        else if strength.includes('Straight')
            return handStrength[index]
        else if strength.includes('Three')
            return handStrength[index]
        else if strength.includes('Two')
            return handStrength[index]
        else if strength.includes('Pair')
            return handStrength[index]
        else if strength.includes('High')
            return handStrength[index]
    
hasFlush = (hand) ->    
    suits = { hearts: 0, spades: 0, clubs: 0, diamonds: 0 } 
    # push suits in hand to new array
    for card, index in hand
        if card.value.includes('H')
            suits.hearts += 1
        else if card.value.includes('C')
            suits.clubs += 1
        else if card.value.includes('D')
            suits.diamonds += 1
        else if card.value.includes('S')
            suits.spades +=1
    # check for flush
    if suits.hearts >= 5
        return 'Flush in Hearts'
    else if suits.clubs >= 5  
        return 'Flush in clubs'
    else if suits.diamonds >= 5  
        return 'Flush in diamonds'
    else if suits.spades >= 5  
        return 'Flush in spades'
    else   
        return ' '

hasPairsOrTripsOrQuads = (hand) ->
    quads = []
    trips = []
    pairs = []
    ranks = [ 0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0, 0 ]

    #check every card in hand
    for card in hand
        rank = card.rank
        ranks[rank-2] +=1
    # check for how many of same
    for value, index in ranks
        if value is 2
            #index+1 IS ALSO the card value 
            pairs.push(index+1)
        else if value is 3
            trips.push(index+1)
        else if value is 4
            quads.push(index+1)
    # no pair (high card)
    if pairs.length is 0 && quads.length is 0 && trips.length is 0
            i = ranks.length
            while (i >= 0)
                if ranks[i] > 0
                    highCard = (i+2).toString()
                    return 'High card '+ highCard
                else
                i--
    # one pair
    else if pairs.length is 1 && trips.length is 0 && quads.length is 0
        pairs[0] += 1
        return 'Pair of ' + pairs[0].toString()
    # two pair
    else if pairs.length is 2
        pair1 = (pairs[0]+1).toString()
        pair2 = (pairs[1]+1).toString()
        outcome1 = "Two pairs " + pair1 + ' and ' + pair2
        return outcome1
    # three pair
    else if pairs.length is 3
        pair1 = (pairs[0]+1).toString()
        pair2 = (pairs[1]+1).toString()
        outcome1 = "Two pairs " + pair1 + ' and ' + pair2
        return outcome1
    # trips
    if trips.length is 1
        if pairs.length is 0
            card = (trips[0]+1).toString()
            return 'Three of a kind ' + card
        # full house
        if pairs.length is 1
            pair = pairs[0]+1
            trips = trips[0]+1
            outcome = 'Full house ' +  trips + '' + trips + '' + trips +  ' and ' + pair + '' + pair 
            return outcome
    # quads
    if quads.length is 1
        outcome = "Four of a kind " + (quads[0]+1).toString()
        return outcome

hasStraight = (hand) ->
    ranks = [ 0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0, 0 ]
    counter = 0
    startedCounting = false
    # place every card in correct order
    for card in hand
        rank = card.rank
        ranks[rank-2] +=1
    # loop cards
    for card, index in ranks
        # no straight if 3 cards of same value
        if ranks[index] is 3
        else if ranks[index] > 0
            if ranks[index+1]>0 && ranks[index+2]>0 && ranks[index+3]>0 && ranks[index+4]>0
                return 'Straight '
            else  
                return ' '

#
# RENDERING #
#
emptyTableForAnnouncementText = ->
    hero_current_action.innerHTML = ''
    hero_current_bet.innerHTML =''
    villainActing.innerHTML = ''
    villain_current_bet.innerHTML = ''
    hero_dealer.innerHTML = ''

clearHandStrengths = ->
    heroStrength.innerHTML = ''
    villainStrength.innerHTML = ''

renderBets = ->
    heroBet = hero.getCurrentBet()
    villainBet = villain.getCurrentBet()
    if heroBet is 0
        hero_current_bet.innerHTML = ''
    else
        hero_current_bet.innerHTML = '$' + heroBet
    if villainBet is 0
        if villain_current_bet.text = 'Check'
            #
        else
            villain_current_bet.innerHTML = ''
    else
        villain_current_bet.innerHTML = '$' + villainBet

renderVillainFoldText= ->
    villainActing.innerHTML = 'Fold'
renderVillainCheckText= ->
    villainActing.innerHTML = 'Check'
renderVillainCallText= ->
    villainActing.innerHTML = 'Call'
renderVillainBetText= ->
    villainActing.innerHTML = 'Bet'
    

renderHeroCheckText = ->
    hero_current_action.innerHTML = 'Check'
renderHeroCallText = ->
    hero_current_action.innerHTML = 'Call'
renderHeroBetText = ->
    hero_current_action.innerHTML = 'Check'

renderEmptyTableGraphics = ->
    # reset table graphics
    renderButtons(0)
    hero.clearCurrentBet()
    villain.clearCurrentBet()
    hero_current_action.innerHTML = ''
    villainActing.innerHTML = ''

renderEmptyHeroCards = ->
    heroCard1DOM.src = 'assets/empty.png'
    heroCard2DOM.src = 'assets/empty.png'
    

renderEmptyVillainCards = ->
    villainCard1DOM.src = 'assets/empty.png'
    villainCard2DOM.src = 'assets/empty.png'

renderPot = (amount) -> 
    potDOM.innerHTML = '$'+amount

renderButtons = (facingBet) ->
    if facingBet is 0
        fold_btn.innerHTML = 'Fold'
        check_call_btn.innerHTML = 'Check'
        bet_raise_btn.innerHTML = 'Bet'
    else 
        facingAmount = facingBet - hero.getCurrentBet()
        fold_btn.innerHTML = 'Fold'
        check_call_btn.innerHTML = 'Call $' + facingAmount
        bet_raise_btn.innerHTML = 'Raise $' + 100

    
renderStacks = ->
    heroStackSize = hero.getStackSize()
    villainStackSize = villain.getStackSize()
    heroStack.innerHTML = '$' + heroStackSize
    villainStack.innerHTML = '$' + villainStackSize
    

clearBets = ->
    hero_current_bet.innerHTML = ''
    villain_current_bet.innerHTML = ''

renderDealerBtn = (player) ->
    if player is 'hero' 
        hero_dealer.src = 'assets/button.png'
        villain_dealer.src = ''
    else
        villain_dealer.src = 'assets/button.png'
        hero_dealer.src = ''

renderResetFlop = ->
    boardCard1.src = ""
    boardCard2.src = ""
    boardCard3.src = ""
    boardCard4.src = ""
    boardCard5.src = ""

renderPlayerCards = ->
    #render villain vards
    villainCard1DOM.src =  "assets/purple_back.png"
    villainCard2DOM.src =  "assets/purple_back.png"
    #render Hero cards
    heroCard1DOM.src = "assets/#{heroCards[0].value}.png"
    heroCard2DOM.src = "assets/#{heroCards[1].value}.png"

renderHandSrengths = ->
    heroStrength.innerHTML = getHandStrength(heroCards, board)
    villainStrength.innerHTML = getHandStrength(villainCards, board)
    

#
# VILLAIN LOGIC (ACTIONS) #
#
villainCreateAndMakeBet = (betAmount) ->
    villainActing.innerHTML = 'Villain bets ' + betAmount
    villain.bets(betAmount)
    renderButtons(betAmount)
    renderBets()

villainFold = ->
    # just reset stuff & start hand
    hero.winsPot()
    renderEmptyVillainCards()
    currentStreet = 0
    deck = getNewDeck()
    heroIsDealer = !heroIsDealer
    button_bar.style.visibility = 'hidden'
    announcementText.innerHTML = 'Hero wins ' + potSize + '$'
    emptyTableForAnnouncementText()
    setTimeout ( ->
        startHand()
    ), 1500



################
#
#   VILLAIN BOT 
#
################
villainAct =  ->
    renderStacks()
    button_bar.style.visibility = 'hidden'
    villainActing.innerHTML = 'Villain is acting..'
    isVillainDealer = !heroIsDealer
    # wait for next street to show heros button bar again, instead of end of villainAct()
    buttonBarShowAfterNextStreet = false
    rand = Math.random() * 100 + 15
    #rand = 50
    setTimeout (->
        #
        # PRE-FLOP #
        #
        if currentStreet is 1
            facingBet = hero.getCurrentBet() - villain.getCurrentBet()
            # acts first if dealer
            if isVillainDealer
                # fold
                if rand < 33
                    villainFold()
                    renderVillainFoldText()
                # call
                else if rand > 33 && rand < 66
                    # villain only calls small blind
                    if facingBet is 1
                        villain.calls(1)
                    # villain calls a raise -> next street
                    else if facingBet > 1
                        villain.calls(facingBet)
                        buttonBarShowAfterNextStreet = true
                        setTimeout ( ->
                          dealNextStreet(currentStreet)
                        ), 1500
                    villainActing.innerHTML = 'Villain calls  '
                # raise
                else if rand > 66   
                        betAmount = hero.getCurrentBet() * 2
                        villainCreateAndMakeBet(betAmount)
            else
            # acting second OOP - preflop
                # react to Hero call blind
                if hero.getCurrentBet() is 2
                    # call blind
                    if rand < 50
                        villain.calls(hero.getCurrentBet()-villain.getCurrentBet())
                        villainActing.innerHTML = 'Villain Calls '
                        renderButtons(0) # clean buttons for new street
                        buttonBarShowAfterNextStreet = true
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 1500
                    else if rand > 50
                        betAmount = hero.getCurrentBet() + 98
                        villainCreateAndMakeBet(betAmount)
                # hero raised pre-flop
                if hero.getCurrentBet() > 2
                    # fold to raise
                    if rand < 33
                        villainFold()
                        renderVillainFoldText()
                    # call
                    if rand > 33 && rand < 66
                        villain.calls(hero.getCurrentBet()-villain.getCurrentBet())
                        villainActing.innerHTML = 'Villain Calls '  
                        renderButtons(0) # clean buttons for new street
                        buttonBarShowAfterNextStreet = true
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 1500     
                    # raise
                    else if rand > 66
                        betAmount = hero.getCurrentBet() * 2
                        villainCreateAndMakeBet(betAmount)
        ##
        # FLOP ###############
        ##
        else if currentStreet is 2
            # facing check
            if hero.getCurrentBet() is 0
                if rand < 33
                    # villain check -> next street if dealer
                    villainActing.innerHTML = 'Villain checked'
                    if !heroIsDealer
                        buttonBarShowAfterNextStreet = true
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 1500
                # villain bet small
                else if rand > 33 && rand < 66
                    betAmount = hero.getCurrentBet()
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
                # villain bet big
                else if rand > 66
                    betAmount = hero.getCurrentBet() + 100
                    villainCreateAndMakeBet(betAmount)
            # villain faces bet flop
            else 
                if rand < 33
                    villainFold()
                    renderVillainFoldText()
                else if rand < 66
                    # CALL
                    villain.calls(hero.getCurrentBet()-villain.getCurrentBet()) 
                    renderButtons(0)
                    buttonBarShowAfterNextStreet = true
                    setTimeout ( ->
                        dealNextStreet(currentStreet)
                    ), 1500
                else    
                    # RAISE
                    betAmount = hero.getCurrentBet() 
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)

        ##
        # TURN #####################
        ##
        else if currentStreet is 3
            # facing check
            if hero.getCurrentBet() is 0
                # check
                if rand < 33
                    villainActing.innerHTML = 'Villain checked'
                    # next street if check as dealer
                    if !heroIsDealer
                        buttonBarShowAfterNextStreet = true
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 1500 
                    
                else if rand > 33 && rand < 66
                    betAmount = hero.getCurrentBet()
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
                else    
                    betAmount = hero.getCurrentBet()
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
            else 
                # villain faces bet turn
                villain.calls(hero.getCurrentBet()-villain.getCurrentBet()) 
                renderButtons(0)
                villainActingText = 'Villain Calls '
                buttonBarShowAfterNextStreet = true
                setTimeout ( ->
                    dealNextStreet(currentStreet)
                ), 1500

        #
        # RIVER #####################
        #
        else if currentStreet is 4
            # facing check
            if hero.getCurrentBet() is 0
                # check IP
                if rand < 33 && !heroIsDealer
                    villainActing.innerHTML = 'Villain checks'
                    setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 1500
                    # check OOP
                    if heroIsDealer
                        # check to hero
                        renderVillainCheckText()
                        villainActing.innerHTML = 'Villain checks'
                else if rand > 33 && rand < 66
                    betAmount = hero.getCurrentBet()
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
                else    
                    betAmount = hero.getCurrentBet()
                    betAmount += 200
                    villainCreateAndMakeBet(betAmount)
            else # villain faces bet river
                if rand < 33
                    villainFold()
                    renderVillainFoldText()
                else if rand < 66
                    villain.calls(hero.getCurrentBet()-villain.getCurrentBet()) 
                    villainActing.innerHTML = 'Villain calls'
                    setTimeout ( ->
                        dealNextStreet()
                    ), 1500
                else
                    betAmount = hero.getCurrentBet() 
                    betAmount += 200
                    villainCreateAndMakeBet(betAmount)

        # THIS ALWAYS RUN WHEN VILLLAIN ACTS
        renderStacks()
        if buttonBarShowAfterNextStreet
            button_bar.style.visibility = 'hidden'
        else
            button_bar.style.visibility = 'visible'
    ), 2000

#
# HERO BUTTONS (ACTION LOGIC) #
#

# FOLD BUTTON LOGIC
heroFold = ->
    # just reset stuff & start new hand
    villain.winsPot()
    renderEmptyHeroCards()
    currentStreet = 0
    deck = getNewDeck()
    heroIsDealer = !heroIsDealer
    hero_current_action.innerHTML = 'Fold'
    emptyTableForAnnouncementText()
    announcementText.innerHTML = 'Villain wins: ' + potSize + '$'
    setTimeout ( ->
        startHand()
    ), 2000

#
# BET/RAISE BUTTON LOGIC
#
betRaise = ->
    # the betsize sum inlcudes the players bet already on table. This gets adjusted in Player.bet()
    amount = villain.getCurrentBet()
    amount += 100
    hero_current_action.innerHTML = ''
    hero.bets(amount)   
    renderBets()
    villainAct()

#
# CHECK/CALL BUTTON LOGIC
#
checkCall = ->
    facingBet = villain.getCurrentBet() - hero.getCurrentBet()

    # check/call as dealer preflop
    if currentStreet is 1 && heroIsDealer  
        # calling SB 
        if facingBet is 1
            hero.calls(1)
            villainAct()
        # calling raise 
        else if facingBet > 1
            hero.calls(facingBet)
            hero_current_action.innerHTML = ''
            setTimeout ( ->
                dealNextStreet(currentStreet)
            ), 2000
    # check/call OOP preflop 
    else if currentStreet is 1 && !heroIsDealer
        hero.calls(facingBet)
        if facingBet > 0
            hero_current_action.innerHTML = ''
        setTimeout ( ->
            dealNextStreet(currentStreet)
        ), 2000
    # regular check/call
    else 
        # check/call IP -> always next street
        if heroIsDealer
            hero.calls(facingBet)
            if facingBet is 0
                renderHeroCheckText()
            setTimeout ( ->
                dealNextStreet(currentStreet)
            ), 2000
        # check/call OOP 
            
        # check to villain
        else if facingBet is 0 
            hero.calls(facingBet)
            renderHeroCheckText()
            villainAct()
        # call a bet -> next street
        else if facingBet > 0
            hero.calls(facingBet)
            hero_current_action.innerHTML = ''
            setTimeout ( ->
                dealNextStreet(currentStreet)
            ), 2000
    button_bar.style.visibility = 'hidden'
    renderBets()




fold_btn.addEventListener 'click', heroFold
check_call_btn.addEventListener 'click', checkCall
bet_raise_btn.addEventListener 'click', betRaise

#
# CREATE PLAYER CLASSES
#
class Player
  constructor: (@stackSize, @currentBet) ->

  paySmallBlind: ->
    @stackSize -= 1
    @currentBet = 1

  payBigBlind: ->
    @stackSize -= 2
    @currentBet = 2

  getStackSize: ->
    return @stackSize  

  getCurrentBet: ->
    return @currentBet

  setCurrentBet: (amount) ->
    @currentBet = amount

  clearCurrentBet: ->
    @currentBet = 0
    clearBets()

  winsPot: ->
    @stackSize += potSize
    renderStacks()

    # the betsize sum inlcudes the bet already on table. Adjusting this here
  bets: (amount) ->
    prevBet = @currentBet
    @currentBet = amount
    @stackSize -= (amount-prevBet)
    potSize += (amount-prevBet)
    renderPot(potSize)
    renderStacks()
    renderButtons(amount)

  calls: (amount) ->
    @currentBet += amount
    @stackSize -= (amount)
    potSize += (amount)
    renderPot(potSize)
    renderStacks()
    renderBets()
    
hero = new Player defaultStackSize, 0
villain = new Player defaultStackSize, 0


startHand = ->
    setTimeout ( ->
        board = []
        renderResetFlop()
        announcementText.innerHTML = ''
        villainActing.innerHTML = ''
        hero_current_action.innerHTML = ''
        renderButtons(0)
        currentStreet = 0
        dealCards()
        potSize = 3
        potDOM.innerHTML = 'Pot: $' + potSize
        # HERO IS DEALER
        if heroIsDealer is true 
            renderDealerBtn('hero')
            button_bar.style.visibility = 'visible'
            hero.paySmallBlind()
            villain.payBigBlind()
            renderBets()
            renderButtons(villain.getCurrentBet())
            renderStacks()
        else 
            # VILLAIN IS DEALER
            renderDealerBtn(villain)
            button_bar.style.visibility = 'hidden'
            hero.payBigBlind()
            villain.paySmallBlind()
            renderBets()
            villainAct()
        ), 500
    
startHand()