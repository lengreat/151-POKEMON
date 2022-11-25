import 'package:flutter/material.dart';
import 'package:pokedeks/models/models.dart';
import 'package:pokedeks/providers/providers.dart';
import 'package:provider/provider.dart';

class PokemonSearchDelegate extends SearchDelegate{
  // String get searchFieldLabel=>'Buscar Pokemon';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        onPressed: ()=>query='', 
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
        //en vez de null puede ir cualquier cosa despues de terminar el future, es como un "then"
      },
      icon:const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.isEmpty){
      return _emptyContainer();
    }else{
      return _pushEnter(context);
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isEmpty){
      return _emptyContainer();
    }else{
      return _pushEnter(context);
    }

    
  }
  //cuando no hay texto ingresado aun
  Widget _emptyContainer(){
    return Container(
        child:const  Center(
          child: Icon(
            Icons.android_outlined,
            color: Colors.black,
            size: 160,
          ),
        ),
      );
  }

  Widget _pushEnter(BuildContext context) {
    final pokemonProvider=Provider.of<PokemonProvider>(context, listen: false);
      final List<Pokemon> pokemones;
      pokemonProvider.Setquery=query;
      //procedo a asignar solo los pkemones de la busqueda
      if (!pokemonProvider.onDisplayPokemons.isEmpty){
        pokemonProvider.ListaBusqueda=[];//reinicia el listado para q no vaya sumando
        pokemones=pokemonProvider.getSearchPokemons;
      }else pokemones=[];//si aun no hay respuesta del provider

      return ListView.builder(
        itemCount: pokemones.length,
        itemBuilder: (_, int index)=> _ContainerSearch(query: index.toString(), pokemon: pokemones[index],),
      );
  }

 
}

class _ContainerSearch extends StatelessWidget {
  final String query;
  final Pokemon pokemon;
  const _ContainerSearch({ Key? key, required this.query, 
  required this.pokemon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/no-image.jpg'),
        image:AssetImage(pokemon.generacionDeRuta()) ,
        width: 50,
      ) ,
      title: Text(pokemon.pokemonSpecies.name,
        style: const TextStyle(fontSize: 22),
      ),
      onTap: (){
        print(pokemon.pokemonSpecies.name);
        Navigator.pushNamed(context, 'details', arguments: pokemon);
      },
      
      
     
    );
    
    
    
   
  }
}