import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy list of movies for demonstration
  final List<Map<String, dynamic>> _movies = [
    {"title": "Movie 1", "year": 2022},
    {"title": "Movie 2", "year": 2021},
    {"title": "Movie 3", "year": 2020},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Movies'),
      ),
      body: ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_movies[index]['title']),
            subtitle: Text('Year: ${_movies[index]['year']}'),
            onTap: () {
              // Handle movie item tap
              // Navigate to movie details screen
              print('Tapped on ${_movies[index]['title']}');
            },
          );
        },
      ),
    );
  }
}
