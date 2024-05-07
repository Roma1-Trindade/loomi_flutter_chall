import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  TabBarTheme get tabBarTheme => Theme.of(this).tabBarTheme;
  CheckboxThemeData get checkboxTheme => Theme.of(this).checkboxTheme;
  RadioThemeData get radioTheme => Theme.of(this).radioTheme;
  ListTileThemeData get listTileTheme => Theme.of(this).listTileTheme;
  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      Theme.of(this).floatingActionButtonTheme;
  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      Theme.of(this).bottomNavigationBarTheme;
  BottomSheetThemeData get bottomSheetTheme => Theme.of(this).bottomSheetTheme;
  DialogTheme get dialogTheme => Theme.of(this).dialogTheme;
  SnackBarThemeData get snackBarTheme => Theme.of(this).snackBarTheme;
  ElevatedButtonThemeData get elevatedButtonTheme =>
      Theme.of(this).elevatedButtonTheme;
  CardTheme get cardTheme => Theme.of(this).cardTheme;

  FocusScopeNode get focusScope => FocusScope.of(this);

  void unfocus({UnfocusDisposition disposition = UnfocusDisposition.scope}) {
    FocusScope.of(this).unfocus();
  }

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);
}
