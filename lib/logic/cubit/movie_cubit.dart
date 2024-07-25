import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/movie.dart';
import '../../data/repositories/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository repository;
  int currentPage = 1;

  MovieCubit(this.repository) : super(MovieInitial());

  void loadMovies({bool isInitialLoad = false}) {
    if (isInitialLoad) {
      currentPage = 1;
      emit(MovieLoading());
    } else {
      currentPage++;
    }

    repository.getTrendingMovies(page: currentPage).then(
      (movies) {
        if (isInitialLoad || currentPage == 1) {
          emit(MovieLoaded(movies));
        } else {
          final currentState = state;
          if (currentState is MovieLoaded) {
            emit(MovieLoaded([
              ...currentState.movies,
              ...movies
            ])); // Append new movies to the current list
          }
        }
      },
      onError: (error) {
        emit(MovieError(error.toString()));
      },
    );
  }
}
