import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetalhesFilmesPage extends StatelessWidget {
  final Map<String, dynamic> filme;

  const DetalhesFilmesPage({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          filme['Title'],
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
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
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              filme['Plot'],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          Text(
            "Ano: ${filme['Year']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Lançado: ${filme['Released']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "duração: ${filme['Runtime']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Gênero: 14-${filme['Genre']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Escritor(a): ${filme['Writer']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Atores: ${filme['Actors']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Linguagem: ${filme['Language']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "País: ${filme['Country']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Prêmios: ${filme['Awards']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Pontuação: ${filme['Metascore']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Avaliação imdb: ${filme['imdbRating']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Votos imdb: ${filme['imdbVotes']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "ID imdb: ${filme['imdbID']}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
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
