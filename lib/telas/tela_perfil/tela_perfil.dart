import 'package:cardapio/constants.dart';
import 'package:cardapio/telas/tela_perfil/components/componente_perfil.dart';
import 'package:cardapio/telas/tela_perfil/model/perfil_model.dart';
import 'package:cardapio/widgets_globais/custom_grids.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TelaPerfil extends StatefulWidget {
  static String routeName = 'TelaPerfil';

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  int _selectedIndex = 0;
  MyProfileDetailModel myProfileDetailModel = MyProfileDetailModel(
      'assets/images/img2.jpg', 'Marry Jane', '32', '99', '450');

  @override
  Widget build(BuildContext context) {
    PageController myPage = PageController(initialPage: _selectedIndex);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                //Compartilhar perfil
              },
              icon: const Icon(CupertinoIcons.share))
        ],
      ),
      body: Padding(
        padding: screensDefaultPadding,
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    backgroundImage:
                        AssetImage(myProfileDetailModel.minhaImagem),
                    radius: 7.h,
                  ),
                  kSizedBox2,
                  NomePerfil(name: myProfileDetailModel.meuNome),
                  kSizedBox2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ColunaSobrePerfil(
                        title: 'Receitas',
                        titleValue: myProfileDetailModel.minhasReceitas,
                      ),
                      ColunaSobrePerfil(
                        title: 'Seguindo',
                        titleValue: myProfileDetailModel.meuSeguidores,
                      ),
                      ColunaSobrePerfil(
                        title: 'Seguidores',
                        titleValue: myProfileDetailModel.minhasIncricoes,
                      ),
                    ],
                  ),
                  kSizedBox2,
                  kSizedBox2,
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRowBar(
                    onPress: (() {
                      setState(() {
                        _selectedIndex = 0;
                        myPage.jumpToPage(_selectedIndex);
                      });
                    }),
                    title: 'Receitas',
                    textColor: _selectedIndex == 0
                        ? kPrimaryColor
                        : kTextSecondaryColor,
                    lineColor: _selectedIndex == 0
                        ? kPrimaryColor
                        : kTextSecondaryColor,
                  ),
                  CustomRowBar(
                    onPress: () {
                      setState(() {
                        _selectedIndex = 1;
                        myPage.jumpToPage(_selectedIndex);
                      });
                    },
                    title: 'Curtidos',
                    textColor: _selectedIndex == 1
                        ? kPrimaryColor
                        : kTextSecondaryColor,
                    lineColor: _selectedIndex == 1
                        ? kPrimaryColor
                        : kTextSecondaryColor,
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: myPage,
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  _buildMyRecipes(),
                  const Center(
                    child: Text('Curtidos'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildMyRecipes() {
    return GridView.builder(
      gridDelegate: kMyProfileGridDelegate,
      itemBuilder: (BuildContext context, int index) {
        return ProfileGridWidget(
            onPress: () {
              //Vizualizar os detalhes da receita;
            },
            favIcon: myRecipes[index].favoritos
                ? Icons.favorite
                : Icons.favorite_outline,
            favIconColor: myRecipes[index].favoritos
                ? kErrorBorderColor
                : kTextSecondaryColor,
            receitaImagem: myRecipes[index].img,
            receitaNome: myRecipes[index].nome,
            receitatipo: myRecipes[index].tipoComida,
            receitaDuracao: myRecipes[index].duracao);
      },
      itemCount: myRecipes.length,
    );
  }
}
