import 'package:flutter/material.dart';
import 'package:movie__app/constants/api_const.dart';
import 'package:movie__app/models/movie_details.dart';
import 'package:movie__app/services/movie_item.dart';
class DetailMovie extends StatefulWidget {
  int? MovieId;
  DetailMovie({required this.MovieId});
  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  MovieDetailApi movieDetailApi = MovieDetailApi();
  MovieDetailsModel? movieDetailsModel;
  Future<void> loadData() async {
    movieDetailsModel =
        await movieDetailApi.getMovieDetail(MovieID: widget.MovieId);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: movieDetailsModel == null
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
              children: [
                Expanded(
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                  Container(
                    width: double.infinity,
                    child: Image.network(
                        "${ApiConst.imageurl}${movieDetailsModel?.posterPath}",
                        fit: BoxFit.fill),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            color: Colors.white38,
                            child: Text('${movieDetailsModel?.title}',
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textDirection: TextDirection.ltr),
                          ),
                        ),
                      ),
                    ],
                  ),
                ])),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                            'Release Date:${movieDetailsModel?.releaseDate}',
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 20),
                          ),
                          Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .01,
                          ),
                          Text(
                            '${movieDetailsModel?.voteAverage}',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '${movieDetailsModel?.overview}',
                        maxLines: 4,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ]),
                )),
              ],
            )),
    );
  }
}
