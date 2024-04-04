import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_bloc/core/widgets/loader.dart';
import '../bloc/home_bloc.dart';

class MovieListCards extends StatelessWidget {
  final HomeEvent event;
  const MovieListCards({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<HomeBloc>()..add(FetchTopRatedMovies()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Loader();
          }
          if (state is TopRatedMovieLoaded) {
            return Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(left: 0, top: 12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
                itemCount: state.topRatedMovies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${state.topRatedMovies[index].posterPath}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          if (state is HomeFailure) {
            return Center(
                child: Text(
              state.massage,
              style: const TextStyle(color: Colors.white),
            ));
          }
          return const Center(
            child: Text('Somethings Wrong'),
          );
        },
      ),
    );
  }
}
