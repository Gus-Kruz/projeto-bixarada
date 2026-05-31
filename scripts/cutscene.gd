extends TextureRect

@onready var no_referencia = get_node('res://menu/selecao.tscn')
var player1 = no_referencia.player1
var player2 = no_referencia.player2
#var player1 = 'lorena'
#var player2 = 'carlos'
var dialogo = []

func _ready() -> void:
	if (player1 == 'rogerio' and player2 =='carlos') or ((player2 == 'rogerio' and player1 =='carlos')):
		dialogo = [
		['Lorena', 'Vocês parecem desanimados. O que aconteceu?'],
		['Carlos','Humm... Eu não sei... Só estou sem vontade...'],
		['Rogerinho','Eu também! O que está acontecendo comigo para estar assim?'],
		['Lorena','Eu to falando com VOCÊS, me parecem estar desanimados... Porque?'],
		['Lorena','Será que vocês realmente vieram aqui para um joguinho de ritmo?'],
		['Lorena','Provavelmente não, né? Hehehehe...'],
		['Lorena','Então vamos para o que realmente importa!!'],
		['Rogerinho e Carlos','À luta!'],
		['Carlos','Você decorou alguma música ou apenas balança os braços aleatóriamente?...'],
		['Rogerinho','Eu decorei sim! E pelo menos eu não ando dormindo que nem você.']
		]
	elif (player1 == 'rogerio' and player2 =='lorena') or ((player2 == 'rogerio' and player1 =='lorena')):
		dialogo = [
		['Lorena', 'Vocês parecem desanimados. O que aconteceu?'],
		['Carlos','Humm... Eu não sei... Só estou sem vontade...'],
		['Rogerinho','Eu também! O que está acontecendo comigo para estar assim?'],
		['Lorena','Eu to falando com VOCÊS, me parecem estar desanimados... Porque?'],
		['Lorena','Será que vocês realmente vieram aqui para um joguinho de ritmo?'],
		['Lorena','Provavelmente não, né? Hehehehe...'],
		['Lorena','Então vamos para o que realmente importa!!'],
		['Rogerinho e Lorena','À luta!'],
		['Lorena','Você não está velho demais para continuar com maracas? Quando vai conseguir um instrumento de verdade?'],
		['Rogerinho','Hum! E você não está velha demais para conversar com o nada? Quando vai parar de falar com as paredes?']
		]
	elif (player1 == 'lorena' and player2 =='carlos') or ((player2 == 'lorena' and player1 =='carlos')):
		dialogo = [
		['Lorena', 'Vocês parecem desanimados. O que aconteceu?'],
		['Carlos','Humm... Eu não sei... Só estou sem vontade...'],
		['Rogerinho','Eu também! O que está acontecendo comigo para estar assim?'],
		['Lorena','Eu to falando com VOCÊS, me parecem estar desanimados... Porque?'],
		['Lorena','Será que vocês realmente vieram aqui para um joguinho de ritmo?'],
		['Lorena','Provavelmente não, né? Hehehehe...'],
		['Lorena','Então vamos para o que realmente importa!!'],
		['Carlos e Lorena','À luta!'],
		['Carlos','Para onde você fica olhando?... Procurando ajuda dos seus amigos?…'],
		['Lorena','Hehehe, você nem sabe quanto! Espero que VOCÊ trate de ganhar para mim.']
		]
# Called when the node enters the scene tree for the first time.
	DialogueManager.start_dialogue(dialogo)
