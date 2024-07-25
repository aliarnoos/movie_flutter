import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/movie_cubit.dart';
import '../widgets/movie_card.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _loadInitialMovies();
  }

  void _loadInitialMovies() {
    context.read<MovieCubit>().loadMovies(isInitialLoad: true);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<MovieCubit>().loadMovies();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.movies.length,
              itemBuilder: (context, index) =>
                  MovieCard(movie: state.movies[index]),
            );
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Press a button to load movies'));
        },
      ),
    );
  }
}
