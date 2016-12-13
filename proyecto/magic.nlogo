breed [players player]
breed [cards card]


players-own [
	devotion
	money
	liking
	deck
]

cards-own[
	money-value
	card-value
	type
]

to setup[
	clear all
	reset-ticks

	create players 10 [
		devotion 100
		money (100 + random 101)
		liking    ;; likings: 1 = Blue, 2 = Green, 
	]

]

to generate-type[
;; types: {CC, CG, CB, CW, CR, CC, CG, CB, CW, CR, CC, CG, CB, CW, CR, CC, CG, CB, CW, CR, CC, CG, CB, CW, CR,}

]