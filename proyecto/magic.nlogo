breed [players player]
breed [cards card]


players-own [
  devotion
  devotion-loss
  money
  salary
  liking
  deck
]

cards-own[
  money-value
  card-value
  card-type
]

to setup
    clear-all
    reset-ticks

  create-players 10 [
    setxy random-xcor random-ycor
    set devotion 1
    set devotion-loss ((1 + random 15) / 100)
    set money (100 + random 101)
    set salary (5 + random 16)
    set liking (n-of 2 ["C" "G" "B" "W" "R" "C" "G" "B" "W" "R"]) ;; C = Cyan (blue), G = Green, B = Black, W = White, R = Red.
    set deck []
  ]

    create-cards 3000 [
    set card-value (1 + random 5)
    set card-type (one-of ["C" "G" "B" "W" "R"])
    hide-turtle
  ]
    create-cards 1000 [
    set card-value (6 + random 2)
    set card-type (one-of ["C" "G" "B" "W" "R"])
    hide-turtle
  ]
    create-cards 1000 [
    set card-value (7 + random 4)
    set card-type (one-of ["C" "G" "B" "W" "R"])
    hide-turtle
  ]


end

to go
  	ask players[
  	set money (money + salary)
  	set deck (sentence deck open-pack)

  	if (random-float 1 < devotion loss)[
  		set devotion (devotion - (1/1000))
  	]
  	if (devotion =< 0)[
  		die
  	]
  ]
end

to-report open-pack
	;; TODO pasar las configuraciones a nlogo - price
	let price 100
	let pack []
	if money >= price [
  		set pack (sentence pack n-of 3 ([who] of cards with [card-value < 6]))
  		set pack (sentence pack one-of ([who] of cards with [((card-value < 8) and (card-value > 5))]))
  		set pack (sentence pack one-of ([who] of cards with [(card-value > 7)]))
  		set money (money - price)
  		]
  	report pack
  	
end