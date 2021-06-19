# SkyzcLibrary
一个基于SpringMVC+Maven+JdbcTemplate +Jetty + MySQL构建的图书管理系统

![功能描述图](./preview/Allbooks.png)


#### 项目简介
图书管理系统是一款基于Java SpringMVC框架的一个图书馆后台管理系统，实现了双端(用户端+管理端)的登录，借书，管理等功能，可以对整个图书馆的业务实现统一线上管理。后台数据库采用MySQL，前端使用了Bootstrap开发

env: 

```bash
JDK 1.8
MySQL 5.7 & 8.0
Maven 3.6.0
```

#### 如何部署

1. 将项目导入 IDE ，等待 Maven 依赖下载完成 
2. 打开 `book-context.xml` 修改数据库配置
3. 运行 浏览器进入：http://localhost:8080


##### 运行方案二 使用 Tomcat
```shell
在 IDEA 内配置 Tomcat 运行即可
```

##### 运行方案二 使用 Jetty ：
```shell
# 项目根目录执行下面代码

$ mvn clean compile

$ mvn clean package

$ mvn clean install

$ mvn jetty:run
```

####  业务功能描述图：

![功能描述图](./preview/业务功能概述.png)

#### 业务流程图：

![功能描述图](./preview/业务流程图.png)

#### 数据表说明&数据库设计图：
![功能描述图](./db/数据表说明.png)


![功能描述图](./db/数据库E-R.png)

显示功能

