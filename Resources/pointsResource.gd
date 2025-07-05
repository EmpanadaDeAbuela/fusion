extends Resource
class_name PointsResource

# {nivel de pelotas combinadas: puntos ganados}
@export var pointsGainedPerPair = {0:0, 1:1, 2:2, 3:3, 4:5, 5:8, 6:13}

# {nivel de pelota clickeada: puntos perdidos (-1 resta 0, -2 jugada inútil)}
@export var pointsLostPerClick = {-1:0, 0:13, 1:8, 2:5, 3:3, 4:2, 5:1, 6:1, -2:25}

# {puntos perdidos si tocás algo y no hay ninguna fusión}
@export var pointsLostOnBadPlay = 40

# {impulso que genera la destrucción de la bola dependiendo del nivel}
@export var impulseForcePerLevel = {0:1500, 1:1250, 2:1100, 3:1000, 4:900, 5:800, 6:600}

# {nivel/ronda, cuanto más alto el nivel más probabilidad de pelotas de piedra}
@export var level:int

# {cantidad de pelotas que aparecen al principio, son los puntos que te quedan al final}
@export var ballAmount = 14

# {tamaño de la pelota de piedra dependiendo del nivel}
@export var stoneBallSize = {0:1, 1:1.1, 2:1.2, 3:1.3, 4:1.4, 5:1.5, 6:1.6, 7:1.7, 8:1.8, 9:1.9, 10:2, 11:2.1, 12:2.2, 13:2.3, 14:2.4, 15:2.5, 16:2.6, 17:2.7, 18:2.8, 19:2.9, 20:3}

@export var daltonicMode = false

func getPointsGained(pairLevel:int):
	return pointsGainedPerPair.get(pairLevel, 0)

func getPointsLost(ballLevel:int):
	return pointsLostPerClick.get(ballLevel, 0)

func getImpulseForsePerLevel(ballLevel:int):
	return impulseForcePerLevel.get(ballLevel, 0)

func getStoneBallSize():
	return stoneBallSize.get(level, 0)
	
func getLevel():
	return level

func nextLevel():
	level += 1

func setBallAmount(amount:int):
	ballAmount = amount

func getBallAmount():
	return ballAmount
