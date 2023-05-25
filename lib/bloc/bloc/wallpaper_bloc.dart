import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/wallpaper_repository.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperBloc() : super(WallpaperInitial()) {
    on<TrandingWallaperEvent>((event, emit) async {
      emit(WallpaperLoading());
      Wallpaer getwallpaer = await WallpaperRepository().gettrandingwallpaper();
      emit(WallpaperLoaded(getwallpaer));
    });
    on<SearchWallpaperEvent>((event, emit) async {
      emit(WallpaperLoading());
      Wallpaer getwallpaper = await WallpaperRepository().getWallpaper(
        event.mqueary,
      );
      emit(WallpaperLoaded(getwallpaper));
    });
  }
}
