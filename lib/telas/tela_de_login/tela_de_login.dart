import 'package:cardapio/constants.dart';
import 'package:cardapio/telas/tela_de_cadastro/tela_de_cadastro.dart';
import 'package:cardapio/telas/tela_esqueceu_senha/tela_esqueceu_senha.dart';
import 'package:cardapio/widgets_globais/custom_btn.dart';
import 'package:cardapio/widgets_globais/custom_suffix.dart';
import 'package:flutter/material.dart';

class TelaDeLogin extends StatefulWidget {
  static String routeName = 'TelaDeLogin';

  @override
  State<TelaDeLogin> createState() => _TelaDeLogin();
}

class _TelaDeLogin extends State<TelaDeLogin> {
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
                'Bem-Vindo Novamente!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              kSizedBox1,
              Text(
                'Por favor entre com sua conta aqui!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              kSizedBox2,
              kSizedBox2,
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildEmailField(),
                      kSizedBox2,
                      buildPasswordField(),
                      kSizedBox2,
                      InkWell(
                        onTap: () {
                          //Ao clicar vai para a tela de recuperar senha;
                          Navigator.pushNamed(context, TelaEsqueceuSenha.routeName);
                        },
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Esqueceu a senha?',
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: kPrimaryColor),
                          ),
                        ),
                      ),
                      kSizedBox2,
                      kSizedBox2,
                      CustomBtn(
                          onPress: () {
                            //Realiza o login
                            if(_formKey.currentState!.validate()){
                              //Vai para a tela principal
                            }
                          },
                          title: 'Entrar'),
                      kSizedBox2,
                      kSizedBox2,
                      Text(
                        'Ou continue com',
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      kSizedBox2,
                      kSizedBox2,
                      CustomIconBtn(
                          onPress: () {
                            //Realiza login com o google
                          },
                          title: 'Google',
                          icon: 'assets/icons/google.svg'),
                      kSizedBox2,
                      kSizedBox2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Não possui uma conta?",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          InkWell(
                            onTap: () {
                              //Vai para a tela de cadastro
                              Navigator.pushNamed(context, TelaDeCadastro.routeName);
                            },
                            child: Text(
                              "Cadastre-se aqui",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      focusNode: _focusNodes[0],
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Digite email ou telefone',
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

  TextFormField buildPasswordField() {
    return TextFormField(
        focusNode: _focusNodes[1],
        obscureText: true,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.visiblePassword,
        style: inputTextHintStyle,
        decoration: InputDecoration(
          labelText: 'Senha',
          suffixIcon: CustomSuffixIcon(
            iconSrc: 'assets/icons/lock.svg',
            iconColor: _focusNodes[1].hasFocus
                ? kTextPrimaryColor
                : kTextSecondaryColor,
          ),
        ),
        validator: (value) {
          if (value!.length < 5) {
            return 'A senha precisa ter mais de 5 caractéres';
          }
          return null;
        });
  }
}
