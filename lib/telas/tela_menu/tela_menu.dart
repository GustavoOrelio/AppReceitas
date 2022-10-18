import 'package:cardapio/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TelaMenu extends StatefulWidget {
  static String routeName = 'TelaMenu';

  @override
  State<TelaMenu> createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: 100.w,
          height: SizerUtil.deviceType == DeviceType.tablet ? 11.h : 8.h,
          margin: EdgeInsets.only(left: 3.w, right: 3.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomBar(
                  onPress: () {},
                  title: 'Menu',
                  iconColor: kPrimaryColor,
                  textColor: kPrimaryColor,
                  iconData: Icons.home_filled),
              CustomBottomBar(
                  onPress: () {},
                  title: 'Upload',
                  iconColor: kPrimaryColor,
                  textColor: kPrimaryColor,
                  iconData: Icons.upload),
              CustomBottomBar(
                  onPress: () {},
                  title: 'Notificações',
                  iconColor: kPrimaryColor,
                  textColor: kPrimaryColor,
                  iconData: Icons.notifications),
              CustomBottomBar(
                  onPress: () {},
                  title: 'Perfil',
                  iconColor: kPrimaryColor,
                  textColor: kPrimaryColor,
                  iconData: Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.iconColor,
      required this.textColor,
      required this.iconData})
      : super(key: key);
  final VoidCallback onPress;
  final String title;
  final Color iconColor;
  final Color textColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Icon(
            iconData,
            color: iconColor,
          ),
          kSizedBox1,
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: textColor,
                ),
          )
        ],
      ),
    );
  }
}
