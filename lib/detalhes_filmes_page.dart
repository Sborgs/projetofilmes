import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetalhesFilmesPage extends StatelessWidget {
  final Map<String, dynamic> filme;

  const DetalhesFilmesPage({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(filme['Title']),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.network(
            filme['Images'][0],
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            (filme['Title']),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(filme['Plot']),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          Text("Ano: ${filme['Year']}"),
          Text("Lançado: ${filme['Released']}"),
          Text("duração: ${filme['Runtime']}"),
          Text("Gênero: 14-${filme['Genre']}"),
          Text("Escritor(a): ${filme['Writer']}"),
          Text("Atores: ${filme['Actors']}"),
          Text("Linguagem: ${filme['Language']}"),
          Text("País: ${filme['Country']}"),
          Text("Prêmios: ${filme['Awards']}"),
          Text("Pontuação: ${filme['Metascore']}"),
          Text("Avaliação imdb: ${filme['imdbRating']}"),
          Text("Votos imdb: ${filme['imdbVotes']}"),
          Text("ID imdb: ${filme['imdbID']}"),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.squarePhone),
                    SizedBox(width: 8),
                    Text(
                      "Ligar",
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                    SizedBox(width: 8),
                    Text(
                      "WhatsApp",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
