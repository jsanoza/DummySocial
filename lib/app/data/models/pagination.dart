class Pagination<T extends HasToJson> {
  final List<T> data;
  final int total;
  final int page;
  final int limit;

  Pagination({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  Map<String, dynamic> toJson() => {
        'data': data.map((e) => e.toJson()).toList(),
        'total': total,
        'page': page,
        'limit': limit,
      };

  factory Pagination.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final data = (json['data'] as List<dynamic>).map((e) => fromJsonT(e)).toList();
    return Pagination<T>(
      data: data,
      total: json['total'] as int,
      page: json['page'] as int,
      limit: json['limit'] as int,
    );
  }
}

abstract class HasToJson {
  Map<String, dynamic> toJson();
}
