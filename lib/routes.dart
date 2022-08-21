import 'package:flutter/material.dart';
import 'package:news_app/screens/business/business_screen.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/screens/science/science_screen.dart';
import 'package:news_app/screens/search/search_screen.dart';
import 'package:news_app/screens/sports/sports_screens.dart';
import 'package:news_app/screens/webview/web_view_screen.dart';

final Map<String,WidgetBuilder> routes={
  NewsScreen.routeName :(context)=>const NewsScreen(),
  BusinessScreen.routeName :(context)=>const BusinessScreen(),
  ScienceScreen.routeName :(context)=>const ScienceScreen(),
  SportsScreen.routeName :(context)=>const SportsScreen(),
  SearchScreen.routeName :(context)=>const SearchScreen(),
  WebViewScreen.routeName :(context)=> WebViewScreen(),
};