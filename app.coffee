# DOM HOOKS #
# buttons
action_btn = document.querySelector(".action-btn")
button_bar = document.querySelector('.button-bar')
fold_btn = document.querySelector(".fold")
check_call_btn = document.querySelector(".check-call")
bet_raise_btn = document.querySelector(".bet-raise")
hero_current_bet = document.querySelector(".hero-current-bet")
# graphics
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
defaultStackSize = 200
VillainStackSize = 200
heroIsDealer = false;
board = []
heroCards = []
villainCards = []
button_bar.style.visibility = 'hidden'
potSize = 0

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

    # render players cards
    renderPlayerCards()
    console.log 'villains cards: ', villainCards
    console.log 'Heros cards: ',heroCards
    console.log 'cards left: ',deck.length

dealNextStreet = (currentStreet) ->
    if currentStreet is 1
        dealFlop()
    else if currentStreet is 2
        dealTurn()
    else if currentStreet is 3
        dealRiver()

dealFlop = ->
    currentStreet++
    hero.clearCurrentBet()
    villain.clearCurrentBet()
    renderHandSrengths()
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

dealTurn = ->
    currentStreet++
    hero.clearCurrentBet()
    villain.clearCurrentBet()
    renderHandSrengths()
    cardId = Math.floor(Math.random() * deck.length)
    card = deck[cardId]
    board.push(card)
    deck.splice(cardId, 1)
    boardCard4.src = "assets/#{board[3].value}.png"
    console.log 'turn dealet, det er ' + deck.length + ' kort igjen'

dealRiver = ->
    currentStreet++
    hero.clearCurrentBet()
    villain.clearCurrentBet()
    renderHandSrengths()
    cardId = Math.floor(Math.random() * deck.length)
    card = deck[cardId]
    board.push(card)
    deck.splice(cardId, 1)
    boardCard5.src = "assets/#{board[4].value}.png"
    console.log 'river dealet, det er ' + deck.length + ' kort igjen'

endHand = ->
    console.log 'ending hand'

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
    else if pairs.length is 1 && trips.length is 0 && trips.length is 0
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

# CREATE CUSTOM FLOP
# testHeroHand = [ deck[0], deck[13] ]
# testBoard = [ deck[26], deck[30], deck[1], deck[14], deck[22]]
# console.log 'BOARD', testHeroHand
# console.log 'HERO', testBoard
# handStrength(testHeroHand, testBoard)


# RENDERING
renderEmptyCards = ->
    villainCard1DOM.src =  ""
    villainCard2DOM.src =  ""
    heroCard1DOM.src =  ""
    heroCard2DOM.src =  ""

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
        bet_raise_btn.innerHTML = 'Raise $' + facingAmount * 2

    
renderStacks = ->
    heroStackSize = hero.getStackSize()
    villainStackSize = villain.getStackSize()
    heroStack.innerHTML = '$' + heroStackSize
    villainStack.innerHTML = '$' + villainStackSize

renderBets = ->
    heroCurrentBet = hero.getCurrentBet()
    villainCurrentBet = villain.getCurrentBet()
    if heroCurrentBet > 0 
        hero_current_bet.innerHTML = '$' + heroCurrentBet
    else if heroCurrentBet is 0
        hero_current_bet.innerHTML = 'Check'
    if villainCurrentBet > 0 
        villain_current_bet.innerHTML = '$' + villainCurrentBet

clearBets = ->
    hero_current_bet.innerHTML = ''
    villain_current_bet.innerHTML = ''

renderDealerBtn = (player) ->
    if player is 'hero' 
        hero_dealer.innerHTML = 'D'
        villain_dealer.innerHTML = ''
    else
        villain_dealer.innerHTML = 'D'
        hero_dealer.innerHTML = ''

renderResetFlop = ->
    boardCard1.src = ""
    boardCard2.src = ""
    boardCard3.src = ""
    boardCard4.src = ""
    boardCard5.src = ""

