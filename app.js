// Generated by CoffeeScript 2.5.1
(function() {
  // Imports
  //import test from "./modules/test.coffee"
  //console.log(log)

  // DOM HOOKS #

  // buttons
  var Player, actingTime, announcementText, betRaise, bet_raise_btn, board, boardCard1, boardCard2, boardCard3, boardCard4, boardCard5, button_bar, checkCall, check_call_btn, clearBets, clearHandStrengths, currentStreet, dealCards, dealFlop, dealNextStreet, dealRiver, dealTurn, deck, defaultStackSize, emptyTableForAnnouncementText, endHand, fold_btn, getHandStrength, getNewDeck, handRank, hasFlush, hasPairsOrTripsOrQuads, hasStraight, hero, heroCard1DOM, heroCard2DOM, heroCards, heroFold, heroIsDealer, heroStack, heroStrength, hero_current_action, hero_current_bet, hero_dealer, hero_image, new_hand_btn, potDOM, potSize, renderBets, renderButtons, renderDealerBtn, renderEmptyHeroCards, renderEmptyTableGraphics, renderEmptyVillainCards, renderHandSrengths, renderHeroBetText, renderHeroCallText, renderHeroCheckText, renderPlayerCards, renderPot, renderResetFlop, renderStacks, renderVillainBetText, renderVillainCallText, renderVillainCheckText, renderVillainFoldText, startHand, villain, villainAct, villainActing, villainCard1DOM, villainCard2DOM, villainCards, villainCreateAndMakeBet, villainFold, villainStack, villainStrength, villain_current_bet, villain_dealer, villain_image;

  button_bar = document.querySelector('.button-bar');

  fold_btn = document.querySelector(".fold");

  check_call_btn = document.querySelector(".check-call");

  bet_raise_btn = document.querySelector(".bet-raise");

  new_hand_btn = document.querySelector(".new-hand-btn");

  // table graphics
  hero_current_bet = document.querySelector(".hero-current-bet");

  hero_current_action = document.querySelector(".hero-current-action");

  potDOM = document.querySelector('.pot');

  hero_dealer = document.querySelector(".hero-dealer");

  heroStrength = document.querySelector('.hero-strength');

  heroStack = document.querySelector('.hero-stack');

  hero_dealer = document.querySelector(".hero-dealer");

  villain_dealer = document.querySelector(".villain-dealer");

  villain_current_bet = document.querySelector(".villain-current-bet");

  villainStack = document.querySelector('.villain-stack');

  villainCard1DOM = document.querySelector('#villain-card1');

  villainCard2DOM = document.querySelector('#villain-card2');

  villainStrength = document.querySelector('.villain-strength');

  villainActing = document.querySelector(".villain-acting");

  announcementText = document.querySelector(".table-text");

  // cards
  heroCard1DOM = document.querySelector('#hero-card1');

  heroCard2DOM = document.querySelector('#hero-card2');

  boardCard1 = document.querySelector('#board-card1');

  boardCard2 = document.querySelector('#board-card2');

  boardCard3 = document.querySelector('#board-card3');

  boardCard4 = document.querySelector('#board-card4');

  boardCard5 = document.querySelector('#board-card5');

  // avatars
  hero_image = document.querySelector("#hero-image");

  villain_image = document.querySelector("#villain-image");

  // variables
  currentStreet = 0;

  defaultStackSize = 1000;

  heroIsDealer = true;

  board = [];

  heroCards = [];

  villainCards = [];

  button_bar.style.visibility = 'hidden';

  potSize = 0;

  announcementText.innerHTML = 'asd';

  villainStrength.style.display = "none";

  villain_dealer.style.visibility = "hidden";

  villain_dealer.style.visibility = "hidden";

  actingTime = 500;

  // CREATE CARD DECK
  getNewDeck = function() {
    var myNewDeck;
    myNewDeck = [
      {
        value: '2H',
        rank: 2
      },
      {
        value: '3H',
        rank: 3
      },
      {
        value: '4H',
        rank: 4
      },
      {
        value: '5H',
        rank: 5
      },
      {
        value: '6H',
        rank: 6
      },
      {
        value: '7H',
        rank: 7
      },
      {
        value: '8H',
        rank: 8
      },
      {
        value: '9H',
        rank: 9
      },
      {
        value: '0H',
        rank: 10
      },
      {
        value: 'JH',
        rank: 11
      },
      {
        value: 'QH',
        rank: 12
      },
      {
        value: 'KH',
        rank: 13
      },
      {
        value: 'AH',
        rank: 14
      },
      {
        value: '2C',
        rank: 2
      },
      {
        value: '3C',
        rank: 3
      },
      {
        value: '4C',
        rank: 4
      },
      {
        value: '5C',
        rank: 5
      },
      {
        value: '6C',
        rank: 6
      },
      {
        value: '7C',
        rank: 7
      },
      {
        value: '8C',
        rank: 8
      },
      {
        value: '9C',
        rank: 9
      },
      {
        value: '0C',
        rank: 10
      },
      {
        value: 'JC',
        rank: 11
      },
      {
        value: 'QC',
        rank: 12
      },
      {
        value: 'KC',
        rank: 13
      },
      {
        value: 'AC',
        rank: 14
      },
      {
        value: '2S',
        rank: 2
      },
      {
        value: '3S',
        rank: 3
      },
      {
        value: '4S',
        rank: 4
      },
      {
        value: '5S',
        rank: 5
      },
      {
        value: '6S',
        rank: 6
      },
      {
        value: '7S',
        rank: 7
      },
      {
        value: '8S',
        rank: 8
      },
      {
        value: '9S',
        rank: 9
      },
      {
        value: '0S',
        rank: 10
      },
      {
        value: 'JS',
        rank: 11
      },
      {
        value: 'QS',
        rank: 12
      },
      {
        value: 'KS',
        rank: 13
      },
      {
        value: 'AS',
        rank: 14
      },
      {
        value: '2D',
        rank: 2
      },
      {
        value: '3D',
        rank: 3
      },
      {
        value: '4D',
        rank: 4
      },
      {
        value: '5D',
        rank: 5
      },
      {
        value: '6D',
        rank: 6
      },
      {
        value: '7D',
        rank: 7
      },
      {
        value: '8D',
        rank: 8
      },
      {
        value: '9D',
        rank: 9
      },
      {
        value: '0D',
        rank: 10
      },
      {
        value: 'JD',
        rank: 11
      },
      {
        value: 'QD',
        rank: 12
      },
      {
        value: 'KD',
        rank: 13
      },
      {
        value: 'AD',
        rank: 14
      }
    ];
    return myNewDeck;
  };

  deck = getNewDeck();

  // CARD LOGIC
  dealCards = function() {
    var cardId;
    currentStreet++;
    // glowing effect
    if (heroIsDealer) {
      hero_image.className = " glowing";
      villain_image.classList.remove("glowing");
    } else {
      villain_image.className = " glowing";
      hero_image.classList.remove("glowing");
    }
    // Villain cards
    villainCards = [];
    cardId = Math.floor(Math.random() * deck.length);
    villainCards.push(deck[cardId]);
    deck.splice(cardId, 1);
    cardId = Math.floor(Math.random() * deck.length);
    villainCards.push(deck[cardId]);
    deck.splice(cardId, 1);
    // Hero cards
    heroCards = [];
    cardId = Math.floor(Math.random() * deck.length);
    heroCards.push(deck[cardId]);
    deck.splice(cardId, 1);
    cardId = Math.floor(Math.random() * deck.length);
    heroCards.push(deck[cardId]);
    deck.splice(cardId, 1);
    return renderPlayerCards();
  };

  dealNextStreet = function(currentStreet) {
    if (currentStreet === 1) {
      renderButtons(0);
      return dealFlop();
    } else if (currentStreet === 2) {
      renderButtons(0);
      return dealTurn();
    } else if (currentStreet === 3) {
      renderButtons(0);
      return dealRiver();
    } else if (currentStreet === 4) {
      button_bar.style.visibility = 'hidden';
      return endHand();
    }
  };

  dealFlop = function() {
    var card, cardId, i;
    currentStreet++;
    // glowing effect
    if (heroIsDealer) {
      villain_image.className = " glowing";
      hero_image.classList.remove("glowing");
    } else {
      hero_image.className = " glowing";
      villain_image.classList.remove("glowing");
    }
    renderEmptyTableGraphics();
    // Villain act first if OOP
    if (heroIsDealer) {
      villainAct();
    } else {
      button_bar.style.visibility = 'visible';
    }
    i = 3;
    while (i > 0) {
      cardId = Math.floor(Math.random() * deck.length);
      card = deck[cardId];
      board.push(card);
      deck.splice(cardId, 1);
      i--;
    }
    boardCard1.src = `assets/${board[0].value}.png`;
    boardCard2.src = `assets/${board[1].value}.png`;
    boardCard3.src = `assets/${board[2].value}.png`;
    console.log('flop dealet, det er ' + deck.length + ' kort igjen');
    return renderHandSrengths();
  };

  dealTurn = function() {
    var card, cardId;
    currentStreet++;
    // glowing effect
    if (heroIsDealer) {
      hero_image.className = " glowing";
      villain_image.classList.remove("glowing");
    } else {
      villain_image.className = " glowing";
      hero_image.classList.remove("glowing");
    }
    renderEmptyTableGraphics();
    if (heroIsDealer) {
      villainAct();
    } else {
      button_bar.style.visibility = 'visible';
    }
    cardId = Math.floor(Math.random() * deck.length);
    card = deck[cardId];
    board.push(card);
    deck.splice(cardId, 1);
    boardCard4.src = `assets/${board[3].value}.png`;
    console.log('turn dealet, det er ' + deck.length + ' kort igjen');
    return renderHandSrengths();
  };

  dealRiver = function() {
    var card, cardId;
    currentStreet++;
    // glowing effect
    if (heroIsDealer) {
      hero_image.className = " glowing";
      villain_image.classList.remove("glowing");
    } else {
      villain_image.className = " glowing";
      hero_image.classList.remove("glowing");
    }
    renderEmptyTableGraphics();
    if (heroIsDealer) {
      villainAct();
    } else {
      button_bar.style.visibility = 'visible';
    }
    cardId = Math.floor(Math.random() * deck.length);
    card = deck[cardId];
    board.push(card);
    deck.splice(cardId, 1);
    boardCard5.src = `assets/${board[4].value}.png`;
    console.log('river dealet, det er ' + deck.length + ' kort igjen');
    return renderHandSrengths();
  };

  // determine winning hand at end (rank by integers)
  handRank = function(hand) {
    if (hand.includes('Four')) {
      return 9;
    } else if (hand.includes('Full')) {
      return 8;
    } else if (hand.includes('Flush')) {
      return 7;
    } else if (hand.includes('Straight')) {
      return 6;
    } else if (hand.includes('Three')) {
      return 5;
    } else if (hand.includes('Two')) {
      return 4;
    } else if (hand.includes('Pair')) {
      return 3;
    } else {
      return 2;
    }
  };

  endHand = function() {
    var amount, announcement, heroHand, heroHandStrength, villainHand, villainHandStrength, winner;
    new_hand_btn.style.display = "block";
    // show villain hand
    villainCard1DOM.src = `assets/${villainCards[0].value}.png`;
    villainCard2DOM.src = `assets/${villainCards[1].value}.png`;
    villainStrength.style.display = "";
    // get players hands
    villainHand = getHandStrength(villainCards, board);
    heroHand = getHandStrength(heroCards, board);
    // hand strengths output as integer
    villainHandStrength = handRank(villainHand);
    heroHandStrength = handRank(heroHand);
    // declare winner
    if (heroHandStrength > villainHandStrength) {
      winner = 'Hero';
      announcement = 'Hero wins ' + potSize + '$';
      hero.winsPot();
    } else if (heroHandStrength < villainHandStrength) {
      winner = 'Villain';
      announcement = 'Villain wins ' + potSize + ' $';
      villain.winsPot();
    } else {
      winner = 'Split';
      announcement = 'Split pot ';
      //splitting pot
      amount = potSize / 2;
      hero.stackSize += amount;
      villain.stackSize += amount;
    }
    // show end of hand text
    emptyTableForAnnouncementText();
    announcementText.innerHTML = announcement;
    return hero_current_bet.style.visibility = "hidden";
  };

  
  // GET HAND-STRENGTH INFORMATION

  getHandStrength = function(playerCards, board) {
    var card, hand, handStrength, index, j, k, l, len, len1, len2, strength;
    handStrength = [''];
    // get the hand
    hand = [];
    for (j = 0, len = playerCards.length; j < len; j++) {
      card = playerCards[j];
      hand.push(card);
    }
    for (k = 0, len1 = board.length; k < len1; k++) {
      card = board[k];
      hand.push(card);
    }
    //check for hand strengths
    handStrength.push(hasFlush(hand));
    handStrength.push(hasPairsOrTripsOrQuads(hand));
    handStrength.push(hasStraight(hand));
// return actual hand (the strongest one)
    for (index = l = 0, len2 = handStrength.length; l < len2; index = ++l) {
      strength = handStrength[index];
      if (handStrength[index].includes('Four')) {
        return handStrength[index];
      } else if (strength.includes('house')) {
        return handStrength[index];
      } else if (strength.includes('Flush')) {
        return handStrength[index];
      } else if (strength.includes('Straight')) {
        return handStrength[index];
      } else if (strength.includes('Three')) {
        return handStrength[index];
      } else if (strength.includes('Two')) {
        return handStrength[index];
      } else if (strength.includes('Pair')) {
        return handStrength[index];
      } else if (strength.includes('High')) {
        return handStrength[index];
      }
    }
  };

  hasFlush = function(hand) {
    var card, index, j, len, suits;
    suits = {
      hearts: 0,
      spades: 0,
      clubs: 0,
      diamonds: 0
    };

    // push suits in hand to new array
    for (index = j = 0, len = hand.length; j < len; index = ++j) {
      card = hand[index];
      if (card.value.includes('H')) {
        suits.hearts += 1;
      } else if (card.value.includes('C')) {
        suits.clubs += 1;
      } else if (card.value.includes('D')) {
        suits.diamonds += 1;
      } else if (card.value.includes('S')) {
        suits.spades += 1;
      }
    }
    // check for flush
    if (suits.hearts >= 5) {
      return 'Flush in Hearts';
    } else if (suits.clubs >= 5) {
      return 'Flush in clubs';
    } else if (suits.diamonds >= 5) {
      return 'Flush in diamonds';
    } else if (suits.spades >= 5) {
      return 'Flush in spades';
    } else {
      return ' ';
    }
  };

  hasPairsOrTripsOrQuads = function(hand) {
    var card, highCard, i, index, j, k, len, len1, outcome, outcome1, pair, pair1, pair2, pairs, quads, rank, ranks, trips, value;
    quads = [];
    trips = [];
    pairs = [];
    ranks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
//check every card in hand
    for (j = 0, len = hand.length; j < len; j++) {
      card = hand[j];
      rank = card.rank;
      ranks[rank - 2] += 1;
    }
// check for how many of same
    for (index = k = 0, len1 = ranks.length; k < len1; index = ++k) {
      value = ranks[index];
      if (value === 2) {
        //index+1 IS ALSO the card value 
        pairs.push(index + 1);
      } else if (value === 3) {
        trips.push(index + 1);
      } else if (value === 4) {
        quads.push(index + 1);
      }
    }
    // no pair (high card)
    if (pairs.length === 0 && quads.length === 0 && trips.length === 0) {
      i = ranks.length;
      while (i >= 0) {
        if (ranks[i] > 0) {
          highCard = (i + 2).toString();
          return 'High card ' + highCard;
        } else {

        }
        i--;
      }
    // one pair
    } else if (pairs.length === 1 && trips.length === 0 && quads.length === 0) {
      pairs[0] += 1;
      return 'Pair of ' + pairs[0].toString();
    // two pair
    } else if (pairs.length === 2) {
      pair1 = (pairs[0] + 1).toString();
      pair2 = (pairs[1] + 1).toString();
      outcome1 = "Two pairs " + pair1 + ' and ' + pair2;
      return outcome1;
    // three pair
    } else if (pairs.length === 3) {
      pair1 = (pairs[0] + 1).toString();
      pair2 = (pairs[1] + 1).toString();
      outcome1 = "Two pairs " + pair1 + ' and ' + pair2;
      return outcome1;
    }
    // trips
    if (trips.length === 1) {
      if (pairs.length === 0) {
        card = (trips[0] + 1).toString();
        return 'Three of a kind ' + card;
      }
      // full house
      if (pairs.length === 1) {
        pair = pairs[0] + 1;
        trips = trips[0] + 1;
        outcome = 'Full house ' + trips + '' + trips + '' + trips + ' and ' + pair + '' + pair;
        return outcome;
      }
    }
    // quads
    if (quads.length === 1) {
      outcome = "Four of a kind " + (quads[0] + 1).toString();
      return outcome;
    }
  };

  hasStraight = function(hand) {
    var card, counter, index, j, k, len, len1, rank, ranks, startedCounting;
    ranks = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    counter = 0;
    startedCounting = false;
// place every card in correct order
    for (j = 0, len = hand.length; j < len; j++) {
      card = hand[j];
      rank = card.rank;
      ranks[rank - 2] += 1;
    }
// loop cards
    for (index = k = 0, len1 = ranks.length; k < len1; index = ++k) {
      card = ranks[index];
      // no straight if 3 cards of same value
      if (ranks[index] === 3) {

      } else if (ranks[index] > 0) {
        if (ranks[index + 1] > 0 && ranks[index + 2] > 0 && ranks[index + 3] > 0 && ranks[index + 4] > 0) {
          return 'Straight ';
        } else {
          return ' ';
        }
      }
    }
  };

  
  // RENDERING #

  // bruker denne kun på river. Gjør det manuelt på earlier streets.
  emptyTableForAnnouncementText = function() {
    hero_current_action.style.visibility = "hidden";
    villainActing.style.visibility = "hidden";
    villain_current_bet.style.visibility = 'hidden';
    hero_dealer.style.visibility = "hidden";
    villain_dealer.style.visibility = "hidden";
    return announcementText.style.visibility = "visible";
  };

  clearHandStrengths = function() {
    heroStrength.innerHTML = '';
    return villainStrength.innerHTML = '';
  };

  renderBets = function() {
    var heroBet, villainBet;
    heroBet = hero.getCurrentBet();
    villainBet = villain.getCurrentBet();
    if (heroBet === 0) {
      hero_current_bet.innerHTML = '';
    } else {
      hero_current_bet.innerHTML = '$' + heroBet;
    }
    if (villainBet === 0) {
      if (villain_current_bet.text = 'Check') {

      } else {
        
        return villain_current_bet.innerHTML = '';
      }
    } else {
      return villain_current_bet.innerHTML = '$' + villainBet;
    }
  };

  renderVillainFoldText = function() {
    return villainActing.innerHTML = 'Fold';
  };

  renderVillainCheckText = function() {
    return villainActing.innerHTML = 'Check';
  };

  renderVillainCallText = function() {
    return villainActing.innerHTML = 'Call';
  };

  renderVillainBetText = function() {
    return villainActing.innerHTML = 'Bet';
  };

  renderHeroCheckText = function() {
    return hero_current_action.innerHTML = 'Check';
  };

  renderHeroCallText = function() {
    return hero_current_action.innerHTML = 'Call';
  };

  renderHeroBetText = function() {
    return hero_current_action.innerHTML = 'Check';
  };

  renderEmptyTableGraphics = function() {
    // reset table graphics
    renderButtons(0);
    hero.clearCurrentBet();
    villain.clearCurrentBet();
    hero_current_action.innerHTML = '';
    return villainActing.innerHTML = '';
  };

  renderEmptyHeroCards = function() {
    heroCard1DOM.src = 'assets/empty.png';
    return heroCard2DOM.src = 'assets/empty.png';
  };

  renderEmptyVillainCards = function() {
    villainCard1DOM.src = 'assets/empty.png';
    return villainCard2DOM.src = 'assets/empty.png';
  };

  renderPot = function(amount) {
    return potDOM.innerHTML = 'Pot: $' + amount;
  };

  renderButtons = function(facingBet) {
    hero_image.className = " glowing";
    villain_image.classList.remove("glowing");
    // facing no bet
    if (facingBet === 0) {
      fold_btn.innerHTML = 'Fold';
      check_call_btn.innerHTML = 'Check';
      // button show raise instead of bet if preflop and is dealer
      if (currentStreet === 0 && facingBet === 0) {
        return bet_raise_btn.innerHTML = 'Raise $' + (facingBet + 100);
      } else {
        return bet_raise_btn.innerHTML = 'Bet $' + (facingBet + 100);
      }
    } else {
      // facing bet
      fold_btn.innerHTML = 'Fold';
      check_call_btn.innerHTML = 'Call $' + facingBet;
      return bet_raise_btn.innerHTML = 'Raise $' + (facingBet + 100);
    }
  };

  renderStacks = function() {
    var heroStackSize, villainStackSize;
    heroStackSize = hero.getStackSize();
    villainStackSize = villain.getStackSize();
    heroStack.innerHTML = '$' + heroStackSize;
    return villainStack.innerHTML = '$' + villainStackSize;
  };

  clearBets = function() {
    hero_current_bet.innerHTML = '';
    return villain_current_bet.innerHTML = '';
  };

  renderDealerBtn = function(player) {
    if (player === 'hero') {
      hero_dealer.style.visibility = "visible";
      return villain_dealer.style.visibility = "hidden";
    } else {
      hero_dealer.style.visibility = "hidden";
      return villain_dealer.style.visibility = "visible";
    }
  };

  renderResetFlop = function() {
    boardCard1.src = "";
    boardCard2.src = "";
    boardCard3.src = "";
    boardCard4.src = "";
    return boardCard5.src = "";
  };

  renderPlayerCards = function() {
    //render villain vards
    villainCard1DOM.src = "assets/purple_back.png";
    villainCard2DOM.src = "assets/purple_back.png";
    //render Hero cards
    heroCard1DOM.src = `assets/${heroCards[0].value}.png`;
    return heroCard2DOM.src = `assets/${heroCards[1].value}.png`;
  };

  renderHandSrengths = function() {
    heroStrength.innerHTML = getHandStrength(heroCards, board);
    return villainStrength.innerHTML = getHandStrength(villainCards, board);
  };

  
  // VILLAIN LOGIC (ACTIONS) #

  villainCreateAndMakeBet = function(betAmount) {
    villainActing.innerHTML = 'Villain bets ';
    villain.bets(betAmount);
    renderButtons(betAmount);
    return renderBets();
  };

  villainFold = function() {
    // reset stuff for new hand
    hero.winsPot();
    renderEmptyVillainCards();
    renderVillainFoldText();
    currentStreet = 0;
    deck = getNewDeck();
    heroIsDealer = !heroIsDealer;
    button_bar.style.visibility = 'hidden';
    // end of hand text
    emptyTableForAnnouncementText();
    hero_current_action.innerHTML = 'Fold';
    announcementText.innerHTML = 'Hero wins: ' + potSize + '$';
    return setTimeout((function() {
      return startHand();
    }), 1000);
  };

  //###############

  //   VILLAIN BOT 

  //###############
  villainAct = function() {
    var hideHeroActionBar, isVillainDealer, rand;
    renderStacks();
    button_bar.style.visibility = 'hidden';
    villainActing.style.visibility = "visible";
    villainActing.innerHTML = 'Villain is acting..';
    hideHeroActionBar = false;
    // glowing effect
    villain_image.className = " glowing";
    hero_image.classList.remove("glowing");
    isVillainDealer = !heroIsDealer;
    //rand = Math.random() * 100 + 20
    rand = 20;
    return setTimeout((function() {
      var betAmount, facingBet, villainActingText;
      
      // PRE-FLOP #

      if (currentStreet === 1) {
        facingBet = hero.getCurrentBet() - villain.getCurrentBet();
        // is dealer
        if (isVillainDealer) {
          // fold
          if (rand < 33) {
            villainFold();
            renderVillainFoldText();
          // call
          } else if (rand > 33 && rand < 66) {
            // villain only calls small blind
            if (facingBet === 1) {
              villain.calls(1);
              renderButtons(0);
            // villain calls a raise -> next street
            } else if (facingBet > 1) {
              villain.calls(facingBet);
              hideHeroActionBar = true;
              setTimeout((function() {
                return dealNextStreet(currentStreet);
              }), 1000);
            }
            villainActing.innerHTML = 'Villain calls  ';
          // raise
          } else if (rand > 66) {
            betAmount = hero.getCurrentBet() * 2;
            villainCreateAndMakeBet(betAmount);
            renderButtons(betAmount);
          }
        } else {
          // OOP
          // react to Hero call blind
          if (hero.getCurrentBet() === 2) {
            renderVillainCheckText();
            hideHeroActionBar = true;
            setTimeout((function() {
              return dealNextStreet(currentStreet);
            }), 1000);
            if (rand < 50) {
              villain.calls(hero.getCurrentBet() - villain.getCurrentBet());
              villainActing.innerHTML = 'Villain Calls ';
              //renderButtons(0) # clean buttons for new street
              hideHeroActionBar = true;
              setTimeout((function() {
                return dealNextStreet(currentStreet);
              }), 1000);
            } else if (rand > 50) {
              betAmount = hero.getCurrentBet() + 98;
              villainCreateAndMakeBet(betAmount);
              renderButtons(betAmount);
            }
          }
          // hero raised pre-flop
          if (hero.getCurrentBet() > 2) {
            // fold to raise
            if (rand < 33) {
              villainFold();
              renderVillainFoldText();
            }
            // call
            if (rand > 33 && rand < 66) {
              villain.calls(hero.getCurrentBet() - villain.getCurrentBet());
              villainActing.innerHTML = 'Villain Calls ';
              
              //renderButtons(0) # clean buttons for new street
              hideHeroActionBar = true;
              setTimeout((function() {
                return dealNextStreet(currentStreet);
              }), 1000);
            
            // raise
            } else if (rand > 66) {
              betAmount = hero.getCurrentBet() * 2;
              villainCreateAndMakeBet(betAmount);
              renderButtons(betAmount);
            }
          }
        }
      //#
      // FLOP ###############
      //#
      } else if (currentStreet === 2) {
        // facing check
        if (hero.getCurrentBet() === 0) {
          if (rand < 33) {
            // villain check -> next street if dealer
            villainActing.innerHTML = 'Villain checked';
            if (!heroIsDealer) {
              hideHeroActionBar = true;
              setTimeout((function() {
                return dealNextStreet(currentStreet);
              }), 1000);
            }
          // villain bet small
          } else if (rand > 33 && rand < 66) {
            betAmount = hero.getCurrentBet();
            betAmount += 100;
            villainCreateAndMakeBet(betAmount);
            renderButtons(betAmount);
          // villain bet big
          } else if (rand > 66) {
            betAmount = hero.getCurrentBet() + 100;
            villainCreateAndMakeBet(betAmount);
            renderButtons(betAmount);
          }
        } else {
          // villain faces bet flop
          if (rand < 33) {
            villainFold();
            renderVillainFoldText();
          } else if (rand < 66) {
            // CALL
            villain.calls(hero.getCurrentBet() - villain.getCurrentBet());
            
            //renderButtons(0)
            hideHeroActionBar = true;
            setTimeout((function() {
              return dealNextStreet(currentStreet);
            }), 1000);
          } else {
            
            // RAISE
            betAmount = hero.getCurrentBet();
            betAmount += 100;
            villainCreateAndMakeBet(betAmount);
            renderButtons(betAmount);
          }
        }
      //#
      // TURN #####################
      //#
      } else if (currentStreet === 3) {
        // facing check
        if (hero.getCurrentBet() === 0) {
          // check
          if (rand < 33) {
            villainActing.innerHTML = 'Villain checked';
            if (!heroIsDealer) {
              hideHeroActionBar = true;
              setTimeout((function() {
                return dealNextStreet(currentStreet);
              }), 1000);
            }
          } else if (rand > 33 && rand < 66) {
            betAmount = hero.getCurrentBet();
            betAmount += 100;
            villainCreateAndMakeBet(betAmount);
            renderButtons(betAmount);
          } else {
            betAmount = hero.getCurrentBet();
            betAmount += 100;
            villainCreateAndMakeBet(betAmount);
            renderButtons(betAmount);
          }
        } else {
          
          // villain faces bet turn
          villain.calls(hero.getCurrentBet() - villain.getCurrentBet());
          
          //renderButtons(0)
          villainActingText = 'Villain Calls ';
          hideHeroActionBar = true;
          setTimeout((function() {
            return dealNextStreet(currentStreet);
          }), 1000);
        }
      
      // RIVER #####################

      } else if (currentStreet === 4) {
        // facing check
        if (hero.getCurrentBet() === 0) {
          // check IP
          if (rand < 33 && !heroIsDealer) {
            villainActing.innerHTML = 'Villain checks';
            setTimeout((function() {
              return dealNextStreet(currentStreet);
            }), 1000);
            // check OOP
            if (heroIsDealer) {
              // check to hero
              renderVillainCheckText();
              villainActing.innerHTML = 'Villain checks';
            }
          } else if (rand > 33 && rand < 66) {
            betAmount = hero.getCurrentBet();
            betAmount += 100;
            villainCreateAndMakeBet(betAmount);
            renderButtons(betAmount);
          } else {
            betAmount = hero.getCurrentBet();
            betAmount += 200;
            villainCreateAndMakeBet(betAmount);
            renderButtons(betAmount); //###
          }
        } else {
          // villain faces bet river
          if (rand < 33) {
            villainFold();
            renderVillainFoldText();
          } else if (rand < 66) {
            betAmount = hero.getCurrentBet() - villain.getCurrentBet();
            hideHeroActionBar = true;
            villain.calls(betAmount);
            villainActing.innerHTML = 'Villain calls';
            setTimeout((function() {
              return dealNextStreet(currentStreet);
            }), 1000);
          } else {
            betAmount = hero.getCurrentBet();
            betAmount += 200;
            villainCreateAndMakeBet(betAmount);
            renderButtons(betAmount);
          }
        }
      }
      // This always runs after villain acts
      villain_image.classList.remove("glowing");
      renderStacks();
      if (hideHeroActionBar) {
        return button_bar.style.visibility = 'hidden';
      } else {
        return button_bar.style.visibility = 'visible';
      }
    }), 1000);
  };

  
  // HERO BUTTONS (ACTION LOGIC) #

  // FOLD BUTTON LOGIC
  heroFold = function() {
    // reset stuff for new hand
    hero_image.classList.remove("glowing");
    button_bar.style.visibility = 'hidden';
    villain.winsPot();
    renderEmptyHeroCards();
    currentStreet = 0;
    deck = getNewDeck();
    heroIsDealer = !heroIsDealer;
    // end of hand text
    emptyTableForAnnouncementText();
    hero_current_action.innerHTML = 'Fold';
    announcementText.innerHTML = 'Villain wins: ' + potSize + '$';
    announcementText.style.visibility = "visible";
    return setTimeout((function() {
      return startHand();
    }), 1000);
  };

  
  // BET/RAISE BUTTON LOGIC

  betRaise = function() {
    var amount;
    // the betsize sum inlcudes the players bet already on table. This gets adjusted in Player.bet()
    hero_image.classList.remove("glowing");
    amount = villain.getCurrentBet();
    if (amount <= 2) {
      amount = 100;
    } else {
      amount *= 2;
    }
    hero_current_action.innerHTML = '';
    hero.bets(amount);
    renderBets();
    return villainAct();
  };

  
  // CHECK/CALL BUTTON LOGIC

  checkCall = function() {
    var facingBet;
    facingBet = villain.getCurrentBet() - hero.getCurrentBet();
    hero_image.classList.remove("glowing");
    // check/call as dealer preflop
    if (currentStreet === 1 && heroIsDealer) {
      
      // calling SB 
      if (facingBet === 1) {
        hero.calls(1);
        villainAct();
      // calling raise 
      } else if (facingBet > 1) {
        hero.calls(facingBet);
        hero_current_action.innerHTML = '';
        setTimeout((function() {
          return dealNextStreet(currentStreet);
        }), 1000);
      }
    // check/call OOP preflop 
    } else if (currentStreet === 1 && !heroIsDealer) {
      hero.calls(facingBet);
      // calls a bet
      if (facingBet > 0) {
        hero_current_action.innerHTML = '';
        setTimeout((function() {
          return dealNextStreet(currentStreet);
        }), 1000);
      // checks BB
      } else if (facingBet <= 2) {
        renderHeroCheckText();
        setTimeout((function() {
          return dealNextStreet(currentStreet);
        }), 1000);
      }
    } else {
      
      // check/call IP -> always next street
      // NORMAL check/call every street
      if (heroIsDealer) {
        hero.calls(facingBet);
        if (facingBet === 0) {
          renderHeroCheckText();
        }
        setTimeout((function() {
          return dealNextStreet(currentStreet);
        }), 1000);
      // check/call OOP 

      // check to villain
      } else if (facingBet === 0) {
        hero.calls(facingBet);
        renderHeroCheckText();
        villainAct();
      // call a bet -> next street
      } else if (facingBet > 0) {
        hero.calls(facingBet);
        hero_current_action.innerHTML = '';
        setTimeout((function() {
          return dealNextStreet(currentStreet);
        }), 1000);
      }
    }
    button_bar.style.visibility = 'hidden';
    return renderBets();
  };

  // Hero ACTION buttons
  fold_btn.addEventListener('click', heroFold);

  check_call_btn.addEventListener('click', checkCall);

  bet_raise_btn.addEventListener('click', betRaise);

  
  // CREATE PLAYER CLASSES

  Player = class Player {
    constructor(stackSize, currentBet) {
      this.stackSize = stackSize;
      this.currentBet = currentBet;
    }

    paySmallBlind() {
      this.stackSize -= 1;
      return this.currentBet = 1;
    }

    payBigBlind() {
      this.stackSize -= 2;
      return this.currentBet = 2;
    }

    getStackSize() {
      return this.stackSize;
    }

    getCurrentBet() {
      return this.currentBet;
    }

    setCurrentBet(amount) {
      return this.currentBet = amount;
    }

    clearCurrentBet() {
      this.currentBet = 0;
      return clearBets();
    }

    winsPot() {
      this.stackSize += potSize;
      return renderStacks();
    }

    // the betsize sum inlcudes the players bet already on table. Adjusting this here
    bets(amount) {
      var prevBet;
      prevBet = this.currentBet;
      this.currentBet = amount;
      this.stackSize -= amount - prevBet;
      potSize += amount - prevBet;
      renderPot(potSize);
      return renderStacks();
    }

    // the call sum inlcudes the players bet already on table. Adjusting this here
    calls(amount) {
      this.currentBet += amount;
      this.stackSize -= amount;
      potSize += amount;
      renderPot(potSize);
      renderStacks();
      return renderBets();
    }

  };

  hero = new Player(defaultStackSize, 0);

  villain = new Player(defaultStackSize, 0);

  startHand = function() {
    // new reset stuff
    hero_current_action.innerHTML = '';
    hero_current_action.style.visibility = 'visible';
    hero_current_bet.style.visibility = 'visible';
    villain_current_bet.style.visibility = 'visible';
    announcementText.innerHTML = '';
    announcementText.style.visibility = "hidden";
    // reset stuff
    new_hand_btn.style.display = 'none';
    board = [];
    renderEmptyHeroCards();
    renderEmptyVillainCards();
    renderResetFlop();
    announcementText.innerHTML = '';
    villainActing.innerHTML = '';
    hero_current_action.innerHTML = '';
    hero_current_bet.innerHTML = '';
    villain_current_bet.innerHTML = '';
    potDOM.innerHTML = '';
    currentStreet = 0;
    
    // firt animation
    return setTimeout((function() {
      dealCards();
      // second animation
      return setTimeout((function() {
        potSize = 3;
        potDOM.innerHTML = 'Pot: $' + potSize;
        // Pay blinds
        if (heroIsDealer === true) {
          renderDealerBtn('hero');
          hero.paySmallBlind();
          villain.payBigBlind();
          renderBets();
          setTimeout((function() {
            renderButtons(villain.getCurrentBet() - hero.getCurrentBet());
            return button_bar.style.visibility = 'visible';
          }), 500);
          return renderStacks();
        } else {
          // Pay blinds
          renderDealerBtn(villain);
          button_bar.style.visibility = 'hidden';
          hero.payBigBlind();
          villain.paySmallBlind();
          renderBets();
          return villainAct();
        }
      }), 500);
    }), 500);
  };

  new_hand_btn.addEventListener('click', startHand);

  startHand();

}).call(this);
