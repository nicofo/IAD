breed [coches coche]

coches-own[
	mensaje-actual
	mensaje-siguiente
	energia
	tDescanso
	parado
	probOcuparPos
]

to setup
  clear-all
  reset-ticks

    create-coches 10 [
    set mebsaje-actual [] 
    setxy random-xcor random-ycor
    set energia (random 40) + 10
    set tDescanso energia
    set parado false
    set probOcuparPos random 101
    set color scale-color grey probOcuparPos 0 100
  ]
end

to go
	ask coches with [parado = false] [
	caminar 1
	comprobar-vecino    ;; comprueba si hay un vecino, y en caso que lo haya intenta cambiar la posicion
	]
  ask coches with [parado = true][
    ;; TODO
  ]
end

to caminar [pasos] [
  fd pasos
  set energia energia-1
  if energia = 0 [
    set parado true
  ]
]

to comprobar-vecino [
  ask coches in-radius 2 [

  ]
]

to send-message[
    
  ask coches [

  ]
]