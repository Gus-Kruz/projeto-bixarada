extends Node

@export var mean: float;
@export var stdDev: float;
#var mean = 48373
#var stdDev = 25037
func in_time(gameTime: int, inputTime: int):
	'''
	Recebe dois argumentos: gameTime, inputTime
	Ambos devem ser dados como a qtd. de microssegundos desde o início da engine
	Retorna se o input se encaixa no ritmo com base nas variáveis de calibração
	'''
	
	var offsetPoint = gameTime+mean;
	var lowerBoundary = offsetPoint-stdDev;
	var higherBoundary = offsetPoint+stdDev;
	return inputTime > lowerBoundary and inputTime < higherBoundary;
