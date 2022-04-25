# processingForms

![image](https://user-images.githubusercontent.com/72779962/165156528-7be8793b-36a0-4e53-90cc-669c361959a3.png)

# Présentation du projet
Ce projet est une réalisation de deux model 3d représentants deux pyramides composées
de cubes, ces dernières suivent la spirale d'Ulame carrée

# objectifs
1. Deux objet 3D qui s’agissent d’une spirale d’Ulam carrée dont chaque cube
est associé à un identifiant unique
2. L’animation des deux objets par une rotation sur eux même
3. L'implémentation des textures afin d’afficher l’identifiant du cube sur ces
façades
4. Deux polynôme permettant de changer la variances des couleurs
5. L'implémentation des shader afin de faire des picking, et de l’afficher sur
l’autre pyramide



# développement :
1. Améliorer la fluidité des objets: pour résoudre ce problème j’ai procédé à la création
des cubes enregistrés dans des Pshape, qui sont ensuite utilisés par un Group
Pshape, qui sera dessiné par conséquent qu’une seule fois.

![image](https://user-images.githubusercontent.com/72779962/165156756-4aa9920b-b1ce-4cb2-a436-a171b25429d0.png)

2. Utilisation des vertex: afin d’utiliser des texture, j’ai remplacé les cubes par l’appel a
la méthode box, par des vertex, auquel j’ai passé en paramètre les coordonnés de la
texture.

![image](https://user-images.githubusercontent.com/72779962/165156793-0b20b65b-944a-4329-8d7b-5b8301902322.png)


3. Texture inversée: pour cela il faudra d’abord identifier les façade gauche et derrière,
et ensuite changer les coordonnés du premier vertex avec le deuxième, et le
troisième avec le dernier. Cela nous donnera un affichage des nombre sur toutes les
façades du cube


![image](https://user-images.githubusercontent.com/72779962/165156830-f2eb8868-363c-4ef8-8f76-7e29133adabb.png)


4. Implémentation des shaders: la création de deux shaders est recommandé pour
pouvoir faire le picking avec le shader invisible, et ensuite afficher le cube avec une
autre couleur grâce au deuxième shader.


![image](https://user-images.githubusercontent.com/72779962/165156867-21115077-9b46-45d5-b63d-54a7de687bd3.png)


Et cette identifiant est converti ensuite à son origine, ce qui donnera l’identifiant du
cube

![image](https://user-images.githubusercontent.com/72779962/165156910-930b1bf8-bcbc-4343-8b9f-176073e9e5d6.png)


# Conclusion:
Ce projet m’a donné l'opportunité de mettre en pratique mes connaissance en
processing, ce qui m'a permis non seulement de développer mes compétence en
informatique graphique, mais également de comprendre le fonctionnement des
shader dans des situation différents
