# 架构设计

## 概述

在这个设计文档中，我们将讨论Flutter项目的设计和架构。

## 目录

1. [命名规范](#命名规范)
2. [工程结构](#工程结构)
3. [系统架构](#系统架构)
4. [单元测试]
5. [集成测试]

## 1. 命名规范
参考Flutter SDK内部的命名规范，主要的命名规则如下：

* 目录命名有复数形式，应优先使用复数形式，例如：`modules`、`routes`、`services`。

* 文件命名应采用小写字母和下划线的组合，例如：`xxx_xxx.dart`。

* 类命名应采用大驼峰命名法，例如：`XxxXxx`。

## 2. 工程结构
遵循[GetX设计模式](https://github.com/kauemurakami/getx_pattern)

* app
    * data 业务数据层
        * enums 负责定义业务枚举类型
            * xxx_enum.dart
        * models 负责定义业务模型
            * local 负责定义本地模型
                * xxx_lm.dart
            * remote 负责定义远程模型
                * xxx_rm.dart
            * view 负责定义视图模型
                * xxx_vm.dart
        * repos 封装业务数据的处理逻辑
            * xxx_repo.dart
        * sources 负责定义数据源
            * local 负责定义本地数据源
                * local_source.dart
            * remote 负责定义远程数据源
                * remote_source.dart
                * xxx_api.dart
                * api_path.dart 负责定义API资源路径
        * errors 负责定义业务数据层的错误类型
            * xxx_error.dart
    * modules 业务模块层 （需要遵循高内聚低耦合原则）
        * xxx
            * xxx_page.dart
            * xxx_controller.dart
            * xxx_component.dart
    * components 负责定义可复用的组件
        * xxx_view.dart
        * xxx_dialog.dart
    * routes 负责定义页面路由及中间件
        * app_routes.dart
        * app_middlewares.dart
    * core 核心基础层（可根据需要扩展，该模块可以跨APP复用）
        * arch 负责定义架构
        * logger 负责定义日志
        * utils 负责定义工具类
    * values 资源层
        * configs.dart
        * colors.dart
        * images.dart
        * themes.dart