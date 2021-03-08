import 'dart:convert';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

import 'album/album.dart';
import 'album/album_paging.dart';
import 'photo/photo_paging.dart';

class Facebook {
  static const String _FBApiEndpoint = 'https://graph.facebook.com/v10.0';
  Map<String, dynamic> _userData;
  AccessToken _accessToken;

  Future<void> login(isChecking, isNotChecking, isLoggedFB) async {
    try {
      isChecking();
      // by default the login method has the next permissions ['email','public_profile']
      _accessToken = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile', 'user_photos']);
      print(_accessToken.toJson());
      _userData =
          await FacebookAuth.instance.getUserData(fields: "name,photos");
      print(_userData);
      isLoggedFB(true);
    } on FacebookAuthException catch (e) {
      isLoggedFB(false);
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          print("You have a previous login operation in progress");
          break;
        case FacebookAuthErrorCode.CANCELLED:
          print("login cancelled");
          break;
        case FacebookAuthErrorCode.FAILED:
          print("login failed");
          break;
      }
    } catch (e, s) {
      // print in the logs the unknown errors
      print(e);
      print(s);
    } finally {
      isNotChecking();
    }
  }

  Future<void> logOut(isLoggedFB) async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    isLoggedFB(false);
  }

  Future<void> checkIfIsLogged(isNotChecking, isLoggedFB) async {
    _accessToken = await FacebookAuth.instance.isLogged;
    isNotChecking();
    if (_accessToken != null) {
      _userData =
          await FacebookAuth.instance.getUserData(fields: "name,photos");
      print(_userData);
      isLoggedFB(true);
    } else
      isLoggedFB(false);
  }

  Future<AlbumPaging> fetchAlbums([String nextUrl]) async {
    String url = /*nextUrl ??*/
        '$_FBApiEndpoint/${_userData['id']}/albums?fields=cover_photo{source},id,name,count&access_token=${_accessToken.token}';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> body = json.decode(response.body);

    if (response.statusCode != 200)
      print('Error fetch albums with user id: ${_userData['id']}\n'
          'Status code:${response.statusCode}');
    else
      print(body);

    return AlbumPaging.fromJson(body);
  }

  Future<PhotoPaging> fetchPhotosFromAlbum(Album album,
      [String nextUrl]) async {
    String url = nextUrl ??
        '$_FBApiEndpoint/${album.id}/photos?fields=id,name,width,height,photo,source&access_token=${_accessToken.token}';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> body = json.decode(response.body);

    if (response.statusCode != 200)
      print('Error fetch album with id: ${album.id}.\n'
          'Status code: ${response.statusCode}');

    print(body);
    return PhotoPaging.fromJson(body);
  }
}
