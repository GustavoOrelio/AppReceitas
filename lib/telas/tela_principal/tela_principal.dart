import 'package:cardapio/constants.dart';
import 'package:flutter/material.dart';
import 'componentes/principal_componentes.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

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
        }),
        kSizedBox2,
        kSizedBox2,
      ],
    ));
  }
}
