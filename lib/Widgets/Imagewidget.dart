import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/bloc/bloc/wallpaper_bloc.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/pages/ImagePage.dart';

class Imagewidget extends StatefulWidget {
  @override
  State<Imagewidget> createState() => _ImagewidgetState();
  String? link;
  Imagewidget({this.link});
}

class _ImagewidgetState extends State<Imagewidget> {
  late Wallpaer wallpaper;

  @override
  void initState() {
    // TODO: implement initState
    widget.link == null
        ? BlocProvider.of<WallpaperBloc>(context).add(TrandingWallaperEvent())
        : BlocProvider.of<WallpaperBloc>(context)
            .add(SearchWallpaperEvent('${widget.link}'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallpaperBloc, WallpaperState>(
      builder: (context, state) {
        if (state is WallpaperLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WallpaperLoaded) {
          wallpaper = state.wallpaper;
          return Padding(
            padding: EdgeInsets.all(6),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: wallpaper.totalResults,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    String link = '${wallpaper.photos![index].src!.portrait!}';
                    context.pushTransparentRoute(ImagePage(link));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: '$index',
                        child: Image.network(
                          wallpaper.photos![index].src!.portrait == null
                              ? "assets/images/noimage.png"
                              : wallpaper.photos![index].src!.portrait!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is WallpaperError) {
          var error = state.errormsg;
          Text(error);
        }
        return Container();
      },
    );
  }
}
