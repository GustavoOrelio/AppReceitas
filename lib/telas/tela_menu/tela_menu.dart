import 'package:cardapio/constants.dart';
import 'package:cardapio/widgets_globais/custom_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TelaMenu extends StatefulWidget {
  static String routeName = 'TelaMenu';

  @override
  State<TelaMenu> createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController myPage = PageController(initialPage: _selectedIndex);
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
                  onPress: () {
                    setState(() {
                      _selectedIndex = 0;
                      myPage.jumpToPage(_selectedIndex);
                    });
                  },
                  title: 'Menu',
                  iconColor:
                      _selectedIndex == 0 ? kPrimaryColor : kTextSecondaryColor,
                  textColor:
                      _selectedIndex == 0 ? kPrimaryColor : kTextSecondaryColor,
                  iconData: Icons.home_filled),
              CustomBottomBar(
                  onPress: () {
                    setState(() {
                      _selectedIndex = 1;
                      myPage.jumpToPage(_selectedIndex);
                    });
                  },
                  title: 'Upload',
                  iconColor:
                      _selectedIndex == 1 ? kPrimaryColor : kTextSecondaryColor,
                  textColor:
                      _selectedIndex == 1 ? kPrimaryColor : kTextSecondaryColor,
                  iconData: Icons.upload),
              CustomBottomBar(
                  onPress: () {
                    setState(() {
                      _selectedIndex = 2;
                      myPage.jumpToPage(_selectedIndex);
                    });
                  },
                  title: 'Notificações',
                  iconColor:
                      _selectedIndex == 2 ? kPrimaryColor : kTextSecondaryColor,
                  textColor:
                      _selectedIndex == 2 ? kPrimaryColor : kTextSecondaryColor,
                  iconData: Icons.notifications),
              CustomBottomBar(
                  onPress: () {
                    setState(() {
                      _selectedIndex = 3;
                      myPage.jumpToPage(_selectedIndex);
                    });
                  },
                  title: 'Perfil',
                  iconColor:
                      _selectedIndex == 3 ? kPrimaryColor : kTextSecondaryColor,
                  textColor:
                      _selectedIndex == 3 ? kPrimaryColor : kTextSecondaryColor,
                  iconData: Icons.person),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: myPage,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          Center(
            child: Text('Menu')
          ),
          Center(
              child: Text('Upload')
          ),
          Center(
              child: Text('Notificações')
          ),
          Center(
              child: Text('Perfil')
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 16.w,
        height: 8.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: kPrimaryColor,
            child: const Icon(Icons.document_scanner_sharp),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


