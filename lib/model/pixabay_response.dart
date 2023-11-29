class PixabayResponse<T> {
  final int total;
  final int totalHits;
  final List<T> hits;

  PixabayResponse({required this.total, required this.totalHits, required this.hits});

  factory PixabayResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    var list = json['hits'] as List;
    List<T> hitsList = list.map((i) => fromJsonT(i)).toList();

    return PixabayResponse(
      total: json['total'],
      totalHits: json['totalHits'],
      hits: hitsList,
    );
  }
}
