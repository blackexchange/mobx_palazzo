import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  runApp(const MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize('Z6fBwWS3AS2fdLk5G3emalO6FvRvh0fJO7WSXvwL',
      'https://parseapi.back4app.com',
      clientKey: 'DK3rwXf4J65uFlh33GI0n29e68nH9o1Rcvlgz5kv',
      autoSendSessionId: true,
      debug: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasePage(),
    );
  }
}
