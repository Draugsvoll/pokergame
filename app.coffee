# DOM hooks
potDOM = document.querySelector('.pot')
action_btn = document.querySelector(".action-btn")
button_bar = document.querySelector('.button-bar')
fold_btn = document.querySelector(".fold")
check_call_btn = document.querySelector(".check-call")
bet_raise_btn = document.querySelector(".bet-raise")
hero_dealer = document.querySelector(".hero-dealer")
hero_current_bet = document.querySelector(".hero-current-bet")
heroCard1DOM = document.querySelector('#hero-card1')
heroCard2DOM = document.querySelector('#hero-card2')
heroStrength = document.querySelector('.hero-strength')
heroStack = document.querySelector('.hero-stack')
hero_dealer = document.querySelector(".hero-dealer")
villain_dealer = document.querySelector(".villain-dealer")
villain_current_bet = document.querySelector(".villain-current-bet")
villainStack = document.querySelector('.villain-stack')
villainCard1DOM = document.querySelector('#villain-card1')
villainCard2DOM = document.querySelector('#villain-card2')
villainStrength = document.querySelector('.villain-strength')
boardCard1 = document.querySelector('#board-card1')
boardCard2 = document.querySelector('#board-card2')
boardCard3 = document.querySelector('#board-card3')
boardCard4 = document.querySelector('#board-card4')
boardCard5 = document.querySelector('#board-card5')


# variables
currentStreet = 'new-hand'
defaultStackSize = 200
heroIsDealer = true;
isHerosTurn = true;
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


dealFlop = ->
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
    cardId = Math.floor(Math.random() * deck.length)
    card = deck[cardId]
    board.push(card)
    deck.splice(cardId, 1)
    boardCard4.src = "assets/#{board[3].value}.png"
    console.log 'turn dealet, det er ' + deck.length + ' kort igjen'

dealRiver = ->
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

updateHandStrengths = ->
    heroStrength.innerHTML = getHandStrength(heroCards, board)
    villainStrength.innerHTML = getHandStrength(villainCards, board)
##

# CREATE CUSTOM FLOP
# testHeroHand = [ deck[0], deck[13] ]
# testBoard = [ deck[26], deck[30], deck[1], deck[14], deck[22]]
# console.log 'BOARD', testHeroHand
# console.log 'HERO', testBoard
# handStrength(testHeroHand, testBoard)


# RENDERING
renderHeroStack = (stack) ->
    heroStack.innerHTML = '$' + stack 
renderVillainStack = (stack) ->
    villainStack.innerHTML = '$' + stack 
renderHeroCurrentBet = (betSize) ->
    hero_current_bet.innerHTML = '$' + betSize
renderVillainCurrentBet = (betSize) ->
    villain_current_bet.innerHTML = '$' + betSize

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
    

# ACTIONS LOGIC
heroAct = (currentStreet, potSize, facingAction) ->
    # PRE-FLOP
        

villainAct = (currentStreet, potSize, facingAction) ->
    setTimeout (->
         # AT NEW HAND
        if facingAction is 0
            #rand = Math.random() * 100
            rand = 20
            console.log 'RANDOM ', rand   
            if rand < 33
                console.log 'checking'
                renderHeroStack(hero.getStackSize())
                renderVillainStack(villain.getStackSize())
                isHerosTurn = true
                button_bar.style.visibility = 'visible'
            else if rand > 33 && rand < 66
                console.log 'betting'
            else    
                console.log 'raising'
    ), 2000
   

villainChecks = ->
    
    

# GAME TREE
nextAction = ->
    # PRE HAND
    if currentStreet is 'new-hand'
        dealCards()
        potSize = 3
        potDOM.innerHTML = 'Pot: $' + potSize
        # HERO IS DEALER
        if heroIsDealer is true 
            renderDealerBtn('hero')
            button_bar.style.visibility = 'visible'
            hero.paySmallBlind()
            villain.payBigBlind()
            renderHeroCurrentBet(1)
            renderVillainCurrentBet(2)
            renderHeroStack(hero.getStackSize())
            renderVillainStack(villain.getStackSize())
        # VILLAIN IS DEALER
        else 
            console.log 'VILLAIN ER DEALER'
            renderDealerBtn(villain)
            button_bar.style.visibility = 'hidden'
            hero.payBigBlind()
            villain.paySmallBlind()
            renderHeroCurrentBet(2)
            renderVillainCurrentBet(1)
            isHerosTurn = false
            facingAction = 0
            villainAct(currentStreet, potSize, facingAction)
            
        #next street
        currentStreet = 'pre-flop'

    # PRE-FLOP
    else if currentStreet is 'pre-flop'
        dealFlop()
        updateHandStrengths()
        currentStreet = 'flop'

    # FLOP
    else if currentStreet is 'flop'
        dealTurn()
        updateHandStrengths()
        currentStreet = 'turn'

    # TURN
    else if currentStreet is 'turn'
        dealRiver()
        updateHandStrengths()
        currentStreet = 'river'

    # RIVER
    else if currentStreet is 'river'
        endHand()

renderPot = ->

heroFold = ->
    villain.winsPot()
    board = []
    renderResetFlop()
    currentStreet = 'new-hand'
    deck = getNewDeck()
    heroIsDealer = !heroIsDealer
    nextAction()



action_btn.addEventListener 'click', nextAction
fold_btn.addEventListener 'click', heroFold
#check_call_btn.addEventListener 'click', check_call
#bet_raise_btn.addEventListener 'click', bet_raise

# CREATE PLAYER CLASSES
class Player
  constructor: (@stackSize) ->

  paySmallBlind: ->
    console.log 'paying small blind'
    @stackSize -= 1
    heroCurrentBet = 1

  payBigBlind: ->
    console.log 'paying big blind'
    @stackSize -= 2

  getStackSize: ->
    return @stackSize  

  winsPot: ->
    @stackSize += potSize
    potSize = 0
    renderVillainStack(@stackSize)
    renderPot()
hero = new Player (defaultStackSize)
villain = new Player (defaultStackSize)