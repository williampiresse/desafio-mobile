import 'package:flutter/material.dart';

import 'app.dart';
import 'core/injection/dependency_injection_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyInjection.instance.initialize();

  runApp(const App());
}
