import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/movie_repository.dart';
import '../../logic/cubit/movie_cubit.dart';
import '../widgets/movie_card.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieCubit(context.read<MovieRepository>())..loadMovies(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Trending Movies'),
        ),
        body: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MovieLoaded) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) =>
                    MovieCard(movie: state.movies[index]),
              );
            } else if (state is MovieError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('Press a button to load movies'));
            }
          },
        ),
      ),
    );
  }
}
