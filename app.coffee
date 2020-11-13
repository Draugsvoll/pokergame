# Imports
#import test from "./modules/test.coffee"
#console.log(log)

# DOM HOOKS #

# buttons
button_bar = document.querySelector('.button-bar')
fold_btn = document.querySelector(".fold")
check_call_btn = document.querySelector(".check-call")
bet_raise_btn = document.querySelector(".bet-raise")
new_hand_btn = document.querySelector(".new-hand-btn")

# table graphics
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

# avatars
hero_image = document.querySelector("#hero-image")
villain_image = document.querySelector("#villain-image")


# variables
currentStreet = 0
defaultStackSize = 2000
heroIsDealer = true;
board = []
heroCards = []
villainCards = []
button_bar.style.visibility = 'hidden'
potSize = 0
announcementText.innerHTML = 'asd'
villainStrength.style.visibility = "hidden"
villain_dealer.style.visibility = "hidden"
villain_dealer.style.visibility = "hidden"
actingTime = 500


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
    # glowing effect
    if heroIsDealer
        hero_image.className = " glowing"
        villain_image.classList.remove("glowing")
    else
        villain_image.className = " glowing"
        hero_image.classList.remove("glowing")

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
        dealFlop()
        renderButtons(0)
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
    hero.clearCurrentBet()
    villain.clearCurrentBet()
    # glowing effect
    if heroIsDealer
        villain_image.className = " glowing"
        hero_image.classList.remove("glowing")
    else
        hero_image.className = " glowing"
        villain_image.classList.remove("glowing")
    renderEmptyTableGraphics()

    # Villain act first OOP
    if heroIsDealer
        setTimeout ( -> 
            villainAct()
        ), 800
    # hero act first
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
    hero.clearCurrentBet()
    villain.clearCurrentBet()
    # glowing effect
    if heroIsDealer
        hero_image.className = " glowing"
        villain_image.classList.remove("glowing")
    else
        villain_image.className = " glowing"
        hero_image.classList.remove("glowing")
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
    hero.clearCurrentBet()
    villain.clearCurrentBet()
    # glowing effect
    if heroIsDealer
        hero_image.className = " glowing"
        villain_image.classList.remove("glowing")
    else
        villain_image.className = " glowing"
        hero_image.classList.remove("glowing")
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


endHand = ->
    # hide new hand btn
    new_hand_btn.style.display = "block"
    # show villain hand
    villainCard1DOM.src = "assets/#{villainCards[0].value}.png"
    villainCard2DOM.src = "assets/#{villainCards[1].value}.png"
    villainStrength.style.display = ""
    villainStrength.style.visibility = "visible"
    # get players hand strength
    villainHand = getHandStrength(villainCards, board)
    villainHand = getHandStrength(villainCards, board)
    heroHand = getHandStrength(heroCards, board)
    # hand strengths output as integer
    villainHandStrength = handRank(villainHand)
    heroHandStrength = handRank(heroHand)

    # declare winner
    if heroHandStrength > villainHandStrength
        winner = 'Hero'
        announcement = 'Hero wins ' + potSize + '$'
        hero.winsPot()
    else if heroHandStrength < villainHandStrength
        winner = 'Villain'
        announcement = 'Villain wins ' + potSize + ' $'
        villain.winsPot()
    # split pot
    else
        winner = 'Split'
        announcement = 'Split pot '
        amount = potSize / 2
        hero.stackSize += amount
        villain.stackSize += amount

    # show end of hand text
    emptyTableForAnnouncementText()
    announcementText.innerHTML = announcement 
    hero_current_bet.style.visibility = "hidden"
    button_bar.style.display = "none"
    heroIsDealer = !heroIsDealer


