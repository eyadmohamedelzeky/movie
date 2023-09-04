import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie__app/controller/movie_list.dart';
import 'package:movie__app/widgets/custom_contianar.dart';

class HomeScreen extends StatelessWidget {
  MovieList controller = Get.put(MovieList());

  @override
  Widget build(BuildContext context) {
    //controller.loadData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Movie'),
        centerTitle: true,
      ),
      body: GetBuilder<MovieList>(
        builder: (controller) => controller.moviesList == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : GetBuilder<MovieList>(
                init: MovieList(),
                builder: (controller) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: controller.moviesList!.length,
                    itemBuilder: (context, index) {
                      return CustomContainar(
                        movieDetailsModel: controller.moviesList![index],
                      );
                    },
                    shrinkWrap: true,
                  ),
                ),
              ),
      ),

      // moviesList == null
      //     ? Center(
      //         child: CircularProgressIndicator(
      //         color: Colors.red,
      //       ))
      //     : Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: ListView.builder(
      //           itemCount: moviesList!.length,
      //           itemBuilder: (context, index) {
      //             return CustomContainar(
      //               movieDetailsModel: moviesList![index],
      //             );
      //           },
      //           shrinkWrap: true,
      //         ),
      //       ),
    );
  }
}
