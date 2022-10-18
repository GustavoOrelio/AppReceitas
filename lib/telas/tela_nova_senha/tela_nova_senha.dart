import 'package:cardapio/constants.dart';
import 'package:cardapio/telas/tela_de_login/tela_de_login.dart';
import 'package:cardapio/widgets_globais/custom_btn.dart';
import 'package:cardapio/widgets_globais/custom_suffix.dart';
import 'package:flutter/material.dart';

class TelaNovaSenha extends StatefulWidget {
  static String routeName = 'TelaNovaSenha';

  @override
  State<TelaNovaSenha> createState() => _TelaNovaSenha();
}

class _TelaNovaSenha extends State<TelaNovaSenha> {
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
    _buildMessage(String message, Color color) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: color,
                ),
          ),
        ),
      );
    }

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
                'Redefinir sua Senha!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              kSizedBox1,
              Text(
                'Por favor digite sua nova senha',
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
                              _buildMessage(
                                  'Senha alterada com sucesso', kPrimaryColor);
                              Future.delayed(
                                  const Duration(seconds: 5),
                                  () => Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      TelaDeLogin.routeName,
                                      (route) => false));
                            } else {
                              _buildMessage(
                                  'Erro ao altererar senha', kErrorBorderColor);
                            }
                          },
                          title: 'Alterar Senha'),
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
      keyboardType: TextInputType.visiblePassword,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Nova Senha',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/lock.svg',
          iconColor:
              _focusNodes[0].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'A senha precisa ter mais de 5 caractéres';
        }
        return null;
      },
    );
  }
}
