import 'package:flutter/material.dart';

import 'core/helpers/cache_helper.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  runApp(MyApp());
}
