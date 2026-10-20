class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final List<String> abilities;
  final List<String> heldItems;
  final List<String> moves;

  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.heldItems,
    required this.moves,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      baseExperience: json['base_experience'] ?? 0,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      abilities: (json['abilities'] as List<dynamic>? ?? [])
          .map((item) => item['ability']['name'].toString())
          .toList(),
      heldItems: (json['held_items'] as List<dynamic>? ?? [])
          .map((item) => item['item']['name'].toString())
          .toList(),
      moves: (json['moves'] as List<dynamic>? ?? [])
          .map((item) => item['move']['name'].toString())
          .toList(),
    );
  }

  String get spriteUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
}
