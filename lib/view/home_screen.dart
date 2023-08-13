import 'package:flutter/material.dart';
import 'package:movie__app/models/movie_details.dart';
import 'package:movie__app/services/movie_list_api.dart';
import 'package:movie__app/widgets/custom_contianar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieDetailsModel>? moviesList;
  MovieListApi apiService = MovieListApi();
  Future<void> loadData() async {
    moviesList = await apiService.getmovieslist();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 20,
          title: Text(
            'Movie',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: moviesList == null
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              ))
            : ListView.builder(
                itemCount: moviesList!.length,
                itemBuilder: (context, index) {
                  return CustomContainar(
                    movieDetailsModel: moviesList![index],
                  );
                },
                shrinkWrap: true,
              ));
  }
}
