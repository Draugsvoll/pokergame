# DOM hooks
heroCard1DOM = document.querySelector('#hero-card1')
heroCard2DOM = document.querySelector('#hero-card2')
villainCard1DOM = document.querySelector('#villain-card1')
villainCard2DOM = document.querySelector('#villain-card2')
villainCardsDOM = document.querySelector('.villain-cards')
boardDom = document.querySelector('.board')

# variables
street = 'pre-flop'
board = []
heroCards = []
villainCards = []

deck = [
    #hearts
    { value: '2H'},
    { value: '3H'},
    { value: '4H'},
    { value: '5H'},
    { value: '6H'},
    { value: '7H'},
    { value: '8H'},
    { value: '9H'},
    { value: '0H'},
    { value: 'JH'},
    { value: 'QH'},
    { value: 'KH'},
    { value: 'AH'},
    #clubs
    { value: '2C'},
    { value: '3C'},
    { value: '4C'},
    { value: '5C'},
    { value: '6C'},
    { value: '7C'},
    { value: '8C'},
    { value: '9C'},
    { value: '0C'},
    { value: 'JC'},
    { value: 'QC'},
    { value: 'KC'},
    { value: 'AC'},
    #spades
    { value: '2S'},
    { value: '3S'},
    { value: '4S'},
    { value: '5S'},
    { value: '6S'},
    { value: '7S'},
    { value: '8S'},
    { value: '9S'},
    { value: '0S'},
    { value: 'JS'},
    { value: 'QS'},
    { value: 'KS'},
    { value: 'AS'},
    #diamonds
    { value: '2D'},
    { value: '3D'},
    { value: '4D'},
    { value: '5D'},
    { value: '6D'},
    { value: '7D'},
    { value: '8D'},
    { value: '9D'},
    { value: '0D'},
    { value: 'JD'},
    { value: 'QD'},
    { value: 'KD'},
    { value: 'AD'},
] 


dealCards = ->
    availableCards = deck.length

    # Villain cards
    villainCard1 = Math.floor(Math.random() * availableCards)
    deck.splice(villainCard1, 1)
    villainCard2 = Math.floor(Math.random() * availableCards - 1)
    deck.splice(villainCard2, 1)
    villainCards.push(deck[villainCard1])
    villainCards.push(deck[villainCard2])

    # Hero cards
    availableCards = deck.length
    heroCard1 = Math.floor(Math.random() * availableCards)
    deck.splice(heroCard1, 1)
    heroCard2 = Math.floor(Math.random() * availableCards - 1)
    deck.splice(heroCard2, 1)
    heroCards.push(deck[heroCard1])
    heroCards.push(deck[heroCard2])

    #Render cards
    renderPlayerCards()

    console.log 'villains cards: ',villainCards 
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
    boardDom.innerHTML = board[0].value + board[1].value + board[2].value
    console.log 'flop dealet, det er ' + deck.length + ' kort igjen'

dealTurn = ->
dealRiver = ->
endHand = ->

dealerAct = ->
    if street is 'pre-flop'
        console.log street

    else if street is 'flop' 

    else if street is 'turn' 

    else street is 'river' 



dealCards()
dealerAct()
dealFlop()