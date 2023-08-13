import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie__app/constants/api_const.dart';
import 'package:movie__app/models/movie_details.dart';
import 'package:movie__app/services/movie_item.dart';
import 'package:movie__app/widgets/custom_text.dart';
import 'package:uni_links/uni_links.dart';

class DetailMovie extends StatefulWidget {
  int? MovieId;
  DetailMovie({required this.MovieId});
  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  StreamSubscription? _sub;

  Future<void> initUniLinks() async {
    // ... check initialLink

    // Attach a listener to the stream
    _sub = linkStream.listen((String? link) {
      if (link != null) {
        var uri = Uri.parse(link);
        if (uri.queryParameters['id'] != null) {
          print(uri.queryParameters['id'].toString());
        }
      }
      // Parse the link and warn the user, if it is not correct
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

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
    initUniLinks();
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
                              child: CustomText(
                                text: '${movieDetailsModel?.title}',
                                fontSize: 20,
                                maxline: 3,
                                fontWeight: FontWeight.bold,
                                textColor: Colors.black,
                                textDirection: TextDirection.ltr,
                              )),
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
                          CustomText(
                            text:
                                'Release Date:${movieDetailsModel?.releaseDate}',
                            fontSize: 20,
                            textColor: Colors.amberAccent,
                          ),
                          Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .01,
                          ),
                          CustomText(
                            text: '${movieDetailsModel?.voteAverage}',
                            fontSize: 20,
                            textColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomText(
                          text: '${movieDetailsModel?.overview}',
                          fontSize: 20,
                          maxline: 4,
                        )),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(Icons.share),
                          ),
                        ],
                      ),
                    )
                  ]),
                )),
              ],
            )),
    );
  }
}
