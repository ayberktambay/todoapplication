import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/theme/app_theme.dart';
import 'package:todo/theme/theme_bloc.dart';
import 'package:todo/theme/theme_library.dart';
import 'package:todo/view/menu/list_detail.dart';
import 'package:todo/view/menu/lists_view.dart';
import 'package:todo/view/menu/settings.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
void main() {
  runApp(
    BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child:  ToDoApplication(),
    ),
  );
}

class ToDoApplication extends StatefulWidget  {
   const ToDoApplication({super.key});

  @override
  State<ToDoApplication> createState() => _ToDoApplicationState();
}

class _ToDoApplicationState extends State<ToDoApplication>  with SingleTickerProviderStateMixin {
late final controller = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
         debugShowCheckedModeBanner: false,
         routes: {
           '/homepage':(context) => const ListDetailView(),
           '/settings': (context) => const SettingsView(),
         },
        title: 'Flutter Demo',
          theme: state is ThemeChanged ? state.themeData : AppTheme.lightTheme,
         home: const ListsView(),
        );
      },
    );
  }
}

