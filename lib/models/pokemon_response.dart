import 'dart:convert';

import 'package:pokedeks/models/models.dart';

class PokemonResponse {
    PokemonResponse({
        required this.descriptions,
        required this.id,
        required this.name,
        required this.names,
        required this.pokemons,
        required this.region,
        required this.versionGroups,
    });

    List<Description> descriptions;
    int id;
    String name;
    List<Name> names;
    List<Pokemon> pokemons;
    Region region;
    List<Region> versionGroups;

    factory PokemonResponse.fromJson(String str) => PokemonResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonResponse.fromMap(Map<String, dynamic> json) => PokemonResponse(
        descriptions: List<Description>.from(json["descriptions"].map((x) => Description.fromMap(x))),
        id: json["id"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        pokemons: List<Pokemon>.from(json["pokemon_entries"].map((x) => Pokemon.fromMap(x))),
        region: Region.fromMap(json["region"]),
        versionGroups: List<Region>.from(json["version_groups"].map((x) => Region.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "descriptions": List<dynamic>.from(descriptions.map((x) => x.toMap())),
        "id": id,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toMap())),
        "pokemon_entries": List<dynamic>.from(pokemons.map((x) => x.toMap())),
        "region": region.toMap(),
        "version_groups": List<dynamic>.from(versionGroups.map((x) => x.toMap())),
    };
}

class Description {
    Description({
        required this.description,
        required this.language,
    });

    String description;
    Region language;

    factory Description.fromJson(String str) => Description.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Description.fromMap(Map<String, dynamic> json) => Description(
        description: json["description"],
        language: Region.fromMap(json["language"]),
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "language": language.toMap(),
    };
}

class Region {
    Region({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Region.fromJson(String str) => Region.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Region.fromMap(Map<String, dynamic> json) => Region(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class Name {
    Name({
        required this.language,
        required this.name,
    });

    Region language;
    String name;

    factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Name.fromMap(Map<String, dynamic> json) => Name(
        language: Region.fromMap(json["language"]),
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "language": language.toMap(),
        "name": name,
    };
}


