import 'package:flutter/material.dart';
import 'package:movies_testapp/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas en carteleras'),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              // Bloque principal de tarjetas
              CardSwiper(),
              // Slider de películas
              MovieSlider(),
            ],
          ),
        ));
  }
}
