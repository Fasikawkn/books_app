import 'package:books_app/config/routes.dart';
import 'package:books_app/modules/home/home_view.dart';
import 'package:books_app/modules/search/search_view.dart';
import 'package:get/get.dart';


class AppPages {
  static const initialRoute = AppRoute.home;

  static final pages = [

    GetPage(name: AppRoute.home, page: ()=> const HomeView()),
    GetPage(name: AppRoute.searchView, page: ()=> const SearchView()),
    

    
  ];
}