renderPlayerCards = ->
    #render villain vards
    villainCard1DOM.src =  "assets/#{villainCards[0].value}.png"
    villainCard2DOM.src =  "assets/#{villainCards[1].value}.png"
    #render Hero cards
    heroCard1DOM.src = "assets/#{heroCards[0].value}.png"
    heroCard2DOM.src = "assets/#{heroCards[1].value}.png"

renderHandSrengths = ->
    heroStrength.innerHTML = getHandStrength(heroCards, board)
    villainStrength.innerHTML = getHandStrength(villainCards, board)
    

#
# VILLAIN LOGIC (ACTIONS) #
#
villainAct =  ->
    renderStacks()
    villainActingText = ''
    villainActing.innerHTML = 'Villain is acting..'
    isVillainDealer = !heroIsDealer
    console.log 'current street ', currentStreet
    setTimeout (->
        
        # PRE-FLOP ##############
        if currentStreet is 1
            # villain is dealer and acts first
            if villain.getCurrentBet() is 1
                #rand = Math.random() * 100
                rand = 50
                console.log 'RANDOM ', rand   
                if rand < 33
                    console.log 'checking'
                else if rand > 33 && rand < 66
                    console.log 'betting 10$'
                    betAmount = 10
                    villainActingText = 'Villain bets ' + betAmount
                    villain.bets(betAmount)
                    renderButtons(betAmount)
                else    
                    console.log 'betting 20$'
                    betAmount = 20
                    villainActingText = 'Villain bets ' + betAmount
                    villain.bets(20)
                    renderButtons(betAmount)
            # villain faces raise
            if hero.getCurrentBet() > 2
                rand = 50
                villain.calls(hero.getCurrentBet()-villain.getCurrentBet()) 
                villain.setCurrentBet(hero.getCurrentBet()) # helps update pot graphic
                villainActingText = 'Villain Calls '
                setTimeout ( ->
                    dealNextStreet(currentStreet)
                ), 2000

        # Villain not dealer
        else if currentStreet is 1
            #rand = Math.random() * 100
            rand = 50
            console.log 'RANDOM ', rand   
            if rand < 33
                console.log 'folding'
            else if rand > 33 && rand < 66
                console.log 'Villain has to call ' + hero.getCurrentBet()
                villain.calls(amountToCall)
            else    
                console.log 'raising'

        # FLOP ###############
        else if currentStreet is 2
            # villain checked to 
            if hero.getCurrentBet() is 0
                rand = Math.random() * 100
                console.log 'RANDOM ', rand   
                if rand < 33
                    console.log 'Villain checked the flop'
                    villainActingText = 'Villain checked'
                    setTimeout ( ->
                        dealNextStreet(currentStreet)
                    ), 500
                else if rand > 33 && rand < 66
                    console.log 'betting 10$'
                    betAmount = 10
                    villainActingText = 'Villain bets ' + betAmount
                    villain.bets(10)
                    renderButtons(betAmount)
                else    
                    console.log 'raising'
            else 
                # villain faces bet 
                rand = 50
                villain.calls(hero.getCurrentBet()-villain.getCurrentBet())
                villain.setCurrentBet(hero.getCurrentBet())
                villainActingText = 'Villain Calls '
                setTimeout ( ->
                    dealNextStreet(currentStreet)
                ), 2000

        # TURN #####################
        else if currentStreet is 3
            # villain checked to
            if hero.getCurrentBet() is 0
                if isVillainDealer is true 
                    rand = Math.random() * 100
                    console.log 'RANDOM ', rand   
                    if rand < 33
                        console.log 'Villain checked the turn'
                        villainActingText = 'Villain checked'
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 500
                    else if rand > 33 && rand < 66
                        console.log 'betting 10$'
                        betAmount = 10
                        villainActingText = 'Villain bets ' + betAmount
                        villain.bets(10)
                        renderButtons(betAmount)
                    else    
                        console.log 'raising'
            else 
                # villain faces bet
                rand = 50
                console.log 'SETTING VILLAIN BET', hero.getCurrentBet()
                villain.calls(hero.getCurrentBet()-villain.getCurrentBet())
                villain.setCurrentBet(hero.getCurrentBet())
                villainActingText = 'Villain Calls '
                setTimeout ( ->
                    dealNextStreet(currentStreet)
                ), 2000

        # RIVER #####################
        else if currentStreet is 4
            # villain checked to
            if hero.getCurrentBet() is 0
                if isVillainDealer is true 
                    rand = Math.random() * 100
                    console.log 'RANDOM ', rand   
                    if rand < 33
                        console.log 'Villain checked the turn'
                        villainActingText = 'Villain checked'
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 500
                    else if rand > 33 && rand < 66
                        console.log 'betting 10$'
                        betAmount = 10
                        villainActingText = 'Villain bets ' + betAmount
                        villain.bets(10)
                        renderButtons(betAmount)
                    else    
                        console.log 'raising'
            else 
                # villain faces bet
                rand = 50
                console.log 'SETTING VILLAIN BET', hero.getCurrentBet()
                villain.calls(hero.getCurrentBet()-villain.getCurrentBet())
                villain.setCurrentBet(hero.getCurrentBet())
                villainActingText = 'Villain Calls '
                setTimeout ( ->
                    endHand()
                ), 2000

        # THIS ALWAYS RUN WHEN VILLLAIN ACTS
        renderStacks()
        button_bar.style.visibility = 'visible'
        villainActing.innerHTML = villainActingText
    ), 2000

