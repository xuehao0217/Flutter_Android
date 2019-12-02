package xueh.com.myapplication

import android.os.Bundle
import android.util.Log
import androidx.annotation.Nullable
import androidx.appcompat.app.AppCompatActivity
import io.flutter.facade.Flutter
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodChannel


class MainActivity : AppCompatActivity() {
    val FLUTTER2ANDROID = "Flutter2Android"
    val ANDROID2FLUTTER = "Android2Flutter"
    var TAG = "AAA"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val flutterView = Flutter.createView(
            this@MainActivity,
            lifecycle,
            "battery"
        )
        setContentView(flutterView)
//        setContentView(R.layout.activity_main)


        MethodChannel((flutterView), FLUTTER2ANDROID).apply {
            //flutter与android通信
            //FLUTTER2ANDROID   和 Flutter 中保持一致
            setMethodCallHandler { call, result ->
                //  和 Flutter 中保持一致
                if (call.method == "flutter2Android") {
                    //  startActivity(Intent(this@MainActivity, Main2Activity::class.java))
                    result.success("我是android原生返回的")


                    //android向flutter通信 方式二
                    //   第一个为方法名。用于 Flutter 区分 Android 的不同请求。
                    //   第二个为参数值。用于 Android 需要给 Flutter 传递的额外数据。
                    //   第三个为 Android -> Flutter 请求的结果回调。
                    invokeMethod("getContent", "android 返回：android向flutter通信 方式二", object : MethodChannel.Result {
                        override fun success(@Nullable o: Any?) {
                            Log.e(TAG, "success=$o")
                        }

                        override fun error(s: String, @Nullable s1: String?, @Nullable o: Any?) {
                            Log.e(TAG, "error=$s")
                        }

                        override fun notImplemented() {
                            Log.e(TAG, "notImplemented")
                        }
                    })
                } else {
                    result.notImplemented()
                }
            }
        }


        //android向flutter通信 方式一
        // ANDROID2FLUTTER 和 Flutter 中保持一致
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
