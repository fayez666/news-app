import 'package:flutter/material.dart';

import '../../../components/article_builder.dart';
import '../../../cubit/cubit.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list =NewsCubit.get(context).sports;
    return ArticleBuilder(list: list);
  }
}

