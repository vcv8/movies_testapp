import 'package:flutter/material.dart';
import 'package:movies_testapp/models/models.dart';
import 'package:movies_testapp/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards(this.movieId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            color: Colors.red,
            height: 180,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final List<Cast> castList = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            itemCount: castList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _CastCard(castList[index]);
            },
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;

  const _CastCard(this.cast);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 110,
      height: 100,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(cast.fullPosterImg),
              width: 110,
              height: 140,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            cast.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
