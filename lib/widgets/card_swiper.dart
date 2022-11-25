import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:pokedeks/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Pokemon> pokemons;
  const CardSwiper({ 
    Key? key, 
    required this.pokemons, 
  }) : super(key: key);

  @override
    Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    

    if (pokemons.isEmpty){//segmento necesario cuando aun no hay imagenes hasta que se carguen
      return  Container(
        width: double.infinity,
        height: size.height*0.55,
        color: Colors.red,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }else{
     return Container(
      width: double.infinity,
      height: size.height * 0.55,
      color: Colors.red,
      child: Swiper(
        axisDirection: AxisDirection.left,
        duration: 700,
        loop: true,
        autoplay: true,
        itemCount: pokemons.length,
        layout: SwiperLayout.DEFAULT,
        itemWidth: size.width*0.5,
        itemHeight: size.height*0.6,
        itemBuilder: (_, int index){
          final pokemon=pokemons[index];//no funciona si el itemcount no esta definido
          final namePokemon=pokemon.pokemonSpecies.name;
          String rutaImagen=pokemon.generacionDeRuta();
          
          return GestureDetector(
            onTap: (){
            Navigator.pushNamed(context, 'details', arguments: pokemon);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInImage(
                   placeholder: const AssetImage('assets/no-image.jpg'),
                   image: AssetImage(rutaImagen),
                   fit: BoxFit.cover,
                   height: 260,
                  ),
                  const SizedBox(height: 2,),
                  Text(
                   namePokemon,
                   overflow: TextOverflow.ellipsis,
                   style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                   maxLines: 1,
                   textAlign: TextAlign.center,
                    
                  ),
                ],
              ),
            ),
          );
          
         
          
        },
      ),
    );
    }
  }

}




