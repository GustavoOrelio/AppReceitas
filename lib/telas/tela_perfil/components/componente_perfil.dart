import 'package:cardapio/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NomePerfil extends StatelessWidget {
  const NomePerfil({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class ColunaSobrePerfil extends StatelessWidget {
  const ColunaSobrePerfil(
      {Key? key, required this.title, required this.titleValue})
      : super(key: key);
  final String title, titleValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titleValue,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
        )
      ],
    );
  }
}

class CustomRowBar extends StatelessWidget {
  const CustomRowBar(
      {Key? key,
      required this.title,
      required this.textColor,
      required this.lineColor,
      required this.onPress})
      : super(key: key);
  final VoidCallback onPress;
  final String title;
  final Color textColor, lineColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        height: 5.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: textColor,
                  ),
            ),
            SizedBox(
              height: 2.h,
              child: Divider(
                color: lineColor,
                thickness: 2.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