#
# GET HAND-STRENGTH INFORMATION
#
getHandStrength = (playerCards, board) ->
    handStrengths = ['']
    strongestHand = ['']
    rank = 0
    # get the hand
    hand = []
    for card in playerCards
        hand.push(card)
    for card in board   
        hand.push(card)
    # check for all hand strengths
    handStrengths.push(hasFlush(hand))
    handStrengths.push(hasPairsOrTripsOrQuads(hand))
    handStrengths.push(hasStraight(hand))

    # return the strongest one
    for strength, index in handStrengths
        if handStrengths[index].includes('Four')
            rank = 9
            strongestHand = []
            strongestHand.push(handStrengths[index])
        else if strength.includes('house')
            if rank < 8
                rank = 8
                strongestHand = []
                strongestHand.push(handStrengths[index])
        else if strength.includes('Flush')
            if rank < 7
                rank = 7
                strongestHand = []
                strongestHand.push(handStrengths[index])
        else if strength.includes('Straight')
            if rank < 6
                rank = 6
                strongestHand = []
                strongestHand.push(handStrengths[index])
        else if strength.includes('Three')
            if rank < 5
                rank = 5
                strongestHand = []
                strongestHand.push(handStrengths[index])
        else if strength.includes('Two')
            if rank < 4
                rank = 4
                strongestHand = []
                strongestHand.push(handStrengths[index])
        else if strength.includes('Pair')
            if rank < 3
                rank = 3
                strongestHand = []
                strongestHand.push(handStrengths[index])
        else if strength.includes('High card')
            if rank < 2
                rank = 2
                strongestHand = []
                strongestHand.push(handStrengths[index])

    return strongestHand[0]

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
    else if hand.includes('High')
        return 2

# kicker for ranked type hands
getKicker = (ranks) ->
        j = ranks.length
        while j > 0
            kicker = ''
            if ranks[j-1] is 1
                kicker = j+1
                return kicker
                j=0
            j--

    
hasFlush = (hand) ->    
    suits = { hearts: 0, spades: 0, clubs: 0, diamonds: 0 } 
    ranks = [ 0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0, 0 ] # used to track high cards

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
        for card in hand
            if card.value.includes('H')
                rank = card.rank
                # place the card rank in the array with same index. Card '4H' gets placed in the fourth element-> rank[3]
                ranks[rank-2] +=1
                kicker = getKicker(ranks)
        return 'Flush in Hearts' + ', ' + kicker + ' high'
    else if suits.clubs >= 5  
        for card in hand
            if card.value.includes('C')
                rank = card.rank
                ranks[rank-2] +=1
                kicker = getKicker(ranks)
        return 'Flush in clubs' + ', ' + kicker + ' high'
    else if suits.diamonds >= 5  
        for card in hand
            if card.value.includes('D')
                rank = card.rank
                ranks[rank-2] +=1
                kicker = getKicker(ranks)
        return 'Flush in diamonds' + ', ' + kicker + ' high'
    else if suits.spades >= 5  
        for card in hand
            if card.value.includes('S')
                rank = card.rank
                ranks[rank-2] +=1
                kicker = getKicker(ranks)
        return 'Flush in spades' + ', ' + kicker + ' high'
    else   
        return ' '

hasPairsOrTripsOrQuads = (hand) ->
    # these arrays keeps track of hand strengths registered
    quads = [] 
    trips = []
    pairs = []
    ranks = [ 0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0, 0 ]

    # check every card in hand
    for card in hand
        rank = card.rank
        # place the card rank in the array with same index. Card '4H' gets placed in the fourth element-> rank[3]
        ranks[rank-2] +=1
    # check for how many of same
    for value, index in ranks
        if value is 2
            #index+1 IS ALSO EQUAL to the card rank
            pairs.push(index+1)
        else if value is 3
            trips.push(index+1)
        else if value is 4
            quads.push(index+1)
    kicker = getKicker(ranks)
    # no pair (high card)
    if pairs.length is 0 && quads.length is 0 && trips.length is 0
            i = ranks.length
            while (i >= 0)
                if ranks[i] > 0
                    highCard = (i+2).toString()
                    return 'High card '+ highCard
                else
                i--
    # ONE PAIR
    else if pairs.length is 1 && trips.length is 0 && quads.length is 0
        # the actual pair
        pairs[0] += 1
        return 'Pair of ' + pairs[0].toString() + ', ' + kicker + ' kicker'
    # two pair
    else if pairs.length is 2
        pair1 = (pairs[0]+1).toString()
        pair2 = (pairs[1]+1).toString()
        outcome = "Two pairs " + pair1 + ' and ' + pair2 + ', ' + kicker + ' kicker'
        return outcome
    # three pair
    else if pairs.length is 3
        pair1 = (pairs[0]+1).toString()
        pair2 = (pairs[1]+1).toString()
        outcome = "Two pairs " + pair1 + ' and ' + pair2 + ', ' + kicker + ' kicker'
        return outcome
    # trips
    if trips.length is 1
        if pairs.length is 0
            card = (trips[0]+1).toString()
            return 'Three of a kind ' + card + ', ' + kicker + ' kicker'
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
                kicker = getKicker(ranks)
                kicker = kicker.toString()
                return 'Straight ' + kicker + ' high'
            else    
                return ''

