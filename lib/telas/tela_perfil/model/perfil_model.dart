class MyRecipesItemModel {
  String img;
  String nome;
  String tipoComida;
  String duracao;
  String numeroCurtidas;
  String descricao;
  List<String> ingredientes;
  List<String> etapasReceita;
  bool favoritos;

  MyRecipesItemModel(
    this.img,
    this.nome,
    this.tipoComida,
    this.duracao,
    this.numeroCurtidas,
    this.descricao,
    this.ingredientes,
    this.etapasReceita,
    this.favoritos,
  );
}

List<MyRecipesItemModel> myRecipes = [
  MyRecipesItemModel(
    "assets/images/BakedPizza.jpg",
    "Pizza de Calabreza",
    "Comida",
    "> 50 min",
    "260",
    "Como preparar uma pizza de calabreza",
    [
      "MASSA:",
      "500g de farinha de trigo",
      "25g de fermento para pão",
      "1 copo de água",
      "1 ovo",
      "50 g de gordura",
      "1 colher de sopa de fermento em pó",
      "1 colher de café de sal",
      "MOLHO:",
      "300g de tomate maduro",
      "50g de queijo parmesão ralado",
      "Sal",
      "Orégano",
      "1 colher de sopa de azeite de oliva",
      "COBERTURA:",
      "300 g de linguiça calabresa defumada sem casca e em rodelas finas",
      "2 cebolas em rodelas finas",
      "1/2 xícara de chá azeitona preta sem caroço",
      "1 colher de sopa de azeite de oliva",
      "1 colher de café de orégano",
    ],
    [
      "MOLHO:",
      "Bata o tomate no liquidificador com os demais ingredientes até formar uma mistura homogênea.",
      "MASSA:",
      "Misture 50 g de farinha, fermento e um pouco de água.",
      "Deixe descansar por 20 minutos. Adicione os demais ingredientes e amasse até obter uma massa bem macia.",
      "Corte em 3 partes iguais, forme 3 bolas e cubra-as com um pano.",
      "Deixe descansar por 1 hora. Abra a massa com um rolo até obter 25 cm de diâmetro. Espalhe o molho de tomate por cima e leve para assar em forno pré-aquecido, a 180ºC, por 15 minutos.",
      "Retire e deixe esfriar.",
      "COBERTURA:",
      "Espalhe a linguiça sobre o molho de tomate e cubra com a cebola.",
      "Decore com a azeitona e regue com azeite e orégano.",
      "Retorne ao forno por mais 10 minutos.",
      "Retire do forno e sirva imediatamente.",
    ],
    false,
  ),
  MyRecipesItemModel(
      "assets/images/Carbonara.jpg",
      "Macarrão à carbonara",
      "Massa",
      "> 35 min",
      "350",
      "Como fazer um delicioso macarrão a carbonara",
      [
        "bacon picado a gosto"
            "queijo ralado a gosto",
        "3 ovos",
        "sal",
        "pimenta-do-reino a gosto",
        "macarrão de sua escolha (espaguete, fusili,etc.)",
        "creme de leite se quiser dar um toque diferente à receita",
      ],
      [
        "Frite bem o bacon, até ficar crocante (pode-se adicionar salame picado).",
        "Coloque o macarrão para cozinhar em água e sal.",
        "No refratário onde será servido o macarrão, bata bem os ovos com um garfo.",
        "Tempere com sal e pimenta a gosto, e junte o queijo ralado, também a gosto.",
        "Quando o macarrão estiver pronto, escorra e coloque (bem quente) sobre a mistura de ovos, misture bem.",
        "O calor da massa cozinha os ovos.",
        "Coloque o bacon, ainda quente, sobre o macarrão e sirva.",
      ],
      true)
];

class MyProfileDetailModel {
  String minhaImagem;
  String meuNome;
  String minhasReceitas;
  String meuSeguidores;
  String minhasIncricoes;

  MyProfileDetailModel(this.minhaImagem, this.meuNome, this.minhasReceitas,
      this.meuSeguidores, this.minhasIncricoes);
}
