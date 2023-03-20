import 'package:flutter/material.dart';
import 'package:movies_testapp/providers/movies_provider.dart';
import 'package:movies_testapp/search/search_delegate.dart';
import 'package:movies_testapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas en carteleras'),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () => showSearch(
                context: context,
                delegate: MovieSearchDelegate(),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Bloque principal de tarjetas
              CardSwiper(
                movies: moviesProvider.nowPlayingMovies,
              ),
              // Slider de películas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: moviesProvider.getPopularMovies,
              ),
              const SizedBox(height: 8),
              // MovieSlider(
              //   movies: moviesProvider.popularMovies,
              //   title: 'Otras',
              //   onNextPage: moviesProvider.getPopularMovies,
              // ),
              const SizedBox(height: 8),
            ],
          ),
        ));
  }
}
