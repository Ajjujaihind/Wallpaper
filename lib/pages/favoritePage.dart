import 'package:flutter/material.dart';
import '../Widgets/Imagewidget.dart';
import '../Widgets/SearchWidget.dart';

class favorite extends StatelessWidget {
  const favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          body: SafeArea(
              //Custom app bar
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.keyboard_return,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Favourite Wallpaer',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff85C1E9)),
                    ),
                    Text('')
                  ],
                ),
              ),
              //Custom app bar

              //Searchbar
              SearchWidget(),
              //Searchbar

              //Tabbar
              TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 2))),
                  tabs: [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Space',
                    ),
                    Tab(
                      text: 'Nature',
                    ),
                    Tab(
                      text: 'Technology',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Science',
                    ),
                  ]),
              Flexible(
                  flex: 1,
                  child: TabBarView(children: [
                    Imagewidget(),
                    Imagewidget(),
                    Imagewidget(),
                    Imagewidget(),
                    Imagewidget(),
                    Imagewidget(),
                  ]))
              //Tabbar
            ],
          )),
        ));
  }
}
