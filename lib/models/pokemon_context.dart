// To parse this JSON data, do
//
//     final pokemonContext = pokemonContextFromMap(jsonString);

import 'dart:convert';

import 'package:pokedeks/models/models.dart';

class PokemonContext {
    PokemonContext({
        required this.baseHappiness,
        required this.captureRate,
        required this.color,
        required this.eggGroups,
        required this.evolutionChain,
        required this.evolvesFromSpecies,
        required this.flavorTextEntries,
        required this.formDescriptions,
        required this.formsSwitchable,
        required this.genderRate,
        required this.genera,
        required this.generation,
        required this.growthRate,
        required this.habitat,
        required this.hasGenderDifferences,
        required this.hatchCounter,
        required this.id,
        required this.isBaby,
        required this.isLegendary,
        required this.isMythical,
        required this.name,
        required this.names,
        required this.order,
        required this.palParkEncounters,
        required this.pokedexNumbers,
        required this.shape,
        required this.varieties,
    });

    int baseHappiness;
    int captureRate;
    Color color;
    List<Color> eggGroups;
    EvolutionChain evolutionChain;
    dynamic evolvesFromSpecies;
    List<FlavorTextEntry> flavorTextEntries;
    List<dynamic> formDescriptions;
    bool formsSwitchable;
    int genderRate;
    List<Genus> genera;
    Color generation;
    Color growthRate;
    Color habitat;
    bool hasGenderDifferences;
    int hatchCounter;
    int id;
    bool isBaby;
    bool isLegendary;
    bool isMythical;
    String name;
    List<Name> names;
    int order;
    List<PalParkEncounter> palParkEncounters;
    List<PokedexNumber> pokedexNumbers;
    Color shape;
    List<Variety> varieties;

    factory PokemonContext.fromJson(String str) => PokemonContext.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonContext.fromMap(Map<String, dynamic> json) => PokemonContext(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        color: Color.fromMap(json["color"]),
        eggGroups: List<Color>.from(json["egg_groups"].map((x) => Color.fromMap(x))),
        evolutionChain: EvolutionChain.fromMap(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"],
        flavorTextEntries: List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromMap(x))),
        formDescriptions: List<dynamic>.from(json["form_descriptions"].map((x) => x)),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: List<Genus>.from(json["genera"].map((x) => Genus.fromMap(x))),
        generation: Color.fromMap(json["generation"]),
        growthRate: Color.fromMap(json["growth_rate"]),
        habitat: Color.fromMap(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        order: json["order"],
        palParkEncounters: List<PalParkEncounter>.from(json["pal_park_encounters"].map((x) => PalParkEncounter.fromMap(x))),
        pokedexNumbers: List<PokedexNumber>.from(json["pokedex_numbers"].map((x) => PokedexNumber.fromMap(x))),
        shape: Color.fromMap(json["shape"]),
        varieties: List<Variety>.from(json["varieties"].map((x) => Variety.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "color": color.toMap(),
        "egg_groups": List<dynamic>.from(eggGroups.map((x) => x.toMap())),
        "evolution_chain": evolutionChain.toMap(),
        "evolves_from_species": evolvesFromSpecies,
        "flavor_text_entries": List<dynamic>.from(flavorTextEntries.map((x) => x.toMap())),
        "form_descriptions": List<dynamic>.from(formDescriptions.map((x) => x)),
        "forms_switchable": formsSwitchable,
        "gender_rate": genderRate,
        "genera": List<dynamic>.from(genera.map((x) => x.toMap())),
        "generation": generation.toMap(),
        "growth_rate": growthRate.toMap(),
        "habitat": habitat.toMap(),
        "has_gender_differences": hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toMap())),
        "order": order,
        "pal_park_encounters": List<dynamic>.from(palParkEncounters.map((x) => x.toMap())),
        "pokedex_numbers": List<dynamic>.from(pokedexNumbers.map((x) => x.toMap())),
        "shape": shape.toMap(),
        "varieties": List<dynamic>.from(varieties.map((x) => x.toMap())),
    };
}

class Color {
    Color({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Color.fromJson(String str) => Color.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Color.fromMap(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class EvolutionChain {
    EvolutionChain({
        required this.url,
    });

    String url;

    factory EvolutionChain.fromJson(String str) => EvolutionChain.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EvolutionChain.fromMap(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "url": url,
    };
}

class FlavorTextEntry {
    FlavorTextEntry({
        required this.flavorText,
        required this.language,
        required this.version,
    });

    String flavorText;
    Color language;
    Color version;

    factory FlavorTextEntry.fromJson(String str) => FlavorTextEntry.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FlavorTextEntry.fromMap(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Color.fromMap(json["language"]),
        version: Color.fromMap(json["version"]),
    );

    Map<String, dynamic> toMap() => {
        "flavor_text": flavorText,
        "language": language.toMap(),
        "version": version.toMap(),
    };
}

class Genus {
    Genus({
        required this.genus,
        required this.language,
    });

    String genus;
    Color language;

    factory Genus.fromJson(String str) => Genus.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Genus.fromMap(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: Color.fromMap(json["language"]),
    );

    Map<String, dynamic> toMap() => {
        "genus": genus,
        "language": language.toMap(),
    };
}


class PalParkEncounter {
    PalParkEncounter({
        required this.area,
        required this.baseScore,
        required this.rate,
    });

    Color area;
    int baseScore;
    int rate;

    factory PalParkEncounter.fromJson(String str) => PalParkEncounter.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PalParkEncounter.fromMap(Map<String, dynamic> json) => PalParkEncounter(
        area: Color.fromMap(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
    );

    Map<String, dynamic> toMap() => {
        "area": area.toMap(),
        "base_score": baseScore,
        "rate": rate,
    };
}

class PokedexNumber {
    PokedexNumber({
        required this.entryNumber,
        required this.pokedex,
    });

    int entryNumber;
    Color pokedex;

    factory PokedexNumber.fromJson(String str) => PokedexNumber.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokedexNumber.fromMap(Map<String, dynamic> json) => PokedexNumber(
        entryNumber: json["entry_number"],
        pokedex: Color.fromMap(json["pokedex"]),
    );

    Map<String, dynamic> toMap() => {
        "entry_number": entryNumber,
        "pokedex": pokedex.toMap(),
    };
}

class Variety {
    Variety({
        required this.isDefault,
        required this.pokemon,
    });

    bool isDefault;
    Color pokemon;

    factory Variety.fromJson(String str) => Variety.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Variety.fromMap(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: Color.fromMap(json["pokemon"]),
    );

    Map<String, dynamic> toMap() => {
        "is_default": isDefault,
        "pokemon": pokemon.toMap(),
    };
}
