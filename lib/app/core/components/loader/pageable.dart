/// 分页数据接口
abstract class Pageable<T> {
  /// 数据列表
  List<T> get items;

  /// 下一页标识
  String? get nextPageToken;

  /// 是否还有更多数据
  bool get hasMore => nextPageToken != null;

  /// 是否为空
  bool get isEmpty => items.isEmpty;

  /// 数据数量
  int get length => items.length;
}

/// 默认分页数据实现
class DefaultPageable<T> implements Pageable<T> {
  @override
  final List<T> items;

  @override
  final String? nextPageToken;

  final int totalCount;
  final int pageSize;
  final int currentPage;

  const DefaultPageable({
    required this.items,
    this.nextPageToken,
    this.totalCount = 0,
    this.pageSize = 20,
    this.currentPage = 1,
  });

  @override
  bool get hasMore => nextPageToken != null;

  @override
  bool get isEmpty => items.isEmpty;

  @override
  int get length => items.length;

  DefaultPageable<T> copyWith({
    List<T>? items,
    String? nextPageToken,
    int? totalCount,
    int? pageSize,
    int? currentPage,
  }) {
    return DefaultPageable<T>(
      items: items ?? this.items,
      nextPageToken: nextPageToken,
      totalCount: totalCount ?? this.totalCount,
      pageSize: pageSize ?? this.pageSize,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  /// 添加更多数据
  DefaultPageable<T> addAll(List<T> moreItems, {String? nextToken}) {
    return copyWith(
      items: [...items, ...moreItems],
      nextPageToken: nextToken,
    );
  }
}
