import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokego/app.dart';
import 'package:pokego/core/network.dart';
import 'package:pokego/data/repositories/item_repository.dart';
import 'package:pokego/data/repositories/pokemon_repository.dart';
import 'package:pokego/data/source/github/github_datasource.dart';
import 'package:pokego/data/source/local/local_datasource.dart';
import 'package:pokego/states/theme/theme_cubit.dart';
import 'package:pokego/states/item/item_bloc.dart';
import 'package:pokego/states/pokemon/pokemon_bloc.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDataSource.initialize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiRepositoryProvider(
      providers: [
        
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),

        
        RepositoryProvider<LocalDataSource>(
          create: (context) => LocalDataSource(),
        ),
        RepositoryProvider<GithubDataSource>(
          create: (context) => GithubDataSource(context.read<NetworkManager>()),
        ),

        RepositoryProvider<PokemonRepository>(
          create: (context) => PokemonDefaultRepository(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<GithubDataSource>(),
          ),
        ),

        RepositoryProvider<ItemRepository>(
          create: (context) => ItemDefaultRepository(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<GithubDataSource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonBloc>(
            create: (context) => PokemonBloc(context.read<PokemonRepository>()),
          ),
          BlocProvider<ItemBloc>(
            create: (context) => ItemBloc(context.read<ItemRepository>()),
          ),

          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          )
        ],
        child: PokedexApp(),
      ),
    ),
  );
}
