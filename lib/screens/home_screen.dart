import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/consts/vars.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:news_flutter_course/widgets/articles_widget.dart';
import 'package:news_flutter_course/widgets/drawer_widget.dart';
import 'package:news_flutter_course/widgets/tabs_widget.dart';
import 'package:news_flutter_course/widgets/top_trending.dart';
import 'package:news_flutter_course/widgets/vertical_spacing.dart';

import '../widgets/loading_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newType = NewsType.allNews;
  int currentPageIndex = 0;
  String sortBy = SortByEnum.publishedAt.name;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    final size = Utils(context).getScreenSize;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: color),
          title: Text('News App',style: GoogleFonts.lobster(
              color: color,
              textStyle: const TextStyle(fontSize: 20,letterSpacing: 0.6)
          ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(IconlyLight.search))
          ],
        ),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(children: [
                TabsWidget(
                  text: "All news",
                  fontSize: newType == NewsType.allNews ? 22 : 14,
                  function: (){
                    if(newType == NewsType.allNews){
                      return ;
                    }
                    setState(() {
                      newType = NewsType.allNews;
                    });
                  },
                  color: newType == NewsType.allNews ? Theme.of(context).cardColor : Colors.transparent,
                ),
                const SizedBox(width: 25,),
                TabsWidget(
                  text: "Top Trading",
                  fontSize: newType == NewsType.topTrading ? 22 : 14,
                  function: (){
                    if(newType == NewsType.topTrading){
                      return ;
                    }
                    setState(() {
                      newType = NewsType.topTrading;
                    });
                  },
                  color: newType == NewsType.topTrading ? Theme.of(context).cardColor : Colors.transparent,
                )
              ],),
              const VerticalSpacing(10),
              newType == NewsType.topTrading ? Container(): SizedBox(
                height: kBottomNavigationBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  paginationButton(function: (){
                    if(currentPageIndex == 0){
                      return ;
                    }
                    setState(() {
                      currentPageIndex -= 1;
                    });
                  }, text: 'Prev'),
                    Flexible(
                      flex: 2,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                color: currentPageIndex == index
                                    ? Colors.blue
                                    : Theme.of(context).cardColor,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentPageIndex = index;
                                    });
                                  },
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${index + 1}"),
                                      )),
                                ),
                              ),
                            );
                          })),
                    ),
                  paginationButton(function: (){
                    if(currentPageIndex == 4){
                      return ;
                    }
                    setState(() {
                      currentPageIndex += 1;
                    });
                  }, text: 'Next'),
                ],),
              ),
              const VerticalSpacing(10),
              newType == NewsType.topTrading ? Container():Align(
                alignment: Alignment.topRight,
                child: Material(
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(
                        value: sortBy,
                        items: dropDownItems,
                        onChanged: (String ? value){}),
                  ),
                ),
              ),
              if(newType == NewsType.allNews) 
              Expanded(
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (ctx,index){
                          return const ArticleWidget();
                        }
                    )
              ), 
              // const LoadingWidget(newsType: NewsType.allNews,)
              if(newType == NewsType.topTrading) 
              SizedBox(
                height: size.height * 0.5,
                child: 
                Swiper(
                  autoplay: true,
                  autoplayDelay: 8000,
                  itemWidth: size.width * 0.9,
                  layout: SwiperLayout.STACK,
                  viewportFraction: 0.9,
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return const TopTrendingWidget();
                  }
                )
                // LoadingWidget(newsType: NewsType.topTrading,)
                ,
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<DropdownMenuItem<String>> get dropDownItems{
    List<DropdownMenuItem<String>> menuItem =[
      DropdownMenuItem(
        value: SortByEnum.relevancy.name,
          child: Text(SortByEnum.relevancy.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(SortByEnum.popularity.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(SortByEnum.publishedAt.name),
      ),
    ];
    return menuItem;
  }
  Widget paginationButton({required Function function,required String text}){
    return  ElevatedButton(
      onPressed: (){function();},
      child: Text(text),
      style:  ElevatedButton.styleFrom(
          primary: Colors.blue,
          padding: const EdgeInsets.all(6.0),
          textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
          )
      ),
    );
  }
}
