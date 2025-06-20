extends Resource
class_name PointsResource

# {nivel de pelotas combinadas: puntos ganados}
@export var pointsGainedPerPair = {0:0, 1:1, 2:2, 3:3, 4:5, 5:8, 6:13}

# {nivel de pelota clickeada: puntos perdidos}
@export var pointsLostPerClick = {0:13, 1:8, 2:5, 3:3, 4:2, 5:1, 6:1}

# puntos perdidos si tocás algo y no hay ninguna fusión
@export var pointsLostOnBadPlay = 40

func getPointsGained(pairLevel:int):
	return pointsGainedPerPair.get(pairLevel, 0)

func getPointsLost(ballLevel:int):
	return pointsLostPerClick.get(ballLevel, 0)
