Shop = {}

Shop.MarkerRGB = { r = 40, g = 80, b = 100, a1 = 250, a2 = 100 } -- ici vous pouvez modifier la couleur du marker en modifiant les 3 valeurs r,g,b
Shop.MarkerTextColor = "b" -- vous avez la couleur des ecriture du marker
Shop.Line1 = { r = 255, g = 255, b = 255, a = 100} -- ici vous avez la couleur des ligne du menu
Shop.Categorie1 = "~g~Nourriture" -- ici vous avez le nom de la categorie de votre menu
Shop.Line2 = { r = 255, g = 255, b = 255,a = 100} -- ici vous avez la couleur des ligne du menu
Shop.Categorie2 = "~y~Outils" -- ici vous avez le nom de la categorie de votre menu

Shop.food = {
    bread = { name = "bread", price = 4, label = "🥖 Pain" },
    water = { name = "water", price = 2, label = "🥤 Bouteille d'eau" },
    -- (nom de litem)  = { name = "nom de litem dans la base de donnée", price = 2, label = "nom de votre item afficher dans le menu exemple :🥤 Bouteille d'eau" },
}

Shop.utils = {
    phone = { name = "phone", price = 100, label = "📱 Téléphone" },
    -- (nom de litem)  = { name = "nom de litem dans la base de donnée", price = 2, label = "nom de votre item afficher dans le menu exemple :💽 Logiciel Gps" },
}

Shop.Pos = {
    {pos = vector3(-707.41, -914.04, 19.22)},
    {pos = vector3(1135.53, -982.07, 46.42)},
    {pos = vector3(1163.56, -323.71, 69.21)},
    {pos = vector3(373.94, 326.69,  103.57)},
    {pos = vector3(2557.3, 382.11,  108.62)},
    {pos = vector3(-3039.85, 585.59,  7.91)},
    {pos = vector3(-3241.91, 1001.42, 12.83)},
    {pos = vector3(547.65, 2670.88, 42.16)},
    {pos = vector3(1961.41, 3740.89, 32.34)},
    {pos = vector3(2679.02, 3280.67, 55.24)},
    {pos = vector3(1729.17, 6414.94, 35.04)},
    {pos = vector3(-1222.85, -907.05, 12.33)},
    {pos = vector3(-1487.17, -379.83, 40.16)},
    {pos = vector3(-2968.41, 390.05,  15.04)},
    {pos = vector3(1166.41, 2709.31, 38.16)},
    {pos = vector3(-48.52, -1757.29, 29.42)},
    {pos = vector3(-1820.86, 792.52,  138.12)},
    {pos = vector3(1698.44, 4924.39, 42.06)},
    {pos = vector3(25.75, -1347.30, 29.49)}
}