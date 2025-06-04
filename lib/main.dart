import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:school_home/pages/AllProduct/AllProduct.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/backend/app_state.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await FlutterFlowTheme.initialize();
  FFAppState().initializePersistedState();


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
    _themeMode = mode;
    FlutterFlowTheme.saveThemeMode(mode);
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'School Home',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   useMaterial3: false,
      // ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'HomePage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'AllCategory': AllCategoryWidget(),
      'Allproduct': Allproduct(category_id: 0,),
      'AddToCard': AddToCardWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => safeSetState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        selectedItemColor: FlutterFlowTheme.of(context).primary, // Set selected icon color to primary color
        unselectedItemColor: Colors.grey, // Set unselected icon color to grey
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              width: 24.0,
              height: 24.0,
              fit: BoxFit.none,
              color: currentIndex == 0
                  ? FlutterFlowTheme.of(context).primary
                  : Colors.grey, // Change color based on selection
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/addtocart.svg',
              width: 24.0,
              height: 24.0,
              fit: BoxFit.none,
              color: currentIndex == 1
                  ? FlutterFlowTheme.of(context).primary
                  : Colors.grey,
            ),
            label: 'Category',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Heart.svg',
              width: 24.0,
              height: 24.0,
              fit: BoxFit.none,
              color: currentIndex == 2
                  ? FlutterFlowTheme.of(context).primary
                  : Colors.grey,
            ),
            label: 'All',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/enquiry.svg',
              width: 24.0,
              height: 24.0,
              fit: BoxFit.none,
              color: currentIndex == 3
                  ? FlutterFlowTheme.of(context).primary
                  : Colors.grey,
            ),
            label: 'Cart',
            tooltip: '',
          ),
        ],
      ),

    );

  }
}


