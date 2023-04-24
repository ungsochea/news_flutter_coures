import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter_course/consts/vars.dart';
import 'package:news_flutter_course/services/utils.dart';
import 'package:news_flutter_course/widgets/drawer_widget.dart';
import 'package:news_flutter_course/widgets/tabs_widget.dart';
import 'package:news_flutter_course/widgets/vertical_spacing.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newType = NewsType.allNews;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
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
                  paginationButton(function: (){}, text: 'Prev'),
                  Flexible(
                    flex: 2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemBuilder: ((context,index){
                            return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){},
                                  child: Container(
                                    color: Theme.of(context).cardColor,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("1"),
                                      ),
                                    ),
                                  ),
                                ),

                            );
                          })
                      )
                  ),
                  paginationButton(function: (){}, text: 'Next'),
                ],),
              )
            ],
          ),
        ),
      ),
    );
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
