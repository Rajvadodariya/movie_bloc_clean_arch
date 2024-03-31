import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/home_bloc.dart';
import '../widgets/trending_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchTredingMovies());
  }

  @override
  Widget build(BuildContext context) {
    String _selectedLabel = 'Now Playing';
    return Scaffold(
      backgroundColor: const Color(0xff242A32),
      appBar: AppBar(
        backgroundColor: const Color(0xff242A32),
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text('What do you want to watch?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 0.5)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 8, top: 20),
        child: Column(
          children: [
            //SearchBar
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff3A3F47),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, left: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                onSubmitted: (value) {},
                                decoration: const InputDecoration(
                                    hintText: 'Search...',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Color(0xff67686D),
                                        fontSize: 18)),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    'assets/svgs/search.svg',
                                    height: 22)),
                          ]),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 35,
                    ))
              ],
            ),
            //Trending Movies
            // TrandingMoviesWidget(moviesFuture: movieFuture),
            const TrendingMoviesCards(),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: _selectedLabel == 'Now Playing'
                            ? const BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 3)))
                            : null,
                        height: 40,
                        child: const Text(
                          'Now Playing',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: _selectedLabel == 'Popular'
                            ? const BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 3)))
                            : null,
                        height: 40,
                        child: const Text(
                          'Popular',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: _selectedLabel == 'Top Rated'
                            ? const BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 3)))
                            : null,
                        height: 40,
                        child: const Text(
                          'Top Rated',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: _selectedLabel == 'Upcoming'
                            ? const BoxDecoration(
                                border: BorderDirectional(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 3)))
                            : null,
                        height: 40,
                        child: const Text(
                          'Upcoming',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // movieList(selectedFuture, _selectedLabel)
          ],
        ),
      ),
    );
  }
}
