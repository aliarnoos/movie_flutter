import 'package:flutter/material.dart';
import '../../data/models/movie.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(movie.imageUrl, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InfoSection(title: "Release Date", value: movie.releaseDate),
          InfoSection(title: "Overview", value: movie.overview ?? ''),
          InfoSection(title: "Budget", value: "\$${movie.budget.toString()}"),
          InfoSection(title: "Revenue", value: "\$${movie.revenue.toString()}"),
          InfoSection(
              title: "Spoken Languages",
              value: movie.spokenLanguages!.join(', ')),
        ],
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final String value;

  const InfoSection({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
