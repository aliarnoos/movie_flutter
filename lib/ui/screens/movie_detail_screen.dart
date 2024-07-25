import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/movie_repository.dart';
import '../../logic/cubit/movie_details_cubit.dart';
import '../widgets/movie_details.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsCubit(context.read<MovieRepository>())
        ..fetchMovieDetails(movieId),
      child: Scaffold(
        appBar: AppBar(title: const Text('Movie Details')),
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const CircularProgressIndicator();
            } else if (state is MovieDetailsLoaded) {
              return MovieDetails(movie: state.movie);
            } else if (state is MovieDetailsError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Loading...'));
          },
        ),
      ),
    );
  }
}
