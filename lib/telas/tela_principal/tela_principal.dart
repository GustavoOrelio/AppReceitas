import 'package:cardapio/constants.dart';
import 'package:cardapio/telas/tela_de_login/tela_de_login.dart';
import 'package:flutter/material.dart';
import 'componentes/principal_componentes.dart';

class TelaPrincipal extends StatelessWidget {
  static String routeName = 'TelaPrincipal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const CustomStack(),
        kSizedBox1,
        Text(
          'Comece a cozinhar',
          style: Theme.of(context).textTheme.headline5,
        ),
        kSizedBox2,
        Text(
          'Junte-se à nossa comunidade para \n cozinhar a melhor comida!',
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
        kSizedBox2,
        PrincipalBtn(onPress: () {
          //Ir para a proxima tela
          Navigator.pushNamedAndRemoveUntil(
              context, TelaDeLogin.routeName, (route) => false);
        }),
        kSizedBox2,
        kSizedBox2,
      ],
    ));
  }
}
