import '../../services/api_service.dart';
import '../models/movie.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getTrendingMovies();
}

class MovieRepositoryImpl implements MovieRepository {
  final ApiService apiService;

  MovieRepositoryImpl(this.apiService);

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    try {
      final jsonData = await apiService.fetchTrendingMovies();
      return jsonData
          .map<MovieModel>((json) => MovieModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch movies: ${e.toString()}');
    }
  }
}
