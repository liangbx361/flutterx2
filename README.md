# FlutterX V2版本

基于当前对Flutter开发的理解，整理新的APP开发脚手架，命名为FlutterX V2版本。

## 特性

* 页面脚手架
* 路由管理
* 主题管理
* 国际化支持
* RTL支持
* 响应式布局
* 数据管理
* 同时支持移动端和PC端

## 架构组件选型

* Riverpod 3.x 作为状态管理
* Dio + Retrofit 作为网络请求库
* go_router 作为路由管理
* hive 作为本地存储
* event_bus 作为事件总线
* custom_refresh_indicator 作为下拉刷新组件
* logger 作为日志打印
* flutter_svg 作为SVG图标支持
* cached_network_image 作为网络图片缓存
* lottie 作为动画支持