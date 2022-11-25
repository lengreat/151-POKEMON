// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedeks/models/models.dart';

class PokemonProvider extends ChangeNotifier{
  final String _baseURL='pokeapi.co';
  String query='';
  List<Pokemon> onDisplayPokemons=[];
  List<FlavorTextEntry> contextoPokemons=[];
   List<Pokemon> ListaBusqueda=[];
  String textoSpanish='';
  int dato=0;//Variable para q no se redibuje  mas de una vez
  //ya q al llamar al metodo getPokemonContext se hace un loop infinito
  PokemonProvider(){
    // ignore: avoid_print
    print('PokemonProvider incializado');
    getOnDisplayPokemons();
  }

  void getOnDisplayPokemons() async {
    final url=Uri.https(_baseURL, '/api/v2/pokedex/2/', {});
    final response=await http.get(url);
    final pokedexsResponse=PokemonResponse.fromJson(response.body);
    onDisplayPokemons=pokedexsResponse.pokemons;//guardo la lista de pokemones
    print(' API pokedekx consumida, procede a redibujar');
    notifyListeners();

  }
  List<Pokemon> get getSearchPokemons{
    String sub;
    for(int i=0;i<onDisplayPokemons.length;i++){
      if (query.length<=onDisplayPokemons[i].pokemonSpecies.name.length){
        sub=onDisplayPokemons[i].pokemonSpecies.name.substring(0,query.length);
        if(sub.contains(query))
          ListaBusqueda.add(onDisplayPokemons[i]);
      }
    }
    // for (Pokemon PK in onDisplayPokemons){
    //     ListaBusqueda.add(PK);
    // }
    return ListaBusqueda;
  }
  String get Getquery{
     return query;
  }
  set Setquery(String data){
    query=data;
  }
  
  set pokemonListaBusqueda(int i){
    ListaBusqueda=[];
  }
  void getPokemonContext(int index) async {
    final url=Uri.https(_baseURL, '/api/v2/pokemon-species/${index}/', {});
    final response=await http.get(url);
    final pokedexsResponse=PokemonContext.fromJson(response.body);
    contextoPokemons=pokedexsResponse.flavorTextEntries;//guardo la lista de pokemones
    print('API pokemonSpecies consumida, procede a redibujar');
    if(dato<1){
       notifyListeners();//Se redibuja tambien HomScreen ya q el provider se encuentra ahi
       dato++;
    }
    else{
       dato=0;
       contextoPokemons=[];//reinicinado arreglo para la proxmia entrada al detailscreen
       textoSpanish='';
       print('No se llama a notify, no redibuja');
    }
  }

   String get getTextoSpanish{
    for (int i=0; i<contextoPokemons.length; i++){
        if (contextoPokemons[i].language.name=='es')
        {
          textoSpanish=textoSpanish+contextoPokemons[i].flavorText;
          //break;//8 veces
        }
    }
    return textoSpanish;
  }
}