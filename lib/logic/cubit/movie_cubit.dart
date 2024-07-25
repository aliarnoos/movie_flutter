import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/movie.dart';
import '../../data/repositories/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository repository;

  MovieCubit(this.repository) : super(MovieInitial());

  void loadMovies() {
    emit(MovieLoading());
    repository.getTrendingMovies().then(
      (movies) {
        emit(MovieLoaded(movies));
      },
      onError: (error) {
        emit(MovieError(error.toString()));
      },
    );
  }
}
