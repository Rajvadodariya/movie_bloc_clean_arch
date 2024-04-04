import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_bloc/features/home_screen/presantation/bloc/home_bloc.dart';

class TrendingMoviesCards extends StatelessWidget {
  const TrendingMoviesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<HomeBloc>()..add(FetchTredingMovies()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeFailure) {
            return Center(
                child: Text(
              state.massage,
              style: const TextStyle(color: Colors.white),
            ));
          }
          if (state is TrendigMovieLoaded) {
            return SizedBox(
              height: 315,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 180,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: SizedBox(
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MovieDetails(
                                    //             movieId: snapshot.data![index].id!,
                                    //             mediaType: snapshot
                                    //                 .data![index].mediaType!)));
                                  },
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500/${state.trandingMovies[index].posterPath}',
                                    fit: BoxFit.contain,
                                    width: 160,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 12,
                            child: Text('${index + 1}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 35, 44, 54),
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(
                                            1, 0.5), // Adjust offset as needed
                                        blurRadius:
                                            1.0, // Adjust blur radius as needed
                                        color: Color(0xff0296E5),
                                      ),
                                      Shadow(
                                        offset: Offset(-1.0,
                                            -1.0), // Adjust offset as needed
                                        blurRadius:
                                            1.0, // Adjust blur radius as needed
                                        color: Color(0xff0296E5),
                                      ),
                                    ])),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 12,
                      ),
                  itemCount: state.trandingMovies.length),
            );
          }
          return const Center(
            child: Text('Somethings Wrong'),
          );
        },
      ),
    );
  }
}
