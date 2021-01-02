import 'package:fluro/fluro.dart';

import './route_handlers.dart';

const String kPlaceRoute = '/place/';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String favourite = "/favourite";
  static String profile = "/profile";
  static String place = "/place/:id";

  static void configureRoutes(FluroRouter router) {
    router.define(root, handler: homeHandler);
    router.define(home, handler: homeHandler);
    router.define(favourite, handler: favouriteHandler);
    router.define(profile, handler: profileHandler);
    router.define(place, handler: placeHandler);
  }
}
