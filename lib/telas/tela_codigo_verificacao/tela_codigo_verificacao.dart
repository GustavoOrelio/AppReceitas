import 'package:cardapio/constants.dart';
import 'package:cardapio/telas/tela_nova_senha/tela_nova_senha.dart';
import 'package:cardapio/widgets_globais/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class TelaCodigoVerificacao extends StatefulWidget {
  static String routeName = 'TelaCodigoVerificacao';

  @override
  State<TelaCodigoVerificacao> createState() => _TelaCodigoVerificacao();
}

class _TelaCodigoVerificacao extends State<TelaCodigoVerificacao> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode _node2;
  late FocusNode _node3;
  late FocusNode _node4;
  int duration = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _node2 = FocusNode();
    _node3 = FocusNode();
    _node4 = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _node2.dispose();
    _node3.dispose();
    _node4.dispose();
    super.dispose();
  }

  void nextNode({String? value, FocusNode? focusNode}) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  _buildError() {
    return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Código errado')));
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
                'Verifique seu email!',
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              kSizedBox1,
              Text(
                'Enviamos um código para o seu email',
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle2,
              ),
              kSizedBox2,
              kSizedBox2,
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildNode1Box(),
                          buildNode2Box(),
                          buildNode3Box(),
                          buildNode4Box(),
                        ],
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reenviar código em: ',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle2,
                  ),
                  TweenAnimationBuilder(
                    tween: IntTween(begin: duration, end: 0),
                    duration: Duration(seconds: duration),
                    builder: (context, int value, child) =>
                        Text(
                          "${value.toInt()}",
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                  ),
                ],
              ),
              kSizedBox2,
              kSizedBox2,
              CustomBtn(
                  onPress: () {
                    //Vai para a tela de digitar nova senha
                    Navigator.pushNamed(context, TelaNovaSenha.routeName);
                  },
                  title: 'Verificar'),
              kSizedBox2,
              kSizedBox2,
              CustomIconBtn(
                  onPress: () {
                    //Reenvia o codigo de verificação
                  },
                  title: '  Reenviar',
                  icon: 'assets/icons/send.svg')
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildNode1Box() {
    return SizedBox(
      width: 20.w,
      height: 10.h,
      child: TextFormField(
        autofocus: true,
        textInputAction: TextInputAction.next,
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: const InputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _buildError();
          }
          return null;
        },
        onChanged: (value) {
          nextNode(value: value, focusNode: _node2);
        },
      ),
    );
  }

  SizedBox buildNode2Box() {
    return SizedBox(
      width: 20.w,
      height: 10.h,
      child: TextFormField(
        focusNode: _node2,
        textInputAction: TextInputAction.next,
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: const InputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _buildError();
          }
          return null;
        },
        onChanged: (value) {
          nextNode(value: value, focusNode: _node3);
        },
      ),
    );
  }

  SizedBox buildNode3Box() {
    return SizedBox(
      width: 20.w,
      height: 10.h,
      child: TextFormField(
        focusNode: _node3,
        textInputAction: TextInputAction.next,
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: const InputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _buildError();
          }
          return null;
        },
        onChanged: (value) {
          nextNode(value: value, focusNode: _node4);
        },
      ),
    );
  }

  SizedBox buildNode4Box() {
    return SizedBox(
      width: 20.w,
      height: 10.h,
      child: TextFormField(
        focusNode: _node4,
        textInputAction: TextInputAction.next,
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: const InputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _buildError();
          }
          return null;
        },
        onChanged: (value) {
          _node4.unfocus();
        },
      ),
    );
  }
}
