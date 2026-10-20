import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const PokemonScreen(),
    );
  }
}

// ==========================================
// POKEMON DATA MODEL
// ==========================================
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
      abilities: (json['abilities'] as List?)
              ?.map((item) => item['ability']['name'].toString())
              .toList() ??
          [],
      heldItems: (json['held_items'] as List?) == null ||
              (json['held_items'] as List).isEmpty
          ? ['None']
          : (json['held_items'] as List)
              .map((item) => item['item']['name'].toString())
              .toList(),
      moves: (json['moves'] as List?)
              ?.map((item) => item['move']['name'].toString())
              .toList() ??
          [],
    );
  }
}

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  Pokemon? pokemon;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchPokemonData();
  }

  Future<void> fetchPokemonData() async {
    try {
      final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/504'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        setState(() {
          pokemon = Pokemon.fromJson(jsonData);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load Pokemon data.';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Profile'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Sprite / Image
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon!.id}.png',
                          height: 250,
                          width: 250,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 100),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Name & ID
                      Text(
                        '${pokemon!.name.toUpperCase()} (#${pokemon!.id})',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Basic Stats Card
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatItem(
                                  'Base Exp', '${pokemon!.baseExperience}'),
                              _buildStatItem('Height', '${pokemon!.height}'),
                              _buildStatItem('Weight', '${pokemon!.weight}'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Abilities List
                      _buildSectionTitle('Abilities'),
                      _buildListCard(pokemon!.abilities),
                      const SizedBox(height: 16),

                      // Held Items List
                      _buildSectionTitle('Held Items'),
                      _buildListCard(pokemon!.heldItems),
                      const SizedBox(height: 16),

                      // Moves List
                      _buildSectionTitle('Moves'),
                      _buildListCard(pokemon!.moves),
                    ],
                  ),
                ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildListCard(List<String> items) {
    return Card(
      elevation: 2,
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              dense: true,
              title: Text(items[index]),
              leading: const Icon(Icons.arrow_right, size: 20),
            );
          },
        ),
      ),
    );
  }
}
