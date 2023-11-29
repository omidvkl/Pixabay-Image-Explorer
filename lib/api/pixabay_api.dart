
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/image_model.dart';
import '../model/pixabay_response.dart';
import '../model/video_model.dart';

part 'pixabay_api.g.dart';

@RestApi(baseUrl: "https://pixabay.com/api/")
abstract class PixabayService {
  factory PixabayService(Dio dio, {String baseUrl}) = _PixabayService;

  @GET("/")
  Future<PixabayResponse<ImageHit>> searchImages(
      @Query("key") String apiKey,
      @Query("q") String query,
      @Query("lang") String lang,
      @Query("image_type") String imageType,
      @Query("orientation") String orientation,
      @Query("category") String category,
      @Query("min_width") int minWidth,
      @Query("min_height") int minHeight,
      @Query("colors") String colors,
      @Query("editors_choice") bool editorsChoice,
      @Query("safesearch") bool safesearch,
      @Query("order") String order,
      @Query("page") int page,
      @Query("per_page") int perPage,
      @Query("callback") String callback,
      @Query("pretty") bool pretty,
      );

  @GET("/videos/")
  Future<PixabayResponse<VideoHit>> searchVideos(
      @Query("key") String apiKey,
      @Query("q") String query,
      @Query("lang") String lang,
      @Query("video_type") String videoType,
      @Query("category") String category,
      @Query("min_width") int minWidth,
      @Query("min_height") int minHeight,
      @Query("editors_choice") bool editorsChoice,
      @Query("safesearch") bool safesearch,
      @Query("order") String order,
      @Query("page") int page,
      @Query("per_page") int perPage,
      @Query("callback") String callback,
      @Query("pretty") bool pretty,
      );
}
