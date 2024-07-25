part of 'movie_cubit.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieCardModel> movies;
  MovieLoaded(this.movies);
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}
