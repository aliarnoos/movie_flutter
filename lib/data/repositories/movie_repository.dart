import 'package:movie_flutter/data/models/movie.dart';

import '../../services/api_service.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getTrendingMovies();
  Future<MovieModel> getMovieDetails(int movieId);
}

class MovieRepositoryImpl implements MovieRepository {
  final ApiService apiService;

  MovieRepositoryImpl(this.apiService);

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    try {
      final jsonData = await apiService.fetchTrendingMovies();
      return jsonData
          .toList()
          .map<MovieModel>((json) => MovieModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch movies: ${e.toString()}');
    }
  }

  @override
  Future<MovieModel> getMovieDetails(int movieId) async {
    try {
      final jsonData = await apiService.fetchMovieDetails(movieId);
      return MovieModel.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to fetch movie details: ${e.toString()}');
    }
  }
}
