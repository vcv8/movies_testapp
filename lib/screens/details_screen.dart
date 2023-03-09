import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Cambiar por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.brown,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.all(0),
              title: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                color: Colors.black26,
                child: Text(
                  'movie.title',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              background: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://via.placeholder.com/500x300'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
