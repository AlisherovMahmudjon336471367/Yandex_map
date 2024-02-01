package com.example.yandex_map
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setLocale("uz_UZ") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("89b8facb-d5f6-43cb-9ab4-64dee735601d") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}