#
# HERO BUTTONS (ACTION LOGIC) #
#
fold = ->
    # just reset stuff
    villainActing.innerHTML = ''
    villain.winsPot()
    board = []
    renderResetFlop()
    renderEmptyCards()
    currentStreet = 0
    deck = getNewDeck()
    heroIsDealer = !heroIsDealer
    renderButtons(0)
    potDOM.innerHTML = 'Pot: '
    startHand()

betRaise = ->
    # the betsize sum inlcudes the bet already on table. This gets adjusted in Player.bet()
    hero.bets(50)
    villainAct()

checkCall = ->
    facingBet = villain.getCurrentBet() - hero.getCurrentBet()
    if facingBet is 0
        hero.setCurrentBet(facingBet)
        renderBets()
        villainAct()
        console.log 'RUNNING BET  ', facingBet
    else
        hero.setCurrentBet(villain.getCurrentBet())
        hero.calls(facingBet)
        console.log 'Calling bet :', facingBet
        console.log 'potSize ', potSize
        renderButtons(0)
        setTimeout ( ->
            dealNextStreet(currentStreet)
        ), 500


fold_btn.addEventListener 'click', fold
check_call_btn.addEventListener 'click', checkCall
bet_raise_btn.addEventListener 'click', betRaise

#
# CREATE PLAYER CLASSES
#
class Player
  constructor: (@stackSize, @currentBet) ->

  paySmallBlind: ->
    console.log 'paying small blind'
    @stackSize -= 1
    @currentBet = 1

  payBigBlind: ->
    console.log 'paying big blind'
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
    potSize = 0
    renderStacks()
    renderPot(potSize)

    # the betsize sum inlcudes the bet already on table. Adjusting this here
  bets: (amount) ->
    prevBet = @currentBet
    @currentBet = amount
    console.log ' RUNNING BETS IN class ', amount
    @stackSize -= (amount-prevBet)
    potSize += (amount-prevBet)
    renderPot(potSize)
    renderBets()
    renderStacks()
    console.log 'POTSIZE ',potSize

  calls: (amount) ->
    @stackSize -= (amount)
    potSize += (amount)
    renderBets()
    renderPot(potSize)
    renderStacks()
    
hero = new Player defaultStackSize, 0
villain = new Player defaultStackSize, 0


startHand = ->
    setTimeout ( ->
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
            renderButtons(villain.getCurrentBet())
            renderBets()
            renderStacks()
        # VILLAIN IS DEALER
        else 
            console.log 'VILLAIN ER DEALER'
            renderDealerBtn(villain)
            button_bar.style.visibility = 'hidden'
            hero.payBigBlind()
            villain.paySmallBlind()
            renderBets()
            villainAct()
        ), 500
    

startHand()