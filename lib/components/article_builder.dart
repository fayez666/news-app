import 'package:flutter/material.dart';

import 'article_item.dart';
import 'my_divider.dart';


class ArticleBuilder extends StatelessWidget {
  const ArticleBuilder({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index)=> ArticleItem(list: list[index]),
      separatorBuilder: (context,index)=> const MyDivider(),
      itemCount: list.length,
    );
  }
}