# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Project.destroy_all
Article.destroy_all
Category.destroy_all
Event.destroy_all
Admin.destroy_all

#admins initialization
admin_first_names = %w[Steeve Romane Lucas Martin]
admin_last_names = %w[Voccia Charraud Bischoff Bondonneau]
admin_pseudos = %w[Steeve Romane Lucas Martin]
admin_descriptions = ["Steeve est un cadreur et droniste émérite. De l’animation aux drones, il est le touche à tout de l’équipe.", "Romane est une femme engagée et pétillante qui aime réaliser des portraits touchants et intimistes.", "Lucas est un amoureux de la nature et de ses bruits. Il transforme l’image en poésie et la prise de son en mélodie.", "Martin est une usine à mondes. Il nous transporte à travers des contrées inexplorées, toujours à l'affût de nouvelles techniques."]
admin_specialities = ["Expert Porcin", "Expert Buse", "Expert Nuit", "Expert Pixel"]
admin_emails = %w[steeve@yopmail.com romane@yopmail.com lucas@yopmail.com martin@yopmail.com]
admin_passwords = %w[steeve romane lucas0 martin]

for i in 0..3 do
  admin = Admin.create(
    first_name:admin_first_names[i],
    last_name:admin_last_names[i],
    pseudo:admin_pseudos[i],
    description:admin_descriptions[i],
    speciality:admin_specialities[i],
    display:true,
    email:admin_emails[i],
    password:admin_passwords[i]
  )
end
puts "#{Admin.all.length} admins initalized"


#categories initialization
category_names = ["Institutionnel", "Documentaire", "Animalier", "Animation", "Portrait", "Expérimental"]

for i in 0..8 do
  category = Category.create(
    category_name: category_names[i]
  )
end
puts "#{Category.all.length} categories initalized"