#
# RENDERING #
#
# bruker denne kun på river. Gjør det manuelt på earlier streets (different changes)
emptyTableForAnnouncementText = ->
    hero_current_action.style.visibility = "hidden"
    villainActing.style.visibility = "hidden"
    villain_current_bet.style.visibility = 'hidden'
    hero_dealer.style.visibility = "hidden"
    villain_dealer.style.visibility = "hidden"
    announcementText.style.visibility = "visible"

renderBets = ->
    heroBet = hero.getCurrentBet()
    villainBet = villain.getCurrentBet()

    # hero
    if heroBet is 0
        hero_current_bet.innerHTML = ''
    else
        hero_current_bet.innerHTML = '$' + heroBet
    # villain
    if villainBet is 0
        if villain_current_bet.text = 'Check'
        else
            villain_current_bet.innerHTML = ''
    else
        villain_current_bet.innerHTML = '$' + villainBet

renderVillainFoldText= ->
    villainActing.innerHTML = 'Fold'
renderVillainCheckText= ->
    villainActing.innerHTML = 'Check'
renderVillainCallText= ->
    villainActing.innerHTML = 'Call ' + villain.getCurrentBet()
renderVillainBetText= ->
    villainActing.innerHTML = 'Bet ' + villain.getCurrentBet()
    

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
    potDOM.innerHTML = 'Pot: $' + amount

renderButtons = (facingBet) ->
    hero_image.className = " glowing"
    villain_image.classList.remove("glowing")

    # facing no bet
    if facingBet is 0
        fold_btn.innerHTML = 'Fold'
        check_call_btn.innerHTML = 'Check'
        bet_raise_btn.innerHTML = 'Bet $' + (facingBet+100)
    # facing small blind
    else if facingBet is 1
        fold_btn.innerHTML = 'Fold'
        check_call_btn.innerHTML = 'Call $' + facingBet
        bet_raise_btn.innerHTML = 'Raise $' + 100
    # facing bet
    else
        fold_btn.innerHTML = 'Fold'
        check_call_btn.innerHTML = 'Call $' + (facingBet-hero.getCurrentBet())
        bet_raise_btn.innerHTML = 'Raise $' + (facingBet+100)

    
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
        hero_dealer.style.visibility = "visible"
        villain_dealer.style.visibility = "hidden"
    else if player is 'villain'
        hero_dealer.style.visibility = "hidden"
        villain_dealer.style.visibility = "visible"

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
    setTimeout ( -> 
        heroCard1DOM.src = "assets/#{heroCards[0].value}.png"
        heroCard2DOM.src = "assets/#{heroCards[1].value}.png"
    ), 175

renderHandSrengths = ->
    heroStrength.innerHTML = getHandStrength(heroCards, board)
    villainStrength.innerHTML = getHandStrength(villainCards, board)
    
#
# VILLAIN LOGIC (ACTIONS) #
#
villainCreateAndMakeBet = (betAmount) ->
    villainActing.innerHTML = 'Villain bets ' 
    hero_current_action.innerHTML = ''
    villain.bets(betAmount)
    renderButtons(betAmount)
    renderBets()

villainFold = ->
    renderEmptyVillainCards()
    renderVillainFoldText()
    button_bar.style.visibility = 'hidden'

    setTimeout ( -> 
        hero.winsPot()
        # reset stuff for new hand
        currentStreet = 0
        deck = getNewDeck()
        heroIsDealer = !heroIsDealer

        # end of hand text
        emptyTableForAnnouncementText()
        hero_current_action.innerHTML = 'Fold'
        announcementText.innerHTML = 'Hero wins: ' + potSize + '$'
        setTimeout ( ->
            startHand()
        ), 200
    ), 200
    

################
#
#   VILLAIN BOT 
#
################
villainAct =  ->
    # render graphics
    renderStacks()
    button_bar.style.visibility = 'hidden'
    villainActing.style.visibility = "visible"
    villainActing.innerHTML = 'Acting..'
    hideHeroActionBar = false
    # glowing effect
    villain_image.className = " glowing"
    hero_image.classList.remove("glowing")

    isVillainDealer = !heroIsDealer
    #rand = Math.random() * 100 + 20
    rand = 80
    setTimeout (->
        #
        # PRE-FLOP #
        #
        if currentStreet is 1
            facingBet = hero.getCurrentBet() - villain.getCurrentBet()
            # villain is dealer
            if isVillainDealer
                # fold
                if rand < 33
                    villainFold()
                    renderVillainFoldText()
                    hideHeroActionBar = true
                # call
                else if rand > 33 && rand < 66
                    # villain only calls small blind
                    if facingBet is 1
                        villain.calls(1)
                        renderVillainCallText()
                        renderButtons(0)
                    # villain calls a raise -> next street
                    else if facingBet > 1
                        villain.calls(facingBet)
                        renderVillainCallText()
                        hideHeroActionBar = true
                        setTimeout ( ->
                          dealNextStreet(currentStreet)
                        ), 200
                    renderVillainCallText()
                # raise
                else if rand > 66   
                        betAmount = hero.getCurrentBet() * 2
                        villainCreateAndMakeBet(betAmount)
                        renderButtons(betAmount)

            # villain not dealer
            else
                # react to Hero call blind
                if hero.getCurrentBet() is 2
                    if rand <= 50
                        renderVillainCheckText()
                        hideHeroActionBar = true;
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 200
                    else if rand > 50
                        betAmount = hero.getCurrentBet() + 98
                        villainCreateAndMakeBet(betAmount)
                        renderButtons(betAmount)
                # faces raise
                if hero.getCurrentBet() > 2
                    # fold to raise
                    if rand < 33
                        villainFold()
                        renderVillainFoldText()
                        hideHeroActionBar = true
                    # call
                    if rand > 33 && rand < 66
                        villain.calls(hero.getCurrentBet()-villain.getCurrentBet())
                        renderVillainCallText()
                        hideHeroActionBar = true;
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 200     
                    # raise
                    else if rand > 66
                        betAmount = hero.getCurrentBet() * 2
                        villainCreateAndMakeBet(betAmount)
                        renderButtons(betAmount)
        ##
        # FLOP ###############
        ##
        else if currentStreet is 2
            # facing check
            if hero.getCurrentBet() is 0
                if rand < 33
                    # villain check -> next street if dealer
                    renderVillainCheckText()
                    if !heroIsDealer
                        hideHeroActionBar = true;
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 200
                # villain bet small
                else if rand > 33 && rand < 66
                    betAmount = hero.getCurrentBet()
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
                    renderButtons(betAmount)
                # villain bet big
                else if rand > 66
                    betAmount = hero.getCurrentBet() + 100
                    villainCreateAndMakeBet(betAmount)
                    renderButtons(betAmount)
            # villain faces bet flop
            else 
                # fold
                if rand < 33
                    villainFold()
                    renderVillainFoldText()
                    hideHeroActionBar = false
                else if rand < 66
                    # CALL
                    villain.calls(hero.getCurrentBet()-villain.getCurrentBet()) 
                    renderVillainCallText()
                    hideHeroActionBar = true;
                    setTimeout ( ->
                        dealNextStreet(currentStreet)
                    ), 200
                else    
                    # RAISE
                    betAmount = hero.getCurrentBet() 
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
                    renderButtons(betAmount)
        ##
        # TURN #####################
        ##
        else if currentStreet is 3
            # facing no bet
            if hero.getCurrentBet() is 0
                # CHECK
                if rand < 33
                    renderVillainCheckText()
                    # next street if check as dealer
                    if !heroIsDealer
                        hideHeroActionBar = true;
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 200 
                # call
                else if rand < 66
                    betAmount = hero.getCurrentBet()
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
                    renderButtons(betAmount)
                # raise
                else if rand > 66    
                    betAmount = hero.getCurrentBet()
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
                    renderButtons(betAmount)

            # villain faces bet turn
            else 
                # fold
                if rand < 33
                    villainFold()
                    renderVillainFoldText()
                    hideHeroActionBar = false
                # call
                else if rand < 66
                    villain.calls(hero.getCurrentBet()-villain.getCurrentBet()) 
                    renderVillainCallText()
                    hideHeroActionBar = true;
                    setTimeout ( ->
                        dealNextStreet(currentStreet)
                    ), 200
                # raise
                else if rand > 66
                    betAmount = hero.getCurrentBet()
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
                    renderButtons(betAmount)
        #
        # RIVER #####################
        #
        else if currentStreet is 4
            # facing no bet
            if hero.getCurrentBet() is 0
                # check
                if rand < 33 
                    # check as dealer -> next street
                    if !heroIsDealer
                        hideHeroActionBar = true;
                        setTimeout ( ->
                            dealNextStreet(currentStreet)
                        ), 200
                    # check to hero if OOP
                    else if heroIsDealer
                        renderVillainCheckText()
                # small bet
                else if rand > 33 && rand < 66
                    betAmount = hero.getCurrentBet()
                    betAmount += 100
                    villainCreateAndMakeBet(betAmount)
                    renderButtons(betAmount)
                # big bet
                else if rand > 66
                    betAmount = hero.getCurrentBet()
                    betAmount += 200
                    villainCreateAndMakeBet(betAmount)
                    renderButtons(betAmount)
            # facing bet
            else if hero.getCurrentBet() > 0
                facingBet = hero.getCurrentBet()-villain.getCurrentBet()
                # fold
                if rand < 33
                    villainFold()
                    renderVillainFoldText()
                    hideHeroActionBar = true
                # call
                else if rand < 66
                    villain.calls(facingBet)
                    renderVillainCallText()
                    # call as dealer -> next street
                    setTimeout ( -> 
                        dealNextStreet(currentStreet)
                    ), 200
                # raise
                else if rand > 66
                    betAmount = hero.getCurrentBet() * 2
                    villainCreateAndMakeBet(betAmount)
                    renderButtons(betAmount)
 

        # This always runs after villain acts
        villain_image.classList.remove("glowing")
        renderStacks()
        if hideHeroActionBar
            button_bar.style.visibility = 'hidden'
        else
            button_bar.style.visibility = 'visible'
    ), 200

#
# HERO BUTTONS (ACTION LOGIC) #
#

# FOLD BUTTON LOGIC
heroFold = ->
    # reset stuff for new hand
    hero_image.classList.remove("glowing")
    button_bar.style.visibility = 'hidden'
    villain.winsPot()
    renderEmptyHeroCards()
    currentStreet = 0
    deck = getNewDeck()
    heroIsDealer = !heroIsDealer

    # end of hand text
    emptyTableForAnnouncementText()
    hero_current_action.innerHTML = 'Fold'
    announcementText.innerHTML = 'Villain wins: ' + potSize + '$'
    announcementText.style.visibility = "visible"
    setTimeout ( ->
        startHand()
    ), 200

#
# BET/RAISE BUTTON LOGIC
#
betRaise = ->
    # the betsize sum inlcudes the players bet already on table. This gets adjusted in Player.bet()
    hero_image.classList.remove("glowing")
    amount = villain.getCurrentBet()
    if amount <= 2
        amount = 100
    else 
        amount *= 2
    hero_current_action.innerHTML = ''
    hero.bets(amount)   
    renderBets()
    villainAct()

#
# CHECK/CALL BUTTON LOGIC
#
checkCall = ->
    facingBet = villain.getCurrentBet() - hero.getCurrentBet()
    hero_image.classList.remove("glowing")

    # dealer preflop
    if currentStreet is 1 && heroIsDealer  
        # call SB 
        if facingBet is 1
            hero.calls(1)
            villainAct()
        # calling raise 
        else if facingBet > 1
            hero.calls(facingBet)
            setTimeout ( ->
                dealNextStreet(currentStreet)
            ), 1000
    # check/call OOP preflop 
    else if currentStreet is 1 && !heroIsDealer
        hero.calls(facingBet)
        # calls a bet
        if facingBet > 0
            hero_current_action.innerHTML = ''
            setTimeout ( ->
                dealNextStreet(currentStreet)
            ), 1000
        # checking BB
        else if facingBet <= 2
            #renderHeroCheckText()
            setTimeout ( ->
                dealNextStreet(currentStreet)
            ), 1000
    
    # NORMAL check/call every street
    else 
        # check/call IP -> always next street
        if heroIsDealer
            # facing check
            if facingBet is 0
                setTimeout ( ->
                    dealNextStreet(currentStreet)
                ), 1000
            # facing bet
            else if facingBet > 0
                hero.calls(facingBet)
                setTimeout ( ->
                    dealNextStreet(currentStreet)
                ), 1000
        # check to villain
        else if facingBet is 0 
            hero.calls(facingBet)
            villainAct()
        # call a bet -> next street
        else if facingBet > 0
            hero.calls(facingBet)
            hero_current_action.innerHTML = ''
            setTimeout ( ->
                dealNextStreet(currentStreet)
            ), 200


    button_bar.style.visibility = 'hidden'
    renderBets()



