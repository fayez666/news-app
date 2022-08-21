import 'package:flutter/material.dart';
import 'package:news_app/components/article_builder.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/screens/search/components/search_item.dart';

class Body extends StatelessWidget {
   Body({Key? key}) : super(key: key);
  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).search;
    return Column(
      children: [
        SearchItem(searchController: searchController),
        Expanded(child: ArticleBuilder(list: list))
      ],
    );
  }
}
