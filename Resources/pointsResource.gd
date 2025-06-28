extends Resource
class_name PointsResource

# {nivel de pelotas combinadas: puntos ganados}
@export var pointsGainedPerPair = {0:0, 1:1, 2:2, 3:3, 4:5, 5:8, 6:13}

# {nivel de pelota clickeada: puntos perdidos (-1 resta 0, -2 jugada inútil)}
@export var pointsLostPerClick = {-1:0, 0:13, 1:8, 2:5, 3:3, 4:2, 5:1, 6:1, -2:25}

# {puntos perdidos si tocás algo y no hay ninguna fusión}
@export var pointsLostOnBadPlay = 40

# {impulso que genera la destrucción de la bola dependiendo del nivel}
@export var impulseForcePerLevel = {0:1000, 1:900, 2:800, 3:700, 4:600, 5:500, 6:400}

# {nivel/ronda, cuanto más alto el nivel más probabilidad de pelotas de piedra}
@export var level = 2

func getPointsGained(pairLevel:int):
	return pointsGainedPerPair.get(pairLevel, 0)

func getPointsLost(ballLevel:int):
	return pointsLostPerClick.get(ballLevel, 0)

func getImpulseForsePerLevel(ballLevel:int):
	return impulseForcePerLevel.get(ballLevel, 0)

func getLevel():
	return level

func nextLevel():
	level += 1
