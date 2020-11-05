# DOM hooks
heroCard1DOM = document.querySelector('#hero-card1')
heroCard2DOM = document.querySelector('#hero-card2')
villainCard1DOM = document.querySelector('#villain-card1')
villainCard2DOM = document.querySelector('#villain-card2')
villainCardsDOM = document.querySelector('.villain-cards')
boardCard1 = document.querySelector('#board-card1')
boardCard2 = document.querySelector('#board-card2')
boardCard3 = document.querySelector('#board-card3')
boardCard4 = document.querySelector('#board-card4')
boardCard5 = document.querySelector('#board-card5')

# variables
street = 'pre-flop'
board = []
heroCards = []
villainCards = []

deck = [
    #hearts
    { value: '2H', rank: 2},
    { value: '3H', rank: 3},
    { value: '4H', rank: 4},
    { value: '5H', rank: 5},
    { value: '6H', rank: 6},
    { value: '7H', rank: 7},
    { value: '8H', rank: 8},
    { value: '9H', rank: 9},
    { value: '0H', rank: 10},
    { value: 'JH', rank: 11},
    { value: 'QH', rank: 12},
    { value: 'KH', rank: 13},
    { value: 'AH', rank: 14},
    #clubs
    { value: '2C', rank: 2},
    { value: '3C', rank: 3},
    { value: '4C', rank: 4},
    { value: '5C', rank: 5},
    { value: '6C', rank: 6},
    { value: '7C', rank: 7},
    { value: '8C', rank: 8},
    { value: '9C', rank: 9},
    { value: '0C', rank: 10},
    { value: 'JC', rank: 11},
    { value: 'QC', rank: 12},
    { value: 'KC', rank: 13},
    { value: 'AC', rank: 14},
    #spades
    { value: '2S', rank: 2},
    { value: '3S', rank: 3},
    { value: '4S', rank: 4},
    { value: '5S', rank: 5},
    { value: '6S', rank: 6},
    { value: '7S', rank: 7},
    { value: '8S', rank: 8},
    { value: '9S', rank: 9},
    { value: '0S', rank: 10},
    { value: 'JS', rank: 11},
    { value: 'QS', rank: 12},
    { value: 'KS', rank: 13},
    { value: 'AS', rank: 14},
    #diamonds
    { value: '2D', rank: 2},
    { value: '3D', rank: 3},
    { value: '4D', rank: 4},
    { value: '5D', rank: 5},
    { value: '6D', rank: 6},
    { value: '7D', rank: 7},
    { value: '8D', rank: 8},
    { value: '9D', rank: 9},
    { value: '0D', rank: 10},
    { value: 'JD', rank: 11},
    { value: 'QD', rank: 12},
    { value: 'KD', rank: 13},
    { value: 'AD', rank: 14},
] 


dealCards = ->
    # Villain cards
    cardId = Math.floor(Math.random() * deck.length)
    villainCards.push(deck[cardId])
    deck.splice(cardId, 1)
    cardId = Math.floor(Math.random() * deck.length)
    villainCards.push(deck[cardId])
    deck.splice(cardId, 1)

    # Hero cards
    cardId = Math.floor(Math.random() * deck.length)
    heroCards.push(deck[cardId])
    deck.splice(cardId, 1)
    cardId = Math.floor(Math.random() * deck.length)
    heroCards.push(deck[cardId])
    deck.splice(cardId, 1)

    #Render cards
    renderPlayerCards()

    console.log 'villains cards: ', villainCards
    console.log 'Heros cards: ',heroCards
    console.log 'cards left: ',deck.length

renderPlayerCards = ->
    #render villain vards
    villainCard1DOM.src = "https://deckofcardsapi.com/static/img/#{villainCards[0].value}.png"
    villainCard2DOM.src = "https://deckofcardsapi.com/static/img/#{villainCards[1].value}.png"

    #render Hero cards
    heroCard1DOM.src = "https://deckofcardsapi.com/static/img/#{heroCards[0].value}.png"
    heroCard2DOM.src = "https://deckofcardsapi.com/static/img/#{heroCards[1].value}.png"

