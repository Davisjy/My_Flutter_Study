## 记录我的Flutter学习之路
### 背景
> 说起Flutter也是机缘巧合之下(公司安卓组的人走了又不招人)公司提供时间去学习，当时有两个选择，转安卓和flutter，鉴于一直听说Flutter跨平台的强大性能高等一系列吹捧，所以果断投入。

### 具体入手路线
> 先对照官网[中文文档](https://flutterchina.club)看一遍，装环境->hello world，从此就算是入门了。
> 
> 这个时候发现Dart是门新语言，但不要慌。据我了解，掌握JS/Java/Swift/Kotlin这些语言的开发者基本无压力入门，当然也有个别语法不一样，我也找到[真丶深红骑士](https://juejin.im/user/597247ad5188255aed1fbba6)的[Flutter学习之Dart语法特性](https://juejin.im/post/5c44727df265da611c274087)供大家快速掌握Dart语言。当然内容太多，可以在需要的时候查阅。
> 
> 你以为基础差不多了，就可以撸项目了吗，想太多了(手动黑线)，当我兴致勃勃的找开源项目撸一发的时候发现Bloc，Redux(感觉和Vuex差不多)等等新鲜字眼，懵逼了，紧接着开始学习一系列状态管理。

1. [Scoped Model](https://juejin.im/post/5b97fa0d5188255c5546dcf8)
2. [Redux](https://juejin.im/post/5ba26c086fb9a05ce57697da)
3. [BLoC](https://juejin.im/post/5bb6f344f265da0aa664d68a)
4. [RxDart](https://juejin.im/post/5bcea438e51d4536c65d2232)

> 这四篇博客看完了基本对状态管理就有了大概认识，好了，开始撸一发了，我选的开源项目是[flutter_wanandroid](https://github.com/Sky24n/flutter_wanandroid)。从中学到了代码规范，项目架构，包括熟悉一系列第三方插件，还是不错的，具体大家可自行尝试，引自原话__包括BLoC、RxDart 、国际化、主题色、启动页、引导页，拥有较好的项目结构&比较规范的代码__。


### 关于编辑器的选择
> 之前写过一段Vue所以不假思索的继续用VSCode，感觉真香，已经完全替代Sublime了，这个时候听到安卓的小伙伴说用Android Studio啊，官方推荐，我也不敢说，也不敢问啊，试了试。各有千秋吧，不多评价，习惯哪种就哪种吧，毕竟像我这种渣渣也不能说撸个编辑器。

### 小总结
> 项目不在多少，深入源码级别才是硬道理，从开源项目引申出一系列源码层面的分析探索，Widget, Element, RenderObjectWidget。
> 
> InheritedWidget为什么就能of出来就能数据共享等等。
> 
> 在此记录看过的博客或博主：

1. [Flutter key的描述](https://segmentfault.com/a/1190000011276853)，[Flutter | 深入浅出Key](https://juejin.im/post/5ca2152f6fb9a05e1a7a9a26)

2. [恋猫de小郭](https://juejin.im/user/582aca2ba22b9d006b59ae68/posts)大神一系列文章源码分析透彻都值得去学习
3. [Vadaski](https://juejin.im/user/5b5d45f4e51d453526175c06) 博主好像还在上学，真是汗颜。
4. [真丶深红骑士](https://juejin.im/user/597247ad5188255aed1fbba6/posts)带我入门的博客
5. [ad6623](https://juejin.im/user/569dca187db2a200521046a7/posts)分析的很透彻，膜拜

### 最后
> [GitHub](https://github.com/Davisjy/My_Flutter_Study/tree/master)上一个入门demo，一个仿写的开源项目，可自行查看。
> 
> 总结一个现象，为什么掘金上Flutter大佬大都是Android开发，特别是入门的时候有些博主都是类比安卓中某某，我一个iOS开发略显孤单。入门Flutter两个星期了，新鲜感十足，希望整个社区越来越好。最后感谢开源精神。
