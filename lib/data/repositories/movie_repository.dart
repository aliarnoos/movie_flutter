import '../../services/api_service.dart';
import '../models/movie_card.dart';

abstract class MovieRepository {
  Future<List<MovieCardModel>> getTrendingMovies();
}

class MovieRepositoryImpl implements MovieRepository {
  final ApiService apiService;

  MovieRepositoryImpl(this.apiService);

  @override
  Future<List<MovieCardModel>> getTrendingMovies() async {
    try {
      final jsonData = await apiService.fetchTrendingMovies();
      return jsonData
          .toList()
          .map<MovieCardModel>((json) => MovieCardModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch movies: ${e.toString()}');
    }
  }
}
