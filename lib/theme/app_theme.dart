import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    primaryColor: Color.fromARGB(255, 13, 71, 161),
    scaffoldBackgroundColor: Colors.grey[100],
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 13, 71, 161),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)),
        ),
      ),
      textStyle: TextStyle(color:Colors.black87,fontWeight: FontWeight.w500,fontSize:12)
    ),
   
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 13, 71, 161),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black87),
      headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black87),
      headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black87),
      bodySmall: TextStyle(fontSize: 12.0, color: Colors.black54),
    ),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 13, 71, 161)),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 13, 71, 161),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: Color.fromARGB(255, 13, 71, 161),
      textColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 13, 71, 161),
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.light(
      surface: const Color.fromARGB(255, 238, 238, 238)
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    primaryColor: const Color.fromARGB(255, 52, 201, 129),
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 52, 201, 129),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: const Color.fromARGB(255, 52, 201, 129),
        foregroundColor: Colors.white,
        textStyle: TextStyle(color: Colors.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 52, 201, 129),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
      headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white70),
      bodySmall: TextStyle(fontSize: 12.0, color: Colors.white54),
    ),
    iconTheme: IconThemeData(color: const Color.fromARGB(255, 52, 201, 129)),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color.fromARGB(255, 52, 201, 129),
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      color: Colors.grey[800],
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: const Color.fromARGB(255, 52, 201, 129),
      textColor: Colors.white,
    ),
   colorScheme: ColorScheme.dark(
     surface: const Color.fromARGB(255, 71, 71, 75),
    primary: Colors.green),
    dialogTheme: DialogTheme(
      backgroundColor: const Color.fromARGB(255, 26, 26, 27),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}