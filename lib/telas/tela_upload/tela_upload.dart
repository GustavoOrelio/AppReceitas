import 'package:cardapio/constants.dart';
import 'package:cardapio/telas/tela_upload/componentes/componente_upload.dart';
import 'package:cardapio/widgets_globais/custom_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

class TelaUpload extends StatefulWidget {
  static const String routeName = 'TelaUpload';

  @override
  State<TelaUpload> createState() => _TelaUploadState();
}

class _TelaUploadState extends State<TelaUpload> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: screensDefaultPadding,
            child: PageView(
              controller: controller,
              children: [
                _buildPage1(),
                _buildPage2(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildPage1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kSizedBox2,
        kSizedBox2,
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          children: [
            SizedBox(
              width: 90.w,
              height: 16.h,
              //child: DashBorder(),
            ),
            InkResponse(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/image.svg',
                    height: 6.h,
                  ),
                  kSizedBox1,
                  Text(
                    'Adicionar imagem',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  kSizedBox1,
                  Text(
                    'Máximo 10 mb',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
        kSizedBox2,
        kSizedBox2,
        Text(
          'Ingredientes',
          style: Theme.of(context).textTheme.headline6,
        ),
        kSizedBox1,
        _buildFoodNameField(),
        kSizedBox2,
        kSizedBox2,
        Text(
          'Descrição',
          style: Theme.of(context).textTheme.headline6,
        ),
        kSizedBox1,
        _buildDescriptionField(),
        kSizedBox2,
        kSizedBox2,
        Row(
          children: [
            Text(
              'Tempo de preparo',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              '(em minutos)',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        kSizedBox2,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '<10',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: _currentSliderValue.round().toString() == '0'
                        ? kPrimaryColor
                        : kTextSecondaryColor,
                    fontWeight: _currentSliderValue.round().toString() == '0'
                        ? FontWeight.w800
                        : FontWeight.w300,
                  ),
            ),
            Text(
              '30',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: _currentSliderValue.round().toString() == '30'
                        ? kPrimaryColor
                        : kTextSecondaryColor,
                    fontWeight: _currentSliderValue.round().toString() == '30'
                        ? FontWeight.w800
                        : FontWeight.w300,
                  ),
            ),
            Text(
              '>60',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: _currentSliderValue.round().toString() == '60'
                        ? kPrimaryColor
                        : kTextSecondaryColor,
                    fontWeight: _currentSliderValue.round().toString() == '60'
                        ? FontWeight.w800
                        : FontWeight.w300,
                  ),
            ),
          ],
        ),
        kSizedBox2,
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: kSecondaryColor,
            inactiveTrackColor: kFillColor,
            trackShape: const RectangularSliderTrackShape(),
            trackHeight: 14.0,
            thumbColor: kFillColor,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
            overlayColor: kSecondaryColor,
            overlayShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
            inactiveTickMarkColor: kFillColor,
          ),
          child: Slider(
              value: _currentSliderValue,
              max: 60,
              divisions: 2,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              }),
        ),
        kSizedBox2,
        CustomBtn(
            onPress: () {
              controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn);
            },
            title: 'Próximo')
      ],
    );
  }

  _buildPage2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kSizedBox2,
        kSizedBox2,
        Text(
          'Ingredientes',
          style: Theme.of(context).textTheme.headline6,
        ),
        kSizedBox1,
        _buildIngredientsField(),
        kSizedBox2,
        kSizedBox2,
        Text(
          'Etapas',
          style: Theme.of(context).textTheme.headline6,
        ),
        kSizedBox1,
        _buildStepsField(),
        kSizedBox2,
        GestureDetector(
          onTap: () {
            //Seleciona as imagens
          },
          child: Container(
            width: 100.w,
            height: 6.h,
            color: kFillColor,
            child: const Icon(
              CupertinoIcons.photo_camera_solid,
              color: kIconColor,
            ),
          ),
        ),
        kSizedBox2,
        CustomBtn(
            onPress: () {
              //Adiciona a receita
            },
            title: 'Adicionar receita'),
      ],
    );
  }

  double _currentSliderValue = 30;

  TextFormField _buildIngredientsField() {
    return TextFormField(
      textAlign: TextAlign.start,
      maxLines: 3,
      keyboardType: TextInputType.text,
      style: inputTextHintStyle.copyWith(
        color: kTextPrimaryColor,
      ),
      decoration: const InputDecoration(
        labelText: 'Digite os ingredientes separados por ,',
        filled: false,
      ),
    );
  }

  TextFormField _buildStepsField() {
    return TextFormField(
      textAlign: TextAlign.start,
      maxLines: 6,
      keyboardType: TextInputType.text,
      style: inputTextHintStyle.copyWith(
        color: kTextPrimaryColor,
      ),
      decoration: const InputDecoration(
        labelText: 'Digite as etapas separadas por ,',
        filled: false,
      ),
    );
  }

  TextFormField _buildFoodNameField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      style: inputTextHintStyle.copyWith(
        color: kTextPrimaryColor,
      ),
      decoration: const InputDecoration(
        labelText: 'Digite o nome da comida',
        filled: false,
      ),
    );
  }

  TextFormField _buildDescriptionField() {
    return TextFormField(
      textAlign: TextAlign.start,
      maxLines: 3,
      keyboardType: TextInputType.text,
      style: inputTextHintStyle.copyWith(
        color: kTextPrimaryColor,
      ),
      decoration: const InputDecoration(
        labelText: 'Descreva um pouco sua comida',
        filled: false,
      ),
    );
  }
}
