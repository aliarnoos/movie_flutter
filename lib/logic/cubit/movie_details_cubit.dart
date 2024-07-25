// movie_details_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/movie.dart';
import '../../data/repositories/movie_repository.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieRepository repository;

  MovieDetailsCubit(this.repository) : super(MovieDetailsInitial());

  void fetchMovieDetails(int movieId) {
    emit(MovieDetailsLoading());
    repository.getMovieDetails(movieId).then(
      (movie) {
        emit(MovieDetailsLoaded(movie));
      },
      onError: (error) {
        emit(MovieDetailsError(error.toString()));
      },
    );
  }
}
