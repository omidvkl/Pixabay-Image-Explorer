// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PixabayService implements PixabayService {
  _PixabayService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://pixabay.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PixabayResponse<ImageHit>> searchImages(
    String apiKey,
    String query,
    String lang,
    String imageType,
    String orientation,
    String category,
    int minWidth,
    int minHeight,
    String colors,
    bool editorsChoice,
    bool safesearch,
    String order,
    int page,
    int perPage,
    String callback,
    bool pretty,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'q': query,
      r'lang': lang,
      r'image_type': imageType,
      r'orientation': orientation,
      r'category': category,
      r'min_width': minWidth,
      r'min_height': minHeight,
      r'colors': colors,
      r'editors_choice': editorsChoice,
      r'safesearch': safesearch,
      r'order': order,
      r'page': page,
      r'per_page': perPage,
      r'callback': callback,
      r'pretty': pretty,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PixabayResponse<ImageHit>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PixabayResponse<ImageHit>.fromJson(_result.data!, ImageHit.fromJson);

    return value;
  }

  @override
  Future<PixabayResponse<VideoHit>> searchVideos(
    String apiKey,
    String query,
    String lang,
    String videoType,
    String category,
    int minWidth,
    int minHeight,
    bool editorsChoice,
    bool safesearch,
    String order,
    int page,
    int perPage,
    String callback,
    bool pretty,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': apiKey,
      r'q': query,
      r'lang': lang,
      r'video_type': videoType,
      r'category': category,
      r'min_width': minWidth,
      r'min_height': minHeight,
      r'editors_choice': editorsChoice,
      r'safesearch': safesearch,
      r'order': order,
      r'page': page,
      r'per_page': perPage,
      r'callback': callback,
      r'pretty': pretty,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PixabayResponse<VideoHit>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/videos/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PixabayResponse<VideoHit>.fromJson(_result.data!, VideoHit.fromJson);

    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
