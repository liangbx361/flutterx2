/// 加载状态枚举
enum LoadStateEnum {
  /// 加载中
  loading,

  /// 加载成功
  success,

  /// 无数据
  noData,

  /// 加载失败
  error,

  /// 网络错误
  networkError,

  /// 未登录
  unlogin,
}

/// 加载状态数据模型
class LoadData<T> {
  /// 当前加载状态
  final LoadStateEnum state;

  /// 数据内容
  final T? data;

  /// 错误信息
  final String? errorMessage;

  /// 当前加载任务描述
  final String? currentTask;

  const LoadData({
    this.state = LoadStateEnum.loading,
    this.data,
    this.errorMessage,
    this.currentTask,
  });

  /// 复制并更新状态
  LoadData<T> copyWith({
    LoadStateEnum? state,
    T? data,
    String? errorMessage,
    String? currentTask,
  }) {
    return LoadData<T>(
      state: state ?? this.state,
      data: data ?? this.data,
      errorMessage: errorMessage,
      currentTask: currentTask ?? this.currentTask,
    );
  }

  /// 创建初始状态
  static LoadData<T> initial<T>() => LoadData<T>();

  /// 创建加载中状态
  static LoadData<T> loading<T>({String? currentTask}) {
    return LoadData<T>(
      state: LoadStateEnum.loading,
      currentTask: currentTask,
    );
  }

  /// 创建成功状态
  static LoadData<T> success<T>(T data) {
    return LoadData<T>(
      state: LoadStateEnum.success,
      data: data,
    );
  }

  /// 创建错误状态
  static LoadData<T> error<T>(String errorMessage) {
    return LoadData<T>(
      state: LoadStateEnum.error,
      errorMessage: errorMessage,
    );
  }

  /// 创建无数据状态
  static LoadData<T> noData<T>() {
    return LoadData<T>(
      state: LoadStateEnum.noData,
      currentTask: '暂无数据',
    );
  }

  /// 创建网络错误状态
  static LoadData<T> networkError<T>(String? errorMessage) {
    return LoadData<T>(
      state: LoadStateEnum.networkError,
      errorMessage: errorMessage ?? '网络连接失败',
    );
  }

  /// 创建未登录状态
  static LoadData<T> unlogin<T>() {
    return LoadData<T>(
      state: LoadStateEnum.unlogin,
      currentTask: '请先登录',
    );
  }

  /// 是否正在加载
  bool get isLoading => state == LoadStateEnum.loading;

  /// 是否加载成功
  bool get isSuccess => state == LoadStateEnum.success;

  /// 是否有错误
  bool get hasError => state == LoadStateEnum.error;

  /// 是否有数据
  bool get hasData => data != null;

  /// 是否无数据状态
  bool get isNoData => state == LoadStateEnum.noData;

  /// 是否网络错误
  bool get isNetworkError => state == LoadStateEnum.networkError;

  /// 是否未登录
  bool get isUnlogin => state == LoadStateEnum.unlogin;

  /// 是否需要显示内容
  bool get shouldShowContent => state == LoadStateEnum.success && hasData;

  @override
  String toString() {
    return 'LoadData{state: $state, currentTask: $currentTask, hasData: $hasData, errorMessage: $errorMessage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoadData &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          data == other.data &&
          errorMessage == other.errorMessage &&
          currentTask == other.currentTask;

  @override
  int get hashCode => state.hashCode ^ data.hashCode ^ errorMessage.hashCode ^ currentTask.hashCode;
}
