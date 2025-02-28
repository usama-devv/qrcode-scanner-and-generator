import 'package:get/get.dart';
import '../ui/views/history_view.dart';
import '../ui/views/main_view.dart';
import '../ui/views/splash_view.dart';
import '../ui/views/home_view.dart';
import '../ui/views/generator_view.dart';
import '../ui/views/scanner_view.dart';

class AppRoutes {
  static const splash = '/';
  static const main = '/main';
  static const home = '/home';
  static const history = '/history';
  static const generator = '/generator';
  static const scanner = '/scanner';

  static final pages = [
    GetPage(name: splash, page: () => const SplashView()),
    GetPage(name: main, page: () => const MainView()),
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: history, page: () => const HistoryView()),
    GetPage(name: generator, page: () => const GeneratorView()),
    GetPage(name: scanner, page: () => const ScannerView()),
  ];
}
