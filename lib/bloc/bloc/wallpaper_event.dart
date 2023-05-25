part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class TrandingWallaperEvent extends WallpaperEvent {
  TrandingWallaperEvent();
}

class SearchWallpaperEvent extends WallpaperEvent {
  String mqueary;

  SearchWallpaperEvent(
    this.mqueary,
  );
}