dealFlop = ->
    i = 3
    while i > 0
        cardId = Math.floor(Math.random() * deck.length)
        card = deck[cardId]
        board.push(card)
        deck.splice(cardId, 1)
        i--
    boardCard1.src = "https://deckofcardsapi.com/static/img/#{board[0].value}.png"
    boardCard2.src = "https://deckofcardsapi.com/static/img/#{board[1].value}.png"
    boardCard3.src = "https://deckofcardsapi.com/static/img/#{board[2].value}.png"
    console.log 'flop dealet, det er ' + deck.length + ' kort igjen'

dealTurn = ->
    cardId = Math.floor(Math.random() * deck.length)
    card = deck[cardId]
    board.push(card)
    deck.splice(cardId, 1)
    boardCard4.src = "https://deckofcardsapi.com/static/img/#{board[3].value}.png"
    console.log 'turn dealet, det er ' + deck.length + ' kort igjen'

dealRiver = ->
    cardId = Math.floor(Math.random() * deck.length)
    card = deck[cardId]
    board.push(card)
    deck.splice(cardId, 1)
    boardCard5.src = "https://deckofcardsapi.com/static/img/#{board[4].value}.png"
    console.log 'river dealet, det er ' + deck.length + ' kort igjen'

endHand = ->

HeroHandStrength = (heroCards, board) ->
    # get hand
    hand = []
    hand.push(heroCards[0])
    hand.push(heroCards[1])
    hand.push(board[0])
    hand.push(board[1])
    hand.push(board[2])
    hand.push(board[3])
    hand.push(board[4])
    console.log hand
    #check for hand strengths
    hasFlush(hand)
    hasPairsOrTripsOrQuads(hand)
    #hasTripsOrQuads(hand)


hasFlush = (hand) ->    
    suits = { hearts: 0, spades: 0, clubs: 0, diamonds: 0 } 
    for card, index in hand
        if card[1] is 'H'
            suits.hearts += 1
        else if card[1] is 'C'
            suits.clubs += 1
        else if card[1] is 'D'
            suits.diamonds += 1
        else 
            suits.spades +=1
    # check for flush
    if suits.hearts >= 5
        console.log 'flush in Hearts'
    else if suits.clubs >= 5  
        console.log 'flush in clubs'
    else if suits.diamonds >= 5  
        console.log 'flush in diamonds'
    else if suits.spades >= 5  
        console.log 'flush in spades'
    else    

hasPairsOrTripsOrQuads = (hand) ->
    trips = []
    pairs = []
    ranks = [ 0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0, 0 ]
    for card in hand
        rank = card.rank
        ranks[rank-2] +=1
    # check for how many of same
    for value, index in ranks
        if value is 2
            #index gives actual card value also
            pairs.push(index+1)
        else if value is 3
            trips.push(index+1)
    if pairs.length is 0
        console.log 'no pairs'
    else if pairs.length is 1
        pairs[0] += 1
        console.log 'pair in: ',pairs[0]
    else if pairs.length is 2
        outcome = "two pairs: #{pairs[0]+1} and #{pairs[1]+1} "
        console.log outcome
    if trips.length is 1
        if pairs.length is 1
            outcome = "du har hus, to like: #{pairs[0]+1} 3 like:  #{trips[0]+1} "
            console.log 
        console.log 'TRIPS : ', trips[0]+1

    
hasTripsOrQuads = (hand) ->


dealerAct = ->
    if street is 'pre-flop'
        console.log street

    else if street is 'flop' 

    else if street is 'turn' 

    else street is 'river' 



dealCards()
dealerAct()
dealFlop()
dealTurn()
dealRiver()
HeroHandStrength(heroCards, board)