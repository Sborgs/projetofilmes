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
  List<dynamic> servicos = [];

  bool isloading = true;

  @override
  void initState() {
    super.initState();
    listaServicos();
  }

  Future<void> listaServicos() async {
    try {
      final Response =
          await http.get(Uri.parse('http://10.56.45.22/public/api/servicos'));

      if (Response.statusCode == 200) {
        setState(() {
          servicos = json.decode(Response.body);
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
        title: const Text("projetofilmes"),
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
              title: Text("Serviços"),
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
              itemCount: servicos.length,
              itemBuilder: (context, index) {
                final servico = servicos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalhesFilmesPage(
                          servico: servico,
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
                          servico['fotos'][0]['imagem'],
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
                                  servico['titulo'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  servico['descricao'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'R\$ ${double.parse(servico['valor']).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
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
