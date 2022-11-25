import 'package:flutter/material.dart';
import 'package:pokedeks/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Pokemon> pokemons;
  const MovieSlider({ 
    Key? key, 
    required this.pokemons }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    if (pokemons.isEmpty){//segmento necesario cuando aun no hay imagenes hasta que se carguen
      return  Container(
        width: double.infinity,
        height: 225,
        color: Colors.white12,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 225,
      color: Colors.white12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Lista de Pokemones ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ),
          Expanded(//Define tamano al hijo
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pokemons.length,
              itemBuilder: (_, int index){
                 return  _MoviePoster(pokemons: pokemons, id: index,);
              }
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final List<Pokemon> pokemons;
  final int id;
  const _MoviePoster({ 
    Key? key, 
    required this.pokemons, 
    required this.id }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon=pokemons[id];//no funciona si el itemcount no esta definido
    final namePokemon=pokemon.pokemonSpecies.name;
    String rutaImagen=pokemon.generacionDeRuta();
    return Container(
      width: 117,
      height: 150,
      color: Colors.white12,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: pokemon),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
               placeholder: const AssetImage('assets/no-image.jpg'),
               image: AssetImage(rutaImagen),
               width: 117,
               height: 155,
               fit: BoxFit.fill,
               ),
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            namePokemon,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }


}