import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/providers/category_provider.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/screens/form_widgets/home_screen.dart';
import 'package:pokedex/screens/form_widgets/pokemon_details.dart';
import 'package:pokedex/screens/form_widgets/pokemon_favorite_list.dart';
import 'package:pokedex/screens/form_widgets/pokemon_screen.dart';
import 'package:pokedex/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/form_widgets/category_screen.dart';

//Importaciones de firebase

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/////////////////////////////
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CategoryProvider()),
          ChangeNotifierProvider(create: (context) => PokemonProvider()),
        ],
        child: MaterialApp(
          title: 'Pokedex',
          //home: new MainWidget(),
          initialRoute: MainWidget.routeName,
          routes: {
            MainWidget.routeName: (context) =>
                const MainWidget(sesionState: false),
            Welcome.routeName: (context) => Welcome(),
            PokemonDetailsScreen.routeName: (context) =>
                const PokemonDetailsScreen()
          },
        ));
  }
}
