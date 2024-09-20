import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clon_app/my_app.dart';

void main() async {
  await Supabase.initialize(
    url: const String.fromEnvironment('supabase-url'),
    anonKey: const String.fromEnvironment("supabase-key"),
  );

  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (BuildContext context) => const MyApp(),
    ),
  );
}
