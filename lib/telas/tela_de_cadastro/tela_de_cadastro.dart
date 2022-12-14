import 'package:cardapio/constants.dart';
import 'package:cardapio/widgets_globais/custom_btn.dart';
import 'package:cardapio/widgets_globais/custom_suffix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class TelaDeCadastro extends StatefulWidget {
  static String routeName = 'TelaDeCadastro';

  @override
  State<TelaDeCadastro> createState() => _TelaDeCadastro();
}

class _TelaDeCadastro extends State<TelaDeCadastro> {
  final _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes = [FocusNode(), FocusNode(), FocusNode()];

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
                'Seja Bem-Vindo',
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
                      InkWell(
                        child: CircleAvatar(
                          backgroundColor: kFillColor,
                          radius: 10.h,
                          child: SvgPicture.asset(
                            "assets/icons/image.svg",
                            height: 10.h,
                          ),
                        ),
                      ),
                      kSizedBox2,
                      buildFullNameField(),
                      kSizedBox2,
                      buildEmailField(),
                      kSizedBox2,
                      buildPasswordField(),
                      kSizedBox2,
                      kSizedBox2,
                      CustomBtn(
                          onPress: () {
                            //Realiza o login
                            if (_formKey.currentState!.validate()) {
                              //Vai para a tela principal
                            }
                          },
                          title: 'Cadastrar'),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildFullNameField() {
    return TextFormField(
      focusNode: _focusNodes[0],
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Nome completo',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/person.svg',
          iconColor:
              _focusNodes[0].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        if (value!.length < 4) {
          return 'O nome precisa ter mais de 4 caract??res';
        }
        return null;
      },
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      focusNode: _focusNodes[1],
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Digite email ou telefone',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/email.svg',
          iconColor:
              _focusNodes[1].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Campo Obrigat??rio, Preencha por favor';
        } else if (!regExp.hasMatch(value)) {
          return 'Email inv??lido';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
        focusNode: _focusNodes[2],
        obscureText: true,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.visiblePassword,
        style: inputTextHintStyle,
        decoration: InputDecoration(
          labelText: 'Senha',
          suffixIcon: CustomSuffixIcon(
            iconSrc: 'assets/icons/lock.svg',
            iconColor: _focusNodes[2].hasFocus
                ? kTextPrimaryColor
                : kTextSecondaryColor,
          ),
        ),
        validator: (value) {
          if (value!.length < 5) {
            return 'A senha precisa ter mais de 5 caract??res';
          }
          return null;
        });
  }
}
