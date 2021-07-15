import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getyour/common/global.dart';
import 'package:getyour/common/my_colors.dart';
import 'package:getyour/google/firebase_auth.dart';
import 'package:getyour/util/product_util.dart';
import 'package:getyour/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: GlobalData.scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.withOpacity(.5)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: NetworkImage(
                        'https://lh3.googleusercontent.com/proxy/SA3IehOpR05NXPO4uy1VElrGJo2WRbSdb-2MC5Le1UKt9npyKqnzx89CO5cBMBua1ZZ5T0iGQ7neQOCsGX2U1kklrq6UkMRexRzClMPXVQUrW8j6wIaSVbPvXud9'),
                  ),
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'User@gmail.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 5,
              width: size.width,
              color: Colors.blue,
            ),
            ListTile(
              leading: Icon(CupertinoIcons.house_fill),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 18),
              ),
              focusColor: Colors.black,
              selectedTileColor: Colors.blue,
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text(
                'Account',
                style: TextStyle(fontSize: 18),
              ),
              focusColor: Colors.black,
              selectedTileColor: Colors.blue,
            ),
            ListTile(
              selectedTileColor: Colors.blue,
              leading: Icon(CupertinoIcons.arrow_left_circle),
              title: Text(
                'Log Out',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                logOutAccount(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Icon(
                          CupertinoIcons.bars,
                          size: 30,
                          color: MyColors.white,
                        ),
                        onTap: () {
                          GlobalData.scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          CupertinoIcons.search,
                          size: 30,
                          color: MyColors.white,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Text(
                    'OTOS',
                    style: TextStyle(color: Colors.white, fontSize: 29),
                  ),
                  Text(
                    'How can i help you?',
                    style: TextStyle(color: Colors.white, fontSize: 29),
                  ),
                ],
              ),
            ),
          ),
          new Positioned(
            left: 0.0,
            top: 160.0,
            child: new Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white24.withOpacity(.8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                child: ListView(
                  children: [
                    StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(
                        1,
                      ),
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 1,
                      itemCount: ProductUtil.list.length,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          productModel: ProductUtil.list[index],
                        );
                      },
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
