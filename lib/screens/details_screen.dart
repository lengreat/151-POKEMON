import 'package:flutter/material.dart';
import 'package:pokedeks/models/models.dart';
import 'package:provider/provider.dart';
import 'package:pokedeks/providers/providers.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon=ModalRoute.of(context)!.settings.arguments as Pokemon;//as no lo convierte, solo lo trata como tal
    final pokemonsProvider=Provider.of<PokemonProvider>(context, listen: true);//liste:false, ya no entra en fase loop ya q entraba en conflicto con el notify de getOndisplayPokemon
    print('dibujando DetailsScreen') ;
    pokemonsProvider.getPokemonContext(pokemon.entryNumber);//EL PROBLEMA RADICA AQUI
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
            _CustomAppbar(pokemon,),
          SliverList(
            delegate: SliverChildListDelegate(
            [
               _PosterAndTitle(pokemon: pokemon, pokemonContext: pokemonsProvider.contextoPokemons,),
               //Overview lleva dos parametros pero bien solo puede utilizar uno, tomar info desde el provider o desde el arreglo de flaviortext
               _Overview(contextoPokemon: pokemonsProvider.contextoPokemons, texto: pokemonsProvider.getTextoSpanish,),
            ]
          ))
        ],
      ),
    );
  }
}
class _Overview extends StatelessWidget {
  final List<FlavorTextEntry> contextoPokemon;
  final String texto;

  const _Overview({ 
    Key? key,
    required this.contextoPokemon,
    required this.texto,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    if (contextoPokemon.isEmpty){//segmento necesario cuando aun no hay imagenes hasta que se carguen
      return  Container(
        width: double.infinity,
        //height: 150,
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
   
    return Container(
      color: Colors.white,
      padding:const  EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child:  Center(
        child: Text(getTextoInSpanish(),
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
        ),
      )
      
    );
    
  }
  String getTextoInSpanish(){
     String textoSpanish='';
     for (int i=0; i<contextoPokemon.length; i++){
        if (contextoPokemon[i].language.name=='es')
        {
          textoSpanish=textoSpanish+contextoPokemon[i].flavorText;
          //break;//8 veces
        }
     }
     return textoSpanish;
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Pokemon pokemon;
  final List<FlavorTextEntry> pokemonContext;
  const _PosterAndTitle({
    Key? key,
    required this.pokemon,
    required this.pokemonContext
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme= Theme.of(context).textTheme;
    final size=MediaQuery.of(context).size;
    print(pokemon.entryNumber);

    if (pokemonContext.isEmpty){//segmento necesario cuando aun no hay imagenes hasta que se carguen
      return  Container(
        width: double.infinity,
        height: 150,
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } 
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding:const  EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:   FadeInImage(
                placeholder: const  AssetImage('assets/no-image.jpg'),
                image: AssetImage(pokemon.generacionDeRuta()),
                height: 150,
                width: 100,
            ),
          ),
          const SizedBox(width: 20,),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width-200),  
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pokemon.pokemonSpecies.name.toUpperCase(), style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text(pokemonContext[0].flavorText,
                      //style: textTheme.subtitle2,
                      overflow: TextOverflow.ellipsis, 
                      maxLines: 2,),
                Row(
                  children: [
                    const Icon(Icons.star_border_purple500, size: 15, color:  Colors.green,),
                    const SizedBox(width: 5,),
                    Text('rate', style: Theme.of(context).textTheme.caption,)
                  ],
                )            
              ],
            ),
          )
        ],
      ),
    );
    
  }
}

class _CustomAppbar extends StatelessWidget {
  final Pokemon pokemon;
  const _CustomAppbar(this.pokemon);//segunda forma para constructor
  //const _CustomAppbar({ Key? key, required this.pokemon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 400,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),//quitamos el pading q lleva por defecto
        title: Container(
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child:  Text(
            pokemon.pokemonSpecies.name,
            style: TextStyle(fontSize: 14),
          ),
        ),
        background:  FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'), 
          image: AssetImage(pokemon.generacionDeRuta()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}