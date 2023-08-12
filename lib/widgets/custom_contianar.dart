import 'package:flutter/material.dart';
import 'package:movie__app/constants/api_const.dart';
import 'package:movie__app/detail_movie.dart';
import 'package:movie__app/models/movie_details.dart';
class CustomContainar extends StatelessWidget {
  MovieDetailsModel movieDetailsModel;

  CustomContainar({required this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailMovie(
              MovieId: movieDetailsModel.id,
            );
          }));
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .28,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                child: Image.network(
                  '${ApiConst.imageurl}${movieDetailsModel.posterPath}',
                  width: 120,
                  height: MediaQuery.of(context).size.height * .35,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Text(
                        '${movieDetailsModel.title}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${movieDetailsModel.voteAverage}',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .1,
                        width: MediaQuery.of(context).size.width * .7,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            '${movieDetailsModel.overview}',
                            style: TextStyle(fontSize: 18),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}