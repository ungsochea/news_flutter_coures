import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_flutter_course/consts/vars.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:news_flutter_course/widgets/empty_screen.dart';
import 'package:news_flutter_course/widgets/vertical_spacing.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchTextController;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        focusNode.unfocus();
                        Navigator.pop(context);
                      },
                      child: const Icon(IconlyLight.arrowLeft2),
                    ),
                    Flexible(
                        child: TextField(
                      focusNode: focusNode,
                      controller: _searchTextController,
                      style: TextStyle(color: color),
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 8 / 5),
                        hintText: "Search",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffix: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              _searchTextController.clear();
                              focusNode.unfocus();
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.close,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              const VerticalSpacing(10),
              Expanded(
                child: MasonryGridView.count(
                  itemCount: searchKeyWords.length,
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: color),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(searchKeyWords[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const EmptyNewsWidget(
                  text: "Ops! No results found",
                  imagePath: "assets/images/search.png")
            ],
          ),
        ),
      ),
    );
  }
}
