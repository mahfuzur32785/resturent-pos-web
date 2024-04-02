import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:web/services/hive_product_adapter.dart';
import 'package:web/views/layout_template/layout_template.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locator.dart';

late final SharedPreferences sharedPreferences;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  // Hive.registerAdapter(UpdateProductAdapter());
  await Hive.openBox<Product>('product');
  // await Hive.openBox<UpdateProduct>('product_update');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Pos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Jost'),
      ),
      home: LayoutTemplate(),
    );
  }
}
