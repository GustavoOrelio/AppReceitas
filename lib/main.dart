import 'package:cardapio/constants.dart';
import 'package:cardapio/telas/tela_principal/tela_principal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cardápio',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kScaffoldColor,
          textTheme: GoogleFonts.latoTextTheme().copyWith(
            headline5: TextStyle(
              fontWeight: FontWeight.w700,
              color: kTextPrimaryColor,
              fontSize: 18.sp,
            ),
            subtitle1: TextStyle(
              fontWeight: FontWeight.w300,
              color: kTextSecondaryColor,
              fontSize: 13.sp,
            ),
            button: TextStyle(
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: kTextWhiteColor,
            ),
          ),
        ),
        home: TelaPrincipal(),
      );
    });
  }
}
