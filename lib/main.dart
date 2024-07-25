import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/movie_repository.dart';
import 'state/cubit/movie_cubit.dart';
import 'services/api_service.dart';
import 'ui/screens/movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<MovieRepository>(
      create: (context) => MovieRepositoryImpl(ApiService()),
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        home: BlocProvider<MovieCubit>(
          create: (context) => MovieCubit(context.read<MovieRepository>()),
          child: const MovieScreen(),
        ),
      ),
    );
  }
}
