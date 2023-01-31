import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

class UserServiceSearchPage extends StatefulWidget {
  const UserServiceSearchPage({super.key});

  @override
  State<UserServiceSearchPage> createState() => _UserServiceSearchPageState();
}

class _UserServiceSearchPageState extends State<UserServiceSearchPage> {
  @override
  Widget build(BuildContext context) {
    List list = [
      "Flutter",
      "React",
      "Ionic",
      "Xamarin",
    ];
    return Column(
      children: [
        GFSearchBar(
          searchList: list,
          searchQueryBuilder: (query, list) {
            return list
                .where(
                    (item) => item.toLowerCase().contains(query.toLowerCase()))
                .toList();
          },
          overlaySearchListItemBuilder: (item) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                item,
                style: const TextStyle(fontSize: 18),
              ),
            );
          },
          onItemSelected: (item) {
            setState(() {
              print('$item');
            });
          },
        ),
      ],
    );
  }
}

