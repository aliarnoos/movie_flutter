import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '166fcac7b52dc2e16a40ebfb58bec49b';

  ApiService();

  // Fetch a list of trending movies
  Future<List<dynamic>> fetchTrendingMovies(int page) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/discover/movie?api_key=$apiKey&include_adult=false&page=$page&sort_by=popularity.desc&p'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load movies');
    }
  }

  // Fetch details of a specific movie by id
  Future<dynamic> fetchMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
