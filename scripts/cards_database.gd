extends Node

# Database des différentes cartes du jeu
# Infos cartes : [type, cout argent, cout social, cout env., nom, dommage, card_description]

enum {Eolapino, Nuclearo, Barrachat, Thermhibou}

const DATA = {
	Eolapino :
		["vent", 5, 6, 2, 10, "Eolapino", "Avec ses amis éoliennes, Eolapino produit de l'électricité grâce au vent"],
	Nuclearo :
		["nucléaire", 5, 2, 6, 20, "Nuclearo", "La centrale et ses enfants ne prennent pas beaucoup de place, mais polluent l'atmosphère"],
	Barrachat :
		["eau", 4, 6, 2, 15, "Barrachat", "Un barrage bien contrôler permet de produire beaucoup de manière naturel en créant même de nouveau écosystème!"],
	Thermhibou :
		["eau", 2, 1, 4, 15, "Thermhibou", "Une centrale thermique"],
}
