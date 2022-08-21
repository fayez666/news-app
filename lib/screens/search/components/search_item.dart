import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';


class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: searchController,
        onChanged: (value){
         NewsCubit.get(context).getSearch(value);
        },validator: (value) {
        if (value == null || value.isEmpty) {
          return 'search must be not empty';
        }
        return null;
      },
        decoration: const InputDecoration(

          prefixIcon: Icon(Icons.search),
          hintText: 'search',
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
