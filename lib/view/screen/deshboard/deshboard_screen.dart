
import 'dart:developer';

import 'package:blood_bank/view/screen/create/create_screen.dart';
import 'package:blood_bank/view/screen/favourite/favourite_screen.dart';
import 'package:blood_bank/view/screen/home/home_screen.dart';
import 'package:blood_bank/view/screen/profile/profile_screen.dart';
import 'package:blood_bank/view/screen/search/search_screen.dart';
import 'package:flutter/material.dart';
import '../../../controller/auth_crud/auth_repo.dart';
import '../../../global/constants/color_resources.dart';
import '../../../global/constants/images.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = "/dashboardScreen";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async{
    await AuthRepo.fetchUserInfo();
  }

  static const List<Widget> _deshBoardBottomScreen = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CreateScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _deshBoardBottomScreen.elementAt(selectedIndex),
      bottomNavigationBar: HomeDeshBoardScreen(onPress: _onItemTapped,),
    );
  }
}

class HomeDeshBoardScreen extends StatefulWidget {
  // static const String id = "/dashboardScreen";
  final Function(int index)? onPress;
  const HomeDeshBoardScreen({
    Key? key,
    this.onPress
  }) : super(key: key);

  @override
  State<HomeDeshBoardScreen> createState() => _HomeDeshBoardScreenState();
}

class _HomeDeshBoardScreenState extends State<HomeDeshBoardScreen> {

  Color homeColor = ColorRes.primaryColor;
  Color searchColor = ColorRes.primaryColor;
  Color createColor = ColorRes.primaryColor;
  Color favouriteColor = ColorRes.primaryColor;
  Color personColor = ColorRes.primaryColor;

  int selectedIndex = 0;

  void _onBottomBarTapped(int index){
    setState(() {
      selectedIndex = index;

      if(selectedIndex == 0){
        homeColor = ColorRes.primaryColor;
        searchColor = ColorRes.primaryColor;
        createColor = ColorRes.primaryColor;
        favouriteColor = ColorRes.primaryColor;
        personColor = ColorRes.primaryColor;
      }
      else if(selectedIndex == 1){
        homeColor = ColorRes.primaryColor;
        searchColor = ColorRes.primaryColor;
        createColor = ColorRes.primaryColor;
        favouriteColor = ColorRes.primaryColor;
        personColor = ColorRes.primaryColor;
      }
      else if(selectedIndex == 2){
        homeColor = ColorRes.primaryColor;
        searchColor = ColorRes.primaryColor;
        createColor = ColorRes.primaryColor;
        favouriteColor = ColorRes.primaryColor;
        personColor = ColorRes.primaryColor;
      }
      else if(selectedIndex == 3){
        homeColor = ColorRes.primaryColor;
        searchColor = ColorRes.primaryColor;
        createColor = ColorRes.primaryColor;
        favouriteColor = ColorRes.primaryColor;
        personColor = ColorRes.primaryColor;
      }
      else if(selectedIndex == 3){
        homeColor = ColorRes.primaryColor;
        searchColor = ColorRes.primaryColor;
        createColor = ColorRes.primaryColor;
        favouriteColor = ColorRes.primaryColor;
        personColor = ColorRes.primaryColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return BottomAppBar(
      elevation: 0,
      color: ColorRes.white,
      notchMargin: 7.0,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                widget.onPress!(0);
                _onBottomBarTapped(0);
              },
              child: Image.asset(
                selectedIndex == 0
                    ? AllImages.home
                    : AllImages.homeDup,
                height: 25,
                width: 25,
                color: homeColor,
              ),
            ),
            GestureDetector(
              onTap: (){
                widget.onPress!(1);
                _onBottomBarTapped(1);
              },
              child: Image.asset(
                selectedIndex == 1
                    ? AllImages.search
                    : AllImages.search,
                height: 25,
                width: 25,
                color: searchColor,
              ),
            ),
            GestureDetector(
              onTap: (){
                widget.onPress!(2);
                _onBottomBarTapped(2);
              },
              child: Image.asset(
                selectedIndex == 2
                    ? AllImages.create
                    : AllImages.createDup,
                height: 25,
                width: 25,
                color: createColor,
              ),
            ),
            GestureDetector(
              onTap: (){
                widget.onPress!(3);
                _onBottomBarTapped(3);
              },
              child: Image.asset(
                selectedIndex == 3
                    ? AllImages.favorite
                    : AllImages.faboriteDup,
                height: 25,
                width: 25,
                color: favouriteColor,
              ),
            ),
            GestureDetector(
              onTap: (){
                widget.onPress!(4);
                _onBottomBarTapped(4);
              },
              child: Image.asset(
                selectedIndex == 4
                    ? AllImages.profile
                    : AllImages.profileDup,
                height: 25,
                width: 25,
                color: personColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}