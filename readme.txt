#rendering
villain action text -> set at villainAct() 
villain bet text -> in renderBets()
render hero actions at ACTION-BUTTONS
handStrengths updated at end of DealCards() functions
BUTTON BAR hiding at every BUTTON click, re-rendered in villainAct() and/or every dealStreet()
Glowing player rendererd at dealCards(), start/end of villainAct(), at click BUTTON BAR & renderButtonBar()


#logic
villainAct() -> whenever we want villain to REACT
currentStreet incremented inside dealCards() functions


# TODO
logic for kicker/high cards
card rank translate to string
when villain check BB -> doesnt go next street
buttonBar render missing raise amount when villain calls to me

