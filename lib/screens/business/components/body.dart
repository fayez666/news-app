import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';

import '../../../components/article_builder.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list =NewsCubit.get(context).business;
    return ArticleBuilder(list: list);
  }
}


