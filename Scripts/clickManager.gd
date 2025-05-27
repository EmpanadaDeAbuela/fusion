extends Node2D

var clicks = 3

func getClicks():
	return clicks
	
func setClicks(newclicks:int):
	clicks = newclicks

func restClicks():
	clicks = clicks - 1
