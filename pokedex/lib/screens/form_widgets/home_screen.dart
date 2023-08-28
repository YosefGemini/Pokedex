import 'package:flutter/material.dart';
import 'package:pokedex/screens/form_widgets/category_screen.dart';
import 'package:pokedex/screens/form_widgets/perfil_screen.dart';
import 'package:pokedex/screens/form_widgets/pokemon_favorite_list.dart';
import 'package:pokedex/screens/form_widgets/pokemon_screen.dart';

class MainWidget extends StatefulWidget {
  static const routeName = '/';
  final bool sesionState;

  const MainWidget({Key? key, required this.sesionState}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _validateToken(widget.sesionState);
    super.initState();
  }

  String _validateToken(bool condition) {
    if (!condition) {
      // Si la condición no se cumple, navega a la ruta '/welcome'
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushReplacementNamed('/welcome');
      });
      return 'Sesion Incorrecta';
    }
    return 'Sesion Correcta';
  } // Cambia a true si se cumple la condición

  final List<Widget> _mainWidgets = const [
    CategoryScreen(),
    PokemonScreenWidget(),
    PokemonFavoriteListScreen(),
    ProfileScreen()
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.details),
              label: 'Pokemons',
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
              backgroundColor: Colors.blueAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
              backgroundColor: Colors.blueAccent)
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
