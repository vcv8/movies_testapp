import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_testapp/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '8bbb8b798ef08014fd3e859c380abd93';
  final String _language = 'es-ES';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int popularPage = 0;

  MoviesProvider() {
    // print('movies provider inicializado');
    getNowPlayingMovies();
    getPopularMovies();
  }

  _getDataHttp(segment, [page = 1]) async {
    var url = Uri.https(
      _baseUrl,
      segment,
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '$page',
      },
    );

    return http.get(url);
  }

  getNowPlayingMovies() async {
    final response = await _getDataHttp('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    nowPlayingMovies = nowPlayingResponse.results;

    // Notificar de cambios a los widgets escuchando provider
    notifyListeners();
  }

  getPopularMovies() async {
    popularPage++;

    final response = await _getDataHttp('3/movie/popular', popularPage);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];

    // Notificar de cambios a los widgets escuchando provider
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (!moviesCast.containsKey(movieId)) {
      final response = await _getDataHttp('3/movie/$movieId/credits');
      final creditsResponse = CreditsResponse.fromJson(response.body);

      moviesCast[movieId] = creditsResponse.cast;
    }
    return moviesCast[movieId]!;
  }
}
