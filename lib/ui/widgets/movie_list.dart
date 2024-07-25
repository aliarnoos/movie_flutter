// import 'package:flutter/material.dart';

// import 'movie_card.dart';

// class MovieList extends StatelessWidget {
//   final List<dynamic> movies;

//   const MovieList({
//     super.key,
//     required this.movies,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: movies.length,
//       itemBuilder: (context, index) {
//         final movie = movies[index];
//         return MovieCard(
//           title: movie['title'],
//           releaseDate:
//               movie['release_date'], // Adjust according to your API response
//           imageUrl:
//               movie['poster_path'], // Adjust according to your API response
//         );
//       },
//     );
//   }
// }
