import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/shared/constants/app_colors.dart';
import 'src/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boilerplate code',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        textTheme: GoogleFonts.openSansTextTheme()
      ),
    );
  }
}