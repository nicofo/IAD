breed [coches coche]

coches-own[
  mensaje-actual
  mensaje-siguiente
  energia
  tDescanso
  parado
  probOcuparPos
  last-visited
]

to setup
  clear-all
  reset-ticks

    create-coches 10 [
    set mensaje-actual [] 
    setxy random-xcor random-ycor
    set energia (random 40) + 10
    set tDescanso energia
    set parado false
    set probOcuparPos random 101
    set color scale-color grey probOcuparPos 0 100
    set last-visited -1
  ]
end

to go
  ask coches with [parado = false] [
  caminar 1
  comprobar-vecino    ;; comprueba si hay un vecino, y en caso que lo haya intenta cambiar la posicion
  ]
  ask coches with [parado = true][
    set energia energia + 1
    if energia >= tDescanso [
      set parado false
    ]
  ]
  tick
end

to caminar [pasos] 
  fd pasos
  set energia energia - 1
  if energia = 0 [
    set parado true
  ]
end

  
  
to comprobar-vecino
  let break false
  foreach [who] of coches in-radius 2 with [parado = true] [
    if (? != last-visited) and (break = false) and (? != who)[
      print (word ? who last-visited)
      set break true
      set last-visited ?
    ]  
  ]
end