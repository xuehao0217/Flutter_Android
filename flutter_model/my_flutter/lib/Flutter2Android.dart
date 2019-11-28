import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryWidget extends StatefulWidget {
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {
  String android2Fllutter = 'android调用flutter';
  String flutter2Android = 'flutter2Android';

  static const EventChannel eventChannel = EventChannel('Android2Flutter');
  static const MethodChannel methodChannel = MethodChannel('Flutter2Android');

  Future<void> _flutter2Android() async {
    String flutter2AndroidResult;
    try {
      final String result = await methodChannel.invokeMethod('flutter2Android');
      flutter2AndroidResult = '$result';
    } on PlatformException {
      flutter2AndroidResult = '';
    }
    setState(() {
      flutter2Android = flutter2AndroidResult;
    });
  }

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    setState(() {
      android2Fllutter = "android调用flutter成功返回值: ${event.toString()} ";
    });
  }

  void _onError(Object error) {
    setState(() {
      PlatformException exception = error;
      android2Fllutter = exception?.message ?? 'android调用flutter失败';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(flutter2Android),
          RaisedButton(
            child: const Text('调用原生'),
            onPressed: _flutter2Android,
          ),
          Text(android2Fllutter),
        ],
      ),
    );
  }
}