#projects initialization
project_titles=["LA REBELLION SAUVAGE","ŒIL POUR ŒIL","EARTHSHIP SISTER","DE PLUMES A POILS","LES CHIMERES AUX SONGES DE FEU","NUEE D'EONS", "DE TERRE ET D'OS","VIE ET MORT D'UN PAPILLON","REGARDS NATURELS", "VOL AU DESSUS D'UN NIC DE PIGEON", "SABLES ET MAREES", "L'HISTOIRE D'UN CYCLE"]
project_descriptions=["Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de la L'Embossieux.","Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de la Pesse et les Parcs Naturels du Jura.", "Un projet réalisé par l'association Oeil de Biche, en partenariat avec le CNC","Un projet réalisé par l'association Oeil de Biche, en partenariat avec les espaces naturels parisiens","Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de Sanxay et l'association des amis de Gaston Bachelard.","Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de Menigoute.","Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de la Flesse et les sites archélogiques du Véron.","Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de Fichter et la Région Centre.","Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de Rotemberg et les Parcs Naturels du Vexon.", "Un projet réalisé par l'association Oeil de Biche, en partenariat les Monts Enrichmont","Un projet réalisé par l'association Oeil de Biche, en partenariat avec la commune de L'Embossieux.","Un projet réalisé par l'association Oeil de Biche, en partenariat avec le CNC"]
project_contents=["L’instinct du sauvage a pris le dessus sur des millénaires de domination de l’Homme sur la nature. Mais elle s’est réveillée. Les animaux sauvages se sont rebellés. Les humains sont désormais acculés dans des villes barricadées. Dans cette nouvelle ère du genre humain, le documentaire animalier est devenu subversif, il a été interdit par les gouvernements, qui tentent de faire oublier l’amour qu’avaient autrefois les humains pour les animaux sauvages. Mais malgré l’interdiction, il subsiste de nombreux films animaliers qui n’ont pas été détruits. Un groupe de naturalistes, refusant d’admettre que cette rébellion a eu lieu, a mis au point une drogue, permettant de basculer à l’intérieur des films animaliers, et tentent de revivre leurs sensations passées…","Au cœur du Parc Naturel Régional du Haut-Jura, se trouve une des espèces les plus mythiques que l’on peut rencontrer en Europe. Cette espèce, que l’on trouve ici dans sa plus forte concentration parmi le territoire français, c’est le Lynx Boréal. Les photographes l’adorent, les enfants le craignent, et les chasseurs le traquent. Le Lynx est la cible de toutes les émotions humaines, et fascine petits et grands. Ce documentaire propose de partir à sa quête, au cœur des forêts jurassiennes, qui, en hiver, recouvertes d’un manteau blanc, ont une allure de carte postale. Dans ce film, nous rencontrerons les passionnés qui le suivent. Parmi eux, nous suivrons Jean-Charles GROSOBJO, photographe spécialiste du Lynx, qui nous aidera à comprendre cet animal fabuleux.","Et si une énergie individuelle se transformait en véritable force collective ? Et si des femmes avaient le pouvoir de changer le futur de notre planète ? Déborah Pardo et Nathalie Ille sont des femmes déterminées à bousculer les choses et manières de penser. C'est à travers leur projet d'expedition de 16 jours en méditerranée sur le earthship sisters que nous retraçons les récits et projets de 14 femmes passionnées par la nature. Rythmés par différentes escales, nous les suivrons durant des actions de sensibilisation des scolaires et du grand public. Leur but ? Une prise de conscience environnementale et une pleine expression des potentialités féminines. Expédition, projets éducatifs de développement durable, conférences, coaching, nous rencontrons ces ambassadrices de l'environnement qui veulent donner la voix aux femmes mais également à l'environnement.","Les découvrant, là, à attendre, perchées sur leurs cannes, gloussantes et élégantes, il en bramerait. Il aimerait revenir à un mois où tout lui tombait sous les bois, saillirait ces robes grises à en perdre ces poils, sans qu’un esprit jaloux n’affecte son absence de raison. Alléchantes jarretières, têtes masqués au regard fondant, sa fidélité en ressort mise en cause. Le pied, la grue en fait, de champs en champs, sans gardien pour la rappeler à l’ordre ou lui tirer son gagne-pain. Non pas de mac, chacune à son compte.Une nuit aux besaces alourdies, mais non, simplement allégé par un sommeil attentif et réconfortant. Groupées, un dortoir, plusieurs nuits. Certainement pas de tapin. Dans l’attente, rien que le repos. On appelle un chat un chat, une grue une grue.","Lorsque la nuit se fait froide et effrayante, le feu vient réchauffer les corps et les coeurs. La flammèche promet chaleur et lumière au voyageur mais lui offre beaucoup plus. La promesse d’une contemplation dans les braises qui rougeoient et les flammes qui sarabandent. Une fascination sur laquelle le temps n’a pas d’emprise, un moment de rêve éveillé au plaisir du brasier. Elle lui offre la rêverie au coin du feu. Voyagez au coeur du foyer primitif, à travers l’imaginaire et le rêve des hommes. Entrez dans une faille, entre réalité et mythe, entre feu follet et salamandres enflammées, entre créature étincelle et monstruosité volcanique. Calydon le sanglier enflammé anéantira t'il le monde dans une déflagration assourdissante ? La rêverie par le feu efface la fine frontière entre flammèche et incendie.","Dans l'obscurité, une ombre se faufile entre les fougères. Bondissant entre ses cachettes, le petit mammifère ne se laisse pas observer. Entre les branches, des formes scintillent face à la lune. Les oreillards, chauves-souris aux amples oreilles entament leur ballet nocturne. Les membranes de leurs ailes vibrent au dessus de la rivière pendant qu'elles se gavent d'insectes. Au loin, le castor sort de sa hutte, le mammifère constructeur a dompté le bois et le fleuve avec sa queue plate caractéristique. L'évolution est parvenu depuis la même souche à offrir des mammifères volants ou nageurs, aux formes si variées. Voici l'histoire de cette évolution, celle des mammifères et cette souche, Protungulatum donnae, un des derniers ancêtres communs des oreillards, des castors d’Europe et de tous les mammifères placentaires.","L’instinct du sauvage a pris le dessus sur des millénaires de domination de l’Homme sur la nature. Mais elle s’est réveillée. Les animaux sauvages se sont rebellés. Les humains sont désormais acculés dans des villes barricadées. Dans cette nouvelle ère du genre humain, le documentaire animalier est devenu subversif, il a été interdit par les gouvernements, qui tentent de faire oublier l’amour qu’avaient autrefois les humains pour les animaux sauvages. Mais malgré l’interdiction, il subsiste de nombreux films animaliers qui n’ont pas été détruits. Un groupe de naturalistes, refusant d’admettre que cette rébellion a eu lieu, a mis au point une drogue, permettant de basculer à l’intérieur des films animaliers, et tentent de revivre leurs sensations passées…","Et si une énergie individuelle se transformait en véritable force collective ? Et si des femmes avaient le pouvoir de changer le futur de notre planète ? Déborah Pardo et Nathalie Ille sont des femmes déterminées à bousculer les choses et manières de penser. C'est à travers leur projet d'expedition de 16 jours en méditerranée sur le earthship sisters que nous retraçons les récits et projets de 14 femmes passionnées par la nature. Rythmés par différentes escales, nous les suivrons durant des actions de sensibilisation des scolaires et du grand public. Leur but ? Une prise de conscience environnementale et une pleine expression des potentialités féminines. Expédition, projets éducatifs de développement durable, conférences, coaching, nous rencontrons ces ambassadrices de l'environnement qui veulent donner la voix aux femmes mais également à l'environnement.", "Les découvrant, là, à attendre, perchées sur leurs cannes, gloussantes et élégantes, il en bramerait. Il aimerait revenir à un mois où tout lui tombait sous les bois, saillirait ces robes grises à en perdre ces poils, sans qu’un esprit jaloux n’affecte son absence de raison. Alléchantes jarretières, têtes masqués au regard fondant, sa fidélité en ressort mise en cause. Le pied, la grue en fait, de champs en champs, sans gardien pour la rappeler à l’ordre ou lui tirer son gagne-pain. Non pas de mac, chacune à son compte.Une nuit aux besaces alourdies, mais non, simplement allégé par un sommeil attentif et réconfortant. Groupées, un dortoir, plusieurs nuits. Certainement pas de tapin. Dans l’attente, rien que le repos. On appelle un chat un chat, une grue une grue.","Dans l'obscurité, une ombre se faufile entre les fougères. Bondissant entre ses cachettes, le petit mammifère ne se laisse pas observer. Entre les branches, des formes scintillent face à la lune. Les oreillards, chauves-souris aux amples oreilles entament leur ballet nocturne. Les membranes de leurs ailes vibrent au dessus de la rivière pendant qu'elles se gavent d'insectes. Au loin, le castor sort de sa hutte, le mammifère constructeur a dompté le bois et le fleuve avec sa queue plate caractéristique. L'évolution est parvenu depuis la même souche à offrir des mammifères volants ou nageurs, aux formes si variées. Voici l'histoire de cette évolution, celle des mammifères et cette souche, Protungulatum donnae, un des derniers ancêtres communs des oreillards, des castors d’Europe et de tous les mammifères placentaires.","Et si une énergie individuelle se transformait en véritable force collective ? Et si des femmes avaient le pouvoir de changer le futur de notre planète ? Déborah Pardo et Nathalie Ille sont des femmes déterminées à bousculer les choses et manières de penser. C'est à travers leur projet d'expedition de 16 jours en méditerranée sur le earthship sisters que nous retraçons les récits et projets de 14 femmes passionnées par la nature. Rythmés par différentes escales, nous les suivrons durant des actions de sensibilisation des scolaires et du grand public. Leur but ? Une prise de conscience environnementale et une pleine expression des potentialités féminines. Expédition, projets éducatifs de développement durable, conférences, coaching, nous rencontrons ces ambassadrices de l'environnement qui veulent donner la voix aux femmes mais également à l'environnement.", "Au cœur du Parc Naturel Régional du Haut-Jura, se trouve une des espèces les plus mythiques que l’on peut rencontrer en Europe. Cette espèce, que l’on trouve ici dans sa plus forte concentration parmi le territoire français, c’est le Lynx Boréal. Les photographes l’adorent, les enfants le craignent, et les chasseurs le traquent. Le Lynx est la cible de toutes les émotions humaines, et fascine petits et grands. Ce documentaire propose de partir à sa quête, au cœur des forêts jurassiennes, qui, en hiver, recouvertes d’un manteau blanc, ont une allure de carte postale. Dans ce film, nous rencontrerons les passionnés qui le suivent. Parmi eux, nous suivrons Jean-Charles GROSOBJO, photographe spécialiste du Lynx, qui nous aidera à comprendre cet animal fabuleux."]

for i in 0..11 do
  project = Project.create(
    title: project_titles[i],
    description: project_descriptions[i],
    content: project_contents[i],
    published:true,
    admin_id: Admin.all.sample.id
  )
  project.categories << Category.all.sample(2)
end
puts "#{Project.all.length} projects initialized"

 
#articles initialization
article_titles=["Bien chères Sarcelles", "La Vouivre du Jura"]
article_descriptions=["Retour sur le plus petit et charmant des canards","Retour sur la légende du Dragon Jurassien",]
article_contents=["Les sarcelles, les plus petits de nos canards, sont bien loin de manquer d’attrait et de charme. De par le monde, les espèces sont nombreuses, et l’on peut citer, au hasard, la sarcelle élégante, la sarcelle marbrée ou la sarcelle à ailes vertes. Dans notre cher hexagone, nous sommes, sauf extraordinaire, limités à deux espèces cousines:la sarcelle d’hiver et la sarcelle d’été. Une par saison dirions-nous. Tout semble les séparer.
L’une hiverne très régulièrement en France ; l’autre se tient de préférence en Afrique, du Sénégal (et son célébrissime Parc du Djoudj) au Niger. A l’époque des nids, toutes deux regagnent le centre et l’est de l’Europe. Les nicheurs sont plutôt rares chez nous puisque ni l’une ni l’autre ne dépasse les 500 couples. Parlons un peu de timbre, ou de voix si vous aimez mieux. Il y a de (trop) nombreuses années, j’ai entendu vers la fin du crépuscule des concerts de clochettes aux notes cristallines ; on ne pouvait le voir, mais je savais que c’était Edouard (un petit nom amical que je lui ai donné) et ses copains qui rentraient au marais, leur restaurant, après avoir sagement passé la journée dans la sécurité côtière. Le canard de mars (Querquedula) est bien connu pour sa voix de crécelle. Lorsqu’un vol d’une douzaine d’oiseaux vous survole au marais, il fait entendre une partition différente, dans des octaves plus basses. D’une manière générale, je l’ai trouvé moins bavard que son cousin. Quant au physique, quelques dizaines de grammes peuvent les séparer. C’est secondaire eu égard à leur beauté. Quel est donc le plus beau ? D’un côté, une tête de velours marron dont la beauté princière est soulignée par une belle virgule verte.Ca ne manque pas d’allure ! De l’autre, chez la sarcelle d’été, la virgule est blanche et décore bien opportunément la belle tête de couleur vineuse. Mais ce n’est sans doute pas son atout le plus précieux. De splendides scapulaires rehaussent la beauté de ses flancs et seul le canard pilet pourrait soutenir la comparaison à cet égard. Elles se croisent et se rencontrent avec d’importantes différences. La sarcelle d’hiver est un hivernant régulier en France, tandis que la sarcelle d’été peut être qualifiée d’oiseau de passage car si elle n’hiverne pas, elle ne niche pas (ou si peu) non plus. On peut la rencontrer parfois dès février, toute étonnée de se poser sur la glace, mais surtout en mars ou avril, parfois jusqu’en mai. Il s’agit de petits canards à propos desquels le monde scientifique a, pour la première fois, admis l’existence de jeux ; j’ai pu, pour ma part, observer ce comportement de nombreuses fois chez la sarcelle d’hiver. Ces jeux collectifs sont charmants. A l’occasion des plongeons ou des envols on voit, le sourire aux lèvres, jaillir l’eau en forme de vagues argentines. Si elles ne brillent pas par l’importance de leur reproduction dans l’hexagone, nos sarcelles, copiant en cela de nombreuses autres espèces faiblement reproductrices, s’adonnent dès février à leurs parades. Il s’agit visiblement d’un jeu qui prend rarement l’apparence d’un combat. C’est « la danse des canards » à certains moments pendant lesquels, sans se combattre, les mâles se pourchassent, et nous offrent des sortes de ballets. Puis ils prennent des postures montrant leur élégance et leur détermination:la sarcelle d’hiver se montre aisément volontaire pour se faire grande après avoir salué sa partenaire éventuelle. Sa cousine l’imite un peu tout en restant le seul des canards capable de maîtriser cette attitude. Elle fait semblant de boire et pose sa tête sur le dos. Puis, elle prend la parole de telle façon que seule une autre sarcelle peut comprendre ce qu’elle veut dire. N’oublions pas toutefois qu’il s’agit d’actes de séduction. Quand bien même il est souvent trop tôt, en assiste, parfois, avec un grand étonnement, à un accouplement. Chacun sait que dans le monde des Anséridés, l’accouplement est forcé. Passons, je vous en prie, sur ces mœurs discutables, pour ne penser qu’aux futurs canetons porteurs de rêves et d’espoirs.","De toutes les créatures qui hantent le Jura, la Vouivre, dont le nom dériverait du latin vipera, en est sans conteste la reine. Depuis la nuit des temps, la Wivre comme la nommaient déjà les celtes, sillonne notre ciel. Marcel Aymé la dépeint sous les trais d'une jeune fille sensuelle et farouche, beaucoup la décrivent comme un serpent ailé qui apparaît la nuit, se déplaçant vite et surtout, portant à son front, une énorme pierre précieuse qui donnerait à celui qui s'en emparerait, un pouvoir extraordinaire. Quand elle traverse le ciel, les enfants ferment les yeux et les vieillards se signent. On appelait 'château de la vouivre', les murgers. Elle est à Barésia au murger de la vouivre, elle est une rivière tout près de Champagnole et a donné son nom à de nombreux lieux-dits, 'Vouaivre', 'Vaivre', 'Voucho', 'Givre'. Elle est serpent de feu, ailé et lumineux. Elle est petite ou grande et porte une escarboucle ardente comme une braise, de valeur inestimable. Lorsqu'elle se baigne, elle doit le déposer sur la berge sablonneuse dans la mousse ou les buissons touffus, mais alors, sans cet œil magnifique, elle devient aveugle, inoffensive et ne peut vivre longtemps. Pour briller plus encore, elle colle sur son corps, pierres précieuses, or ou bijoux dérobés. Elle habite en châteaux et donjons ruinés, cavernes et abbayes. On la rencontre à la fontaine miraculeuse du Héron de Ruffey quand elle siège à Arlay. Elle est au château de l'Aigle, s'envole d'Oliferne à Dramelay. La vouivre du Mont rond y défend un trésor; elle en chassa un voleur qui, priant la sainte Vierge, parvint à se sauver vers les premières maisons où il s'évanouit. Il fit construire en souvenir de sa grâce accordée, un oratoire à Marie. On tenta de lui ôter son trésor à Valempoulière en 1818. Elle y buvait à la source de la Doye. En val de Mièges, elle est gardienne de grandes richesses au communal du pré du seigneur Fraroz et ne sort qu'à la chandeleur. Pour qui sait la voir, elle vole dans la nuit, de Mirebel à Montmorot, Orgelet et Dramelay jusqu'à la Tour-du-Meix, à Chatel de Joux et même à Lonchaumois à la fontaine de la Corbière … Celle de Jasseron fut célèbre. Elle se baigne dans l'Ain, la Bienne et la sernière, dit-on, fit tuée à Condes. En 1835, on vit une vouivre à Pagney. Un habitant descendu dans un gouffre s'y trouvera confronté et on la vit traverser les airs comme une barre de feu pour aller boire, son diamant posé à côté d'elle. En 1850, on la vit aussi traverser la Loue près du pont de Belmont pour aller du Mont Roland à la vieille tour de Vadans. On la vit à Bans en route vers Vadans. Son corps de serpent, ses ailes, son escarboucle et un globe lumineux qui paraissait la précéder d'une coudée y répandront une grande lumière ... On la voit aussi à la fontaine au pied du château de Chambéria, à Chisséria, à Dramelay où elle voltige souvent dans le bois de la fée à la base de la montagne pour s'en aller ensuite dans la tour de Montcroissant. A Cressia, à la source de Belle-Brune, au château d'Étoile, à la fontaine du Bonhomme, au château de Fétigny, à la source du ruisseau de Dessous-roche, à Larnaud, à l'étang de Tartres, à Marigna sur Valouse où elle boit tous les soirs au ruisseau de Valouson, dans la forêt de Leute près de Marigny, elle vole d'une montagne à l'autre au-dessus du lac de Chalain, on la voit aussi s'envoler du château de Mirebel à celui de Montmorot. D'ailleurs, Gargantua, lorsqu'il ouvrit la roche de Cogna pour boire au ruisseau du Drouvenan tarit sa source et notre vouivre dut désormais aller à la fontaine 'sous les blanchets'. Elle hante les châteaux de Presilly, Binans, Publy, Beauregard, d'Augea, du Frasnois, de Passenans, Pelapucin près de Rothonay, de Vernantois, de la Roche Thévenot près de Saint-Hymethière d'où elle partait chaque soir vers la Valouse, du Mont Poupet près de Salins, de Vaugrenans près Pagnoz, où on la confond parfois avec un monstre gardant un trésor; trois jeunes gens tentèrent de dérober ce dernier lorsque l'horrible créature les chargeant sur son dos, en déposa un au sommet du Mont Poupet, le deuxième dans la forêt de Chaux et le dernier dans les fossés du château de Vadans. Elle boit aux fontaine de Feurs, la Tour du Meix, à la Serpentine à Chapois, à la fontaine du château d'Aresches, à celle de Viaux de Medzet, elle se baigne dans la source du ruisseau de Dessiège, on la voit près de Champagnole à la côte de Montrivel. On la connaît à Poligny sur l'ancienne terre de Colonne, à Bersaillin, au Châtelet, à Chemenot. On jurait sous serment avoir vu la vouivre aux Bouchoux, à Saint-Claude, à Saint-Laurent en Grandvaux, à Moirans, à Morez ... Chacun avait sa vouivre ... celle de la Chaux du Dombief vole des ruines du château de l'Aigle jusqu'au lac puis aux ruines du monastère d'Ylay … La vouivre est une figure comtoise, sans doute un des souvenirs les plus importants qu'ait laissé en France la tradition celtique. Elle est la survivante de ces divinités des sources qu'adoraient les gaulois et qui se comptaient par milliers, elle a transporté à travers les âges, l'une des croyances les plus populaires de la Gaule antique."]

for i in 0..1 do
  article = Article.create(
    title: article_titles[i],
    description: article_descriptions[i],
    content: article_contents[i],
    published:true,
    admin_id: Admin.all.sample.id
  )
end
puts "#{Article.all.length} articles initialized"

#contacts initialization
contact1 = Contact.create(
  email: "jacqueline@mail.com",
  name: "Jacqueline Poulet",
  status: "Particulier",
  subject: "Bravo pour votre travail !",
  content: "Je tenais à vous féliciter personnellement pour ce travail magnifique que vous fournissez afin de nous faire goûter à tous une nature un peu plus belle chaque jour. Continuez comme ça! Et ne lâchez rien face au loby chasseur qui crève vos pneus tous les mois ! On les aura!"
)

contact2 = Contact.create(
  email: "robert@mail.com",
  name: "Robert Chasseur",
  status: "Professionnel",
  subject: "Des comptes à régler !",
  content: "Je tenais à vous dire que votre venus dans le Jura sur nos terres de chasse ne nous enchante guère... Les projections et débats que vous organisez n'intéresse personne de toutes façons! Atention le plomb ça part vite!!!!!!!!"
)

puts "#{Contact.all.length} contacts initialized"


#events initialization
event_titles = ["Stand sur le forum de la nature","Projection de De Terre et d'Os, le film","Papier Ciseaux Forêt Oiseaux", "Débat : La forêt dans la transition écologique","Atelier Bee to Bee", "Les controverses écologiques"]
event_descriptions=["Venez nous rencontrer lors du grand forum de la nature !", "Un film à voir pour comprendre nos souterrains","Un atelier pédagogique à l'Ecole Maternelle des Fenouils", "Venez débattre de ce sujet passionnant","Apprenez à fabriquer votre miel sans vous faire piquer !", "Tables rondes en présence d'acteurs incoutournables du sujet!"]
event_contents=[]
event_dates=[]
event_locations=[]

for i in 0..15 do
  event = Event.create(
    title: event_titles[i],
    description: event_descriptions[i],
    content: "test", #event_contents[i],
    date: "test", #event_dates[i],
    location: "test", #event_locations,
    published:true,
    admin_id: Admin.all.sample.id
  )
end
puts "#{Event.all.length} events initialized"


