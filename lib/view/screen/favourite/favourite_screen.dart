import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../controller/auth_crud/auth_model.dart';
import '../../../controller/auth_crud/auth_repo.dart';
import '../../../global/constants/color_resources.dart';
import '../../../global/style/lato_styles.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  UserModel? userModel;
  int isFavourite = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async{
    try{
      UserModel? user = await AuthRepo.fetchUserInfo();
      if(user != null){
        setState(() {
          userModel = user;
        });
      } else{
        log("Error!");
      }
    } catch(e){
      log("==@ Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        title: Text("Activity", style: latoBold.copyWith(
          color: ColorRes.black,
          fontSize: 22
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isFavourite = 0;
                      });
                    },
                    child: Container(
                      height: 32,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isFavourite == 0
                            ? ColorRes.chatIconColor
                            : Colors.transparent,
                          border: Border.all(
                              width: 1,
                              color: isFavourite == 1
                                  ? ColorRes.chatIconColor
                                  : Colors.transparent
                          )
                      ),
                      child: Center(
                        child: Text("All", style: latoBold.copyWith(
                          color: ColorRes.black
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isFavourite = 1;
                      });
                    },
                    child: Container(
                      height: 32,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isFavourite == 1
                              ? ColorRes.chatIconColor
                              : Colors.transparent,
                        border: Border.all(
                          width: 1,
                            color: isFavourite == 1
                                ? Colors.transparent
                                : ColorRes.chatIconColor
                        )
                      ),
                      child: Center(
                        child: Text("Saved", style: latoBold.copyWith(
                            color: ColorRes.black
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
