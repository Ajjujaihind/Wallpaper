import 'package:wallpaper/api_helper.dart';
import 'package:wallpaper/model/wallpaper_model.dart';

class WallpaperRepository {
  Future<Wallpaer> getWallpaper(
    String mQuery,
  ) async {
    var mUrl = "search?query=$mQuery&per_page=45}";
    var data = await Apihelper().getApi(mUrl, header: {
      'Authorization':
          'bQ5T0u3fMl4xx3vj65Ql0YPNWlBWFyI9RT2RHS5CqybR0Qe7ZXxYsFCN'
    });

    return Wallpaer.fromJson(data);
  }

//tranding wallpaper
  Future<Wallpaer> gettrandingwallpaper() async {
    var mUrl = "curated?per_page=45";
    var data = await Apihelper().getApi(mUrl, header: {
      'Authorization':
          'bQ5T0u3fMl4xx3vj65Ql0YPNWlBWFyI9RT2RHS5CqybR0Qe7ZXxYsFCN'
    });
    return Wallpaer.fromJson(data);
  }
}
