// class PixabayResponse {
//   final int total;
//   final int totalHits;
//   final List<ImageHit> hits;
//
//   PixabayResponse({required this.total, required this.totalHits, required this.hits});
//
//   factory PixabayResponse.fromJson(Map<String, dynamic> json) {
//     var list = json['hits'] as List;
//     List<ImageHit> imagesList = list.map((i) => ImageHit.fromJson(i)).toList();
//
//     return PixabayResponse(
//       total: json['total'],
//       totalHits: json['totalHits'],
//       hits: imagesList,
//     );
//   }
// }

class ImageHit {
  final int? id;
  final String? pageURL;
  final String? type;
  final String? tags;
  final String previewURL;
  final int previewWidth;
  final int previewHeight;
  final String webformatURL;
  final int webformatWidth;
  final int webformatHeight;
  final String? largeImageURL;
  final String? fullHDURL;
  final String? imageURL;
  final int imageWidth;
  final int imageHeight;
  final int? imageSize;
  final int? views;
  final int downloads;
  final int? likes;
  final int? comments;
  final int? userId;
  final String? user;
  final String? userImageURL;

  ImageHit({
     this.id,
    this.pageURL,
    this.type,
    this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    this.largeImageURL,
    this.fullHDURL,
    this.imageURL,
    required this.imageWidth,
    required this.imageHeight,
    this.imageSize,
    this.views,
    required this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageURL,
  });

  factory ImageHit.fromJson(Map<String, dynamic> json) {
    return ImageHit(
      id: json['id'],
      pageURL: json['pageURL'],
      type: json['type'],
      tags: json['tags'],
      previewURL: json['previewURL'],
      previewWidth: json['previewWidth'],
      previewHeight: json['previewHeight'],
      webformatURL: json['webformatURL'],
      webformatWidth: json['webformatWidth'],
      webformatHeight: json['webformatHeight'],
      largeImageURL: json['largeImageURL'],
      fullHDURL: json['fullHDURL'],
      imageURL: json['imageURL'],
      imageWidth: json['imageWidth'],
      imageHeight: json['imageHeight'],
      imageSize: json['imageSize'],
      views: json['views'],
      downloads: json['downloads'],
      likes: json['likes'],
      comments: json['comments'],
      userId: json['user_id'],
      user: json['user'],
      userImageURL: json['userImageURL'],
    );
  }
}















// class PixabayImage {
//   final int id;
//   final String pageURL;
//   final String type;
//   final String tags;
//   final String previewURL;
//   final int previewWidth;
//   final int previewHeight;
//  //final int largeImageURL;
//   // ... سایر ویژگی‌ها
//
//   PixabayImage({
//     required this.id,
//     required this.pageURL,
//     required this.type,
//     required this.tags,
//     required this.previewURL,
//     required this.previewWidth,
//     required this.previewHeight,
//     //required this.largeImageURL,
//     // ... سایر ویژگی‌ها
//   });
//
//   factory PixabayImage.fromJson(Map<String, dynamic> json) {
//     return PixabayImage(
//       id: json['id'],
//       pageURL: json['pageURL'],
//       type: json['type'],
//       tags: json['tags'],
//       previewURL: json['previewURL'],
//       previewWidth: json['previewWidth'],
//       previewHeight: json['previewHeight'],
//       //largeImageURL: json['largeImageURL'],
//       // ... سایر ویژگی‌ها
//     );
//   }
// }
