class VideoHit {
  final String id;
  final String pageURL;
  final String type;
  final String tags;
  final int duration;
  final String pictureId;
  final String videos;
  final int views;
  final int downloads;
  final int likes;
  final int comments;
  final String userId;
  final String user;
  final String userImageURL;

  VideoHit({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.duration,
    required this.pictureId,
    required this.videos,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });

  factory VideoHit.fromJson(Map<String, dynamic> json) {
    return VideoHit(
      id: json['id'].toString(),
      pageURL: json['pageURL'],
      type: json['type'],
      tags: json['tags'],
      duration: json['duration'],
      pictureId: json['picture_id'],
      videos: json['videos']['medium']['url'], // یا هر کیفیت دیگری که موجود است
      views: json['views'],
      downloads: json['downloads'],
      likes: json['likes'],
      comments: json['comments'],
      userId: json['user_id'].toString(),
      user: json['user'],
      userImageURL: json['userImageURL'],
    );
  }
}
