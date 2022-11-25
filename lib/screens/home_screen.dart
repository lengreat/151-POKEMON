import 'package:flutter/material.dart';
import 'package:pokedeks/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pokedeks/providers/providers.dart';
import 'package:pokedeks/search/searh_delegate.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonsProvider=Provider.of<PokemonProvider>(context);
    print('Dibujando HomeScreen');
    return Scaffold(
      appBar: AppBar(
        title: const Text('151 POKEMONS'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed:()=> showSearch(context: context, delegate: PokemonSearchDelegate()), 
            icon: const Icon(Icons.search_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            CardSwiper(pokemons: pokemonsProvider.onDisplayPokemons,),
            MovieSlider(pokemons: pokemonsProvider.onDisplayPokemons,),
          ],
        ),
      )
    );
  }
}