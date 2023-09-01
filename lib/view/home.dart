import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; //import libray

import 'package:mvvm_app/view_model/list_picture_viewmodel.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListPictureViewModel listPictureViewModel = new ListPictureViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("M  V V M A P P "),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: listPictureViewModel.fetchPictures(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: listPictureViewModel.picture?.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 192, 186, 186),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          "${listPictureViewModel.picture![index].picSumModel!.downloadUrl}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          }
        },
      ),
    );
  }
}
