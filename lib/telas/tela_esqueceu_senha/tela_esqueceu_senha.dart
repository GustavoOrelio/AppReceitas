import 'package:cardapio/constants.dart';
import 'package:cardapio/telas/tela_codigo_verificacao/tela_codigo_verificacao.dart';
import 'package:cardapio/widgets_globais/custom_btn.dart';
import 'package:cardapio/widgets_globais/custom_suffix.dart';
import 'package:flutter/material.dart';

class TelaEsqueceuSenha extends StatefulWidget {
  static String routeName = 'TelaEsqueceuSenha';

  @override
  State<TelaEsqueceuSenha> createState() => _TelaEsqueceuSenha();
}

class _TelaEsqueceuSenha extends State<TelaEsqueceuSenha> {
  final _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: screensDefaultPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recuperar Senha!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              kSizedBox1,
              Text(
                'Por favor digite seu email para recuperar a senha',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              kSizedBox2,
              kSizedBox2,
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildForgotPasswordField(),
                      kSizedBox2,
                      kSizedBox2,
                      CustomBtn(
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              //Vai para a tela de codigo de verificação
                            }
                            Navigator.pushNamed(context, TelaCodigoVerificacao.routeName);
                          },
                          title: 'Recuperar'),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildForgotPasswordField() {
    return TextFormField(
      focusNode: _focusNodes[0],
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Email',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/email.svg',
          iconColor:
              _focusNodes[0].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Campo Obrigatório, Preencha por favor';
        } else if (!regExp.hasMatch(value)) {
          return 'Email inválido';
        }
        return null;
      },
    );
  }
}
