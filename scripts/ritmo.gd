extends Node

#@export var mean: float;
#@export var stdDev: float;
var mean = 48373
var stdDev = 70000
func in_time(gameTime: int, inputTime: int):
	'''
	Recebe dois argumentos: gameTime, inputTime
	Ambos devem ser dados como a qtd. de microssegundos desde o início da engine
	Retorna se o input se encaixa no ritmo com base nas variáveis de calibração
	'''
	
	var threshold = 70000;
	
	var offsetPoint = gameTime+mean;
	var lowerBoundary = offsetPoint-threshold;
	var higherBoundary = offsetPoint+threshold;
	return inputTime > lowerBoundary and inputTime < higherBoundary;
