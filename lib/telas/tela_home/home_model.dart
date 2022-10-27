class HomeItemModel {
  String chefImg;
  String chefNome;
  String img;
  String nome;
  String tipoComida;
  String duracao;
  bool favorite;

  HomeItemModel(this.chefImg, this.chefNome, this.img, this.nome,
      this.tipoComida, this.duracao, this.favorite,);
}

List<HomeItemModel> homeModel = [
  HomeItemModel(
      'assets/images/img1.jpg',
      'Alan Cardoso',
      'assets/images/BakedPizza.jpg',
      'Pizza',
      'Comida',
      '>50 min',
      false),
  HomeItemModel(
      'assets/images/img2.jpg',
      'Marry Jane',
      'assets/images/Carbonara.jpg',
      'Carbonara',
      'Comida',
      '>35 min',
      false),
  HomeItemModel(
      'assets/images/img5.jpg',
      'Alan Cardoso',
      'assets/images/pizza.jpg',
      'Pizza',
      'Pizza',
      '>45 min',
      false),
  HomeItemModel(
      'assets/images/img6.jpg',
      'Alan Cardoso',
      'assets/images/salad.jpg',
      'Salada',
      'Salada',
      '>25 min',
      false),
  HomeItemModel(
      'assets/images/img7.jpg',
      'Alan Cardoso',
      'assets/images/Steak.jpg',
      'Steak',
      'Comida',
      '>65 min',
      false),
];