import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/movie_repository.dart';
import 'logic/cubit/movie_cubit.dart';
import 'services/api_service.dart';
import 'ui/screens/movie_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => MovieCubit(MovieRepositoryImpl(ApiService())),
        child: MovieScreen(),
      ),
    );
  }
}