# Hero ACTION buttons
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

  # the betsize sum inlcudes the players bet already on table. Adjusting this here
  bets: (amount) ->
    prevBet = @currentBet
    @currentBet = amount
    @stackSize -= (amount-prevBet)
    potSize += (amount-prevBet)
    renderPot(potSize)
    renderStacks()

  # the call sum inlcudes the players bet already on table. Adjusting this here
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
    # reset stuff for new hand
    announcementText.innerHTML = ''
    villainActing.innerHTML = ''
    hero_current_action.innerHTML = ''
    hero_current_bet.innerHTML = ''
    villain_current_bet.innerHTML = ''
    potDOM.innerHTML = ''
    hero_current_action.innerHTML = ''
    announcementText.innerHTML = ''
    heroStrength.innerHTML = ''
    villainStrength.innerHTML = ''
    villainStrength.style.visibility = 'hidden'
    hero_current_action.style.visibility = 'visible'
    hero_current_bet.style.visibility = 'visible'
    villain_current_bet.style.visibility = 'visible'
    announcementText.style.visibility = "hidden"
    new_hand_btn.style.display = 'none'
    button_bar.style.display = ""
    board = []
    renderEmptyHeroCards()
    renderEmptyVillainCards()
    renderResetFlop()
    currentStreet = 0
    
    # deal cards
    setTimeout ( ->
        dealCards()
        # pay blinds
        setTimeout ( ->
            potSize = 3
            potDOM.innerHTML = 'Pot: $' + potSize
            # Pay blinds
            if heroIsDealer is true 
                renderDealerBtn('hero')
                hero.paySmallBlind()
                villain.payBigBlind()
                renderBets()
                setTimeout ( -> 
                    renderButtons(villain.getCurrentBet()-hero.getCurrentBet())
                    button_bar.style.visibility = 'visible'
                ), 800
                renderStacks()
            else if !heroIsDealer
                renderDealerBtn('villain')
                button_bar.style.visibility = 'hidden'
                hero.payBigBlind()
                villain.paySmallBlind()
                renderBets()
                setTimeout ( -> 
                    villainAct()
                ), 800
        ), 800
    ), 800

new_hand_btn.addEventListener 'click', startHand
#startHand()


heroCards = [ deck[0], deck[1] ]
board = [ deck[2], deck[3], deck[6], deck[19], deck[32] ]

hand1 = [ deck[2], deck[3], deck[18], deck[45], deck[30], deck[0], deck[1] ]

heroStrength = getHandStrength(heroCards, board)

console.log heroCards
console.log board

console.log 'heros hand strength: ' + heroStrength