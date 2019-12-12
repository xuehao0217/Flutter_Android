import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/widget/WidgetListPage.dart';


class BatteryWidget extends StatefulWidget {
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {
  String str_Flutter2Android = 'flutter2Android';
  String str_Android2Fllutter = 'android调用flutter'; //android 调用flutter方式1
  String str_Android2Fllutter2 = 'android调用flutter'; //android 调用flutter方式2

  static const EventChannel eventChannel = EventChannel('Android2Flutter');
  static const MethodChannel methodChannel = MethodChannel('Flutter2Android');

  //flutter异步调用android 原生返回结果
  Future<void> _flutter2Android() async {
    String str_F2A_Result;
    try {
      final String result = await methodChannel.invokeMethod('flutter2Android');
      str_F2A_Result = '$result';
    } on PlatformException {
      str_F2A_Result = '';
    }
    setState(() {
      str_Flutter2Android = str_F2A_Result;
    });
  }

  @override
  void initState() {
    super.initState();
    //Android调用Flutter
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
    //Android调用Flutter 方式2
    methodChannel.setMethodCallHandler((MethodCall call) {
      if (call?.method == 'getContent') {
        setState(() {
          str_Android2Fllutter2 = call?.arguments ?? '';
        });
        return returnToRaw();
      }
    });
  }

  Future<String> returnToRaw() async {
//    return 'received your message';
    throw PlatformException(code: 'error code');
  }

  void _onEvent(Object event) {
    setState(() {
      str_Android2Fllutter = "android调用flutter成功: ${event.toString()} ";
    });
  }

  void _onError(Object error) {
    setState(() {
      PlatformException exception = error;
      str_Android2Fllutter = exception?.message ?? 'android调用flutter失败';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(str_Flutter2Android),
          RaisedButton(
            child: const Text('调用原生'),
            onPressed: _flutter2Android,
          ),
          Text(str_Android2Fllutter),
          Text(str_Android2Fllutter2),

          RaisedButton(
            child: Text("组件集合"),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => WidgetListPage()));
            },

          )



        ],
      ),
    );
  }
}
