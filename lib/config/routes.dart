import 'package:fluro/fluro.dart';

import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String favourite = "/favourite";
  static String profile = "/profile";

  static void configureRoutes(FluroRouter router) {
    router.define(root, handler: homeHandler);
    router.define(home, handler: homeHandler);
    router.define(favourite, handler: favouriteHandler);
    router.define(profile, handler: profileHandler);
  }
}
