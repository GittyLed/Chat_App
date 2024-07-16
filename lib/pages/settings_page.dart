import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../components/my_app_bar.dart';
import '../theme/theme_provider.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage();

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        title: "S E T T I N G S",
        actions: [],
      ),
      body: Center(
        child: Container(
          width: 600,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark Mode", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              CupertinoSwitch(
                onChanged: (value) => 
                Provider.of<ThemeProvider>(context, listen: false).toogleTheme(),
                value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}