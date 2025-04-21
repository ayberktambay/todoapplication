import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/theme/app_theme.dart';
import 'package:todo/theme/theme_bloc.dart';
import 'package:todo/theme/theme_library.dart';
class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  ThemeData? _selectedTheme;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
              ),
              child: DropdownButton<ThemeData>(
                isExpanded: true,
                underline: const SizedBox(),
                value: _selectedTheme ?? (BlocProvider.of<ThemeBloc>(context).state is ThemeChanged
                    ? (BlocProvider.of<ThemeBloc>(context).state as ThemeChanged).themeData
                    : AppTheme.lightTheme),
                items: <DropdownMenuItem<ThemeData>>[
                  DropdownMenuItem<ThemeData>(
                    value: AppTheme.lightTheme,
                    child: Row(children: [
                      const Icon(Icons.light_mode),
                      const SizedBox(width: 5),
                      Text('Açık Tema', style: Theme.of(context).textTheme.bodyLarge,),
                    ],)
                  ),
                  DropdownMenuItem<ThemeData>(
                    value: AppTheme.darkTheme,
                    child: Row(children: [
                      const Icon(Icons.dark_mode),
                      const SizedBox(width: 5),
                      Text('Koyu Tema', style: Theme.of(context).textTheme.bodyLarge,),
                    ],)
                  ),
                ],
                onChanged: (ThemeData? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedTheme = newValue;
                    });
                    BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(theme: newValue));
                  }
                },
              ),
            );
  }
}