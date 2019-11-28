package xueh.com.myapplication

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import io.flutter.facade.Flutter
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodChannel


class MainActivity : AppCompatActivity() {
    val FLUTTER2ANDROID = "Flutter2Android"
    val ANDROID2FLUTTER = "Android2Flutter"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val flutterView = Flutter.createView(
            this@MainActivity,
            lifecycle,
            "battery"
        )
        setContentView(flutterView)
//        setContentView(R.layout.activity_main)


        MethodChannel((flutterView), FLUTTER2ANDROID).setMethodCallHandler { call, result ->
            if (call.method == "flutter2Android") {
//                startActivity(Intent(this@MainActivity, Main2Activity::class.java))
                result.success("我是android原生返回的")
            } else {
                result.notImplemented()
            }
        }


        EventChannel(flutterView, ANDROID2FLUTTER).setStreamHandler(object :
            EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventSink?) {
                events?.success("我是原生调用flutter返回的")
            }

            override fun onCancel(arguments: Any?) {
            }

        })

    }
}
