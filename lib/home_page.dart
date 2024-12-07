import 'package:projetofilmes/detalhes_filmes_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> filmes = [];

  bool isloading = true;

  @override
  void initState() {
    super.initState();
    listafilmes();
  }

  Future<void> listafilmes() async {
    try {
      final Response = await http.get(Uri.parse(
          'https://gist.githubusercontent.com/saniyusuf/406b843afdfb9c6a86e25753fe2761f4/raw/523c324c7fcc36efab8224f9ebb7556c09b69a14/Film.JSON'));

      if (Response.statusCode == 200) {
        setState(() {
          filmes = json.decode(Response.body);
          isloading = false;
        });
      }
    } catch (e) {
      mostrarError('Error: $e');
    }
  }

  void mostrarError(String mensagem) {
    setState(() {
      isloading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(mensagem),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmes"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: const [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                    vertical: 28, horizontal: 16),
                child: Text("Olá, Sérgio",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              // trailing: Icon(Icons.login),
              title: Text("Login"),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Filmes"),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Dúvidas"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Sobre o projetofilmes"),
            ),
          ],
        ),
      ),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: filmes.length,
              itemBuilder: (context, index) {
                final filme = filmes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalhesFilmesPage(
                          filme: filme,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0.5,
                    margin: const EdgeInsets.all(8.0),
                    color: const Color(0xFFfcfcfc),
                    child: Row(
                      children: [
                        Image.network(
                          filme['Images'][0],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filme['Title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  filme['Plot'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
