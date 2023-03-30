import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../stores/stores.dart';
import 'pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(AuthStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(TurmaStore());
  GetIt.I.registerSingleton(MatriculaStore());
  GetIt.I.registerSingleton(UserStore());
  //GetIt.I.registerSingleton(FilaStore());
  //GetIt.I.registerSingleton(MyFilaStore());
}

Future<void> initializeParse() async {
  final appDocDir = await getApplicationDocumentsDirectory();

  await Parse().initialize('Z6fBwWS3AS2fdLk5G3emalO6FvRvh0fJO7WSXvwL',
      'https://parseapi.back4app.com',
      clientKey: 'DK3rwXf4J65uFlh33GI0n29e68nH9o1Rcvlgz5kv',
      autoSendSessionId: true,
      debug: true,
      coreStore:
          await CoreStoreSembastImp.getInstance(appDocDir.path + "/data"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const MaterialColor primaryColorShades = MaterialColor(
      0xFFB0BEC5,
      <int, Color>{
        50: Color(0xFFA4A4BF),
        100: Color(0xFFA4A4BF),
        200: Color(0xFFA4A4BF),
        300: Color(0xFF9191B3),
        400: Color(0xFF7F7FA6),
        500: Color(0xFF181861),
        600: Color(0xFF6D6D99),
        700: Color(0xFF5B5B8D),
        800: Color(0xFF494980),
        900: Color(0xFF181861),
      },
    );
    return MaterialApp(
      title: 'Escolar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: primaryColorShades,
          primaryColor: Colors.blueGrey,
          primaryColorLight: Colors.redAccent,
          primaryColorDark: Colors.redAccent.shade700,
          scaffoldBackgroundColor: Colors.blueGrey.shade200,
          appBarTheme: AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      home: BasePage(),
    );
  }
}
