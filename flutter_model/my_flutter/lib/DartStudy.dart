main() {
  var number = 42; // 声明并初始化一个变量。
  var name = 'Bob';
  dynamic age = 'Bob'; // 动态类型，
  String name1 = 'Bob';
  print('The number is $number.'); // 打印到控制台。
//  创建和设置一个 Final 变量  final 不能被修改:
  final name2 = 'Bob';
  final String nickname = 'Bobby';



//常量
  const bar = 1000000;



//  Dart 语言的 Number 有两种类型:  int  和   double
  var x = 0;
  var y = 1.1;



//  Dart 使用 bool 类型表示布尔值。
  var fullName = '';
  if (fullName.isEmpty) {}



  //List  具有类型推断
  var list = [1, 2, 3]; //创建list
  print('${list[0]} '); //拿到list中角标为0 的
  //list 循环
  list.forEach((f) {
    print('${list.indexOf(f)}: $f');
  });
  //函数只有一条语句， 可以使用箭头简写
  list.forEach((item) => print('${list.indexOf(item)}: $item'));


  // Dart 中 Set 是一个元素唯一且无需的集合
  var halogens = {'1', '2', '3', '4', '5'};
  //要创建一个空集，使用前面带有类型参数的 {} ，或者将 {} 赋值给 Set 类型的变量：
  var names = <String>{};
  Set<String> names1 = {}; // 这样也是可以的。


  // var names = {}; // 这样会创建一个 Map ，而不是 Set 。
  // Map 字面量语法同 Set 字面量语法非常相似。 因为先有的 Map 字母量语法，所以 {} 默认是 Map 类型。
  // 如果忘记在 {} 上注释类型或赋值到一个未声明类型的变量上，
  // 那么 Dart 会创建一个类型为 Map<dynamic, dynamic> 的对象。
  print('${names.length}');


  //map 创建
  var gifts = {
    // Key:    Value
    'first': '0',
    'second': '1',
    'fifth': '2'
  };



  // Dart 2 中，new 关键字是可选的
  var gifts1 = Map();
  //Key        Value
  gifts['0'] = 'partridge';
  gifts['1'] = 'turtledoves';
  gifts['2'] = 'golden rings';
  print(" ${gifts["0"]}"); //获取  gifts中key 为："0" 的值



  //语法
  fun1(int atomicNumber) {
    return atomicNumber > 0; //返回值类型可以省略
  }


  //如果函数中只有一句表达式，可以使用简写语法：
  // =>expr 是{return expr；}缩写，只适用于一个表达式。
  fun2(int atomicNumber) => atomicNumber > 0;



  //可选参数
  fun3(p1: true, p3: 0);


  // 位置可选参数
  // 将参数放到 [] 中来标记参数是可选的：
  //1111 是[0] 中 位置为0的值
  //2222 是[1] 中 位置为1的值
//  assert(say('Bob', 'Howdy') == '1111', "2222");



// 词法作用域
//  类型判定运算符
//  as， is， 和 is! 运算符用于在运行时处理类型检查：


  Pserson()
    ..age = 10
    ..name = "xh";


  print('xxxx'.getMyLength);



  // 3. 通过多行字符串（使用三引号）
  var s1 = '''
    You can create
    multi-line strings like this one.
''';
  var s2 = 'String '
      'concatenation'
      " works even over line breaks.";
  print(s2);



  var list1 = [1, 2, 3,4,5,6];
  // 展开操作符(...) spread operator
  var list2 = [0, ...list1];
  print(list2.toString());
}

//可选参数 使用 = 来定义可选参数的默认值
//定义函数是，使用 {param1, param2, …} 来指定命名参数：
void fun3({bool p1 = false, String p2 = "", int p3 = 0}) {}

// 位置可选参数
// 将参数放到 [] 中来标记参数是可选的：
//device 为设置默认参数值
String say(String from, String msg,
    [String device = 'carrier pigeon', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}

class Pserson {
  var name;
  var age;
}

/// 字符串扩展方法
extension StringExtension on String {
  get getMyLength => this.length;
}
