import 'package:babynama_assignment/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Palette.darkColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.openSans(
        color: Palette.whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      backgroundColor: Palette.darkColor,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Palette.whiteColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: Palette.whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Palette.darkColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Palette.blueColor,
    ),
    iconTheme: const IconThemeData(
      color: Palette.whiteColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Palette.darkColor,
      selectedItemColor: Palette.pinkColor,
      unselectedItemColor: Palette.whiteColor,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorColor: Palette.whiteColor,
      labelColor: Palette.pinkColor,
      unselectedLabelColor: Palette.whiteColor,
    ),
  );
}
