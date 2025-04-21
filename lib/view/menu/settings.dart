import 'package:flutter/material.dart';
import 'package:todo/utils/theme_changer.dart';
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Tema Seçimi", style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 8),
           ThemeChanger()
          ],
        ),
      ),
    );
  }
}