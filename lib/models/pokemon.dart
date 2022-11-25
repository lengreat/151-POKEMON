import 'dart:convert';
import 'package:pokedeks/models/models.dart';

class Pokemon {
    Pokemon({
        required this.entryNumber,
        required this.pokemonSpecies,
    });

    int entryNumber;
    Region pokemonSpecies;

    factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        entryNumber: json["entry_number"],
        pokemonSpecies: Region.fromMap(json["pokemon_species"]),
    );

    Map<String, dynamic> toMap() => {
        "entry_number": entryNumber,
        "pokemon_species": pokemonSpecies.toMap(),
    };

    String generacionDeRuta() {
      String rutaImagen;
      if ((entryNumber)<10){
          rutaImagen='assets/pokemons/00'+(entryNumber.toString())+'.png';
          //print(rutaImagen);
      }
      else{
             if((entryNumber)>10 && (entryNumber)<100){
                rutaImagen='assets/pokemons/0' +(entryNumber.toString())+'.png';
                // print(rutaImagen);
             }
              
             else if ((entryNumber)>=100 && (entryNumber)<152){
                rutaImagen='assets/pokemons/' +(entryNumber.toString())+'.png';
                // print(rutaImagen);
             }
             else
                rutaImagen='assets/quien.png';
      }
      return rutaImagen;
    }
}