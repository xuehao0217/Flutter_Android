# flutter和android交互Demo

### 第一步：创建 Flutter Module

假设已经存在的 Android 项目路径为 /Users/nesger/Desktop/nesger_folder/project/studio/MyApp，那么我们在同级目录下面创建 Flutter Module。在终端执行如下命令：

cd /Users/nesger/Desktop/nesger_folder/project/studio/ 
flutter create -t module my_flutter
执行命令之后，就创建了一个带有 dart 代码的 Flutter Module，并且能够看到一个隐藏的文件夹 .android。

### 第二步：让主 APP 依赖 Flutter Module

这里，主 APP 指的就是 Android 项目 MyApp。

在 MyApp 的 settings.gradle 添加下面代码：
```java
setBinding(new Binding([gradle: this]))         
evaluate(new File(                                          
  settingsDir.parentFile,                                   
  'my_flutter/.android/include_flutter.groovy'    
))       
```
在需要使用 Flutter Module 的 MyApp 的对应 Module 添加依赖，比如本例子中就是到 MyApp 中的 app 的 build.gradle 添加
```java
compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
dependencies {
  implementation project(':flutter')
}
```
### 3：热重载和调试 dart 代码

首先定位到 Flutter Module 路径，这里为/Users/nesger/Desktop/nesger_folder/project/studio/my_flutter。接着执行命令flutter attach，会看到控制台输出

Waiting for a connection from Flutter on SM G9350…
