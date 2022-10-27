import 'package:cardapio/constants.dart';
import 'package:cardapio/telas/tela_home/componentes/componente_home.dart';
import 'package:cardapio/telas/tela_home/home_model.dart';
import 'package:cardapio/widgets_globais/custom_grids.dart';
import 'package:cardapio/widgets_globais/custom_suffix.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TelaHome extends StatefulWidget {
  static const String routeName = 'TelaHome';

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController myPage = PageController(initialPage: _selectedIndex);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: screensDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kSizedBox2,
                kSizedBox2,
                buildSearchField(),
                kSizedBox2,
                Text(
                  'Categoria',
                  style: Theme.of(context).textTheme.headline6,
                ),
                kSizedBox2,
                Row(
                  children: [
                    CategoriaHomeBtn(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                            myPage.jumpToPage(_selectedIndex);
                          });
                        },
                        bgColor:
                            _selectedIndex == 0 ? kSecondaryColor : kFillColor,
                        titleColor: _selectedIndex == 0
                            ? kTextWhiteColor
                            : kTextSecondaryColor,
                        title: 'Todos'),
                    CategoriaHomeBtn(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                            myPage.jumpToPage(_selectedIndex);
                          });
                        },
                        bgColor:
                            _selectedIndex == 1 ? kSecondaryColor : kFillColor,
                        titleColor: _selectedIndex == 1
                            ? kTextWhiteColor
                            : kTextSecondaryColor,
                        title: 'Comidas'),
                    CategoriaHomeBtn(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                            myPage.jumpToPage(_selectedIndex);
                          });
                        },
                        bgColor:
                            _selectedIndex == 2 ? kSecondaryColor : kFillColor,
                        titleColor: _selectedIndex == 2
                            ? kTextWhiteColor
                            : kTextSecondaryColor,
                        title: 'Bebidas'),
                  ],
                ),
                kSizedBox2,
                kSizedBox2,
                Expanded(
                  child: PageView(
                    controller: myPage,
                    scrollDirection: Axis.vertical,
                    children: [
                      _buildAllRecipes(),
                      const Center(
                        child: Text('Comidas'),
                      ),
                      const Center(
                        child: Text('Bebidas'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAllRecipes() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: kHomeGridDelegate,
      itemBuilder: (BuildContext context, int index) {
        return HomeGridWidget(
            onPress: () {},
            chefNome: homeModel[index].chefNome,
            chefImagem: homeModel[index].chefImg,
            favIcon: homeModel[index].favorite
                ? Icons.favorite
                : Icons.favorite_outline,
            favIconColor:
                homeModel[index].favorite ? kErrorBorderColor : kScaffoldColor,
            receitaImg: homeModel[index].img,
            receitaNome: homeModel[index].nome,
            tipoReceita: homeModel[index].tipoComida,
            receitaDuracao: homeModel[index].duracao);
      },
      itemCount: homeModel.length,
    );
  }

  TextFormField buildSearchField() {
    return TextFormField(
      onTap: () {
        //Vai para a tela pesquisada;
      },
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      style: inputTextHintStyle.copyWith(
        color: kTextPrimaryColor,
      ),
      decoration: const InputDecoration(
          fillColor: kFillColor,
          labelText: 'Pesquisar',
          suffixIcon: CustomSuffixIcon(
              iconSrc: 'assets/icons/search.svg', iconColor: kIconColor)),
    );
  }
}
