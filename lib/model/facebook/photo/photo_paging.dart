import '../pagination.dart';
import 'photo.dart';

class PhotoPaging {
  List<Photo> data;
  Pagination pagination;

  PhotoPaging.fromJson(Map json)
      : data = (json['data'] as List)
            .map((photo) => Photo.fromJson(photo))
            .toList(),
        pagination = Pagination.fromJson(json['paging']);
}
