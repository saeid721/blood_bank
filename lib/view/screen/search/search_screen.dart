
import 'package:blood_bank/view/basewidget/styles.dart';
import 'package:flutter/material.dart';


import '../../../global/constants/color_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/methods/sizedbox_widget.dart';
import '../../../global/style/lato_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  String division = "Dhaka";
  List<String> divisionList = [
    "Dhaka",
    "Chittagong",
    "Rajshahi",
    "Sylhet",
    "Khulna",
    "Barisal",
    "Rangpur",
    "Mymensingh"
  ];

  String district = "Feni";
  List<String> districtList = [
    "Chittagong",
    "Feni",
    "Comila",
    "Rajshahi",
    "Sylhet",
    "Khulna",
    "Barisal",
    "Rangpur",
    "Mymensingh"
  ];

  String upozilas = "Feni";
  List<String> upozilasList = [
    "Chittagong",
    "Feni",
    "Comila",
    "Rajshahi",
    "Sylhet",
    "Khulna",
    "Barisal",
    "Rangpur",
    "Mymensingh"
  ];

  String isClick = "A+";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorRes.white,
        leading: Center(
          child: Text("Search", style: latoBold24.copyWith(
              color: ColorRes.black
          ),),
        ),
        leadingWidth: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScrol){
            overScrol.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    style: latoRegular16.copyWith(
                        color: ColorRes.grey
                    ),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: latoRegular16.copyWith(
                          color: ColorRes.grey
                      ),
                      contentPadding: const EdgeInsets.only(bottom: 5, left: 5),
                      filled: true,
                      fillColor: ColorRes.backGroundColor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Image.asset(
                          AllImages.search,
                          height: 15,
                          width: 15,
                          color: ColorRes.grey,
                        ),
                      ),
                    ),
                    cursorColor: ColorRes.grey,
                  ),
                ),
                sizedBoxH(10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                          items: divisionList.map((itemValue) =>
                              DropdownMenuItem<String>(
                                value: itemValue,
                                child: Text(
                                  itemValue,
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: latoRegular,
                                ),
                              )
                          ).toList(),
                          isExpanded: true,
                          value: division,
                          decoration: inputDecoration,
                          onChanged: (value){
                            setState(() {
                              division = value!;
                            });
                          }
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                          items: districtList.map((itemValue) =>
                              DropdownMenuItem<String>(
                                value: itemValue,
                                child: Text(
                                  itemValue,
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: latoRegular,
                                ),
                              )
                          ).toList(),
                          isExpanded: true,
                          value: district,
                          decoration: inputDecoration,
                          onChanged: (value){
                            setState(() {
                              district = value!;
                            });
                          }
                      ),
                    ),
                  ],
                ),
                sizedBoxH(10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                          items: upozilasList.map((itemValue) =>
                              DropdownMenuItem<String>(
                                value: itemValue,
                                child: Text(
                                  itemValue,
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: latoRegular,
                                ),
                              )
                          ).toList(),
                          isExpanded: true,
                          value: upozilas,
                          decoration: inputDecoration,
                          onChanged: (value){
                            setState(() {
                              upozilas = value!;
                            });
                          }
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(child: Container())
                  ],
                ),
                sizedBoxH(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        isClick = "A+";
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isClick == "A+" ? ColorRes.redDeep : Colors.transparent,
                            border: Border.all(
                                color: isClick == "A+" ? Colors.transparent : ColorRes.redDeep,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Text("A+", style: latoBold18.copyWith(
                            color: isClick == "A+" ? ColorRes.white : ColorRes.redDeep,
                          ),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        isClick = "AB+";
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isClick == "AB+" ? ColorRes.redDeep : Colors.transparent,
                            border: Border.all(
                                color: isClick == "AB+" ? Colors.transparent : ColorRes.redDeep,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Text("AB+", style: latoBold18.copyWith(
                            color: isClick == "AB+" ? ColorRes.white : ColorRes.redDeep,
                          ),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        isClick = "O+";
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isClick == "O+" ? ColorRes.redDeep : Colors.transparent,
                            border: Border.all(
                                color: isClick == "O+" ? Colors.transparent : ColorRes.redDeep,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Text("O+", style: latoBold18.copyWith(
                            color: isClick == "O+" ? ColorRes.white : ColorRes.redDeep,
                          ),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        isClick = "B+";
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isClick == "B+" ? ColorRes.redDeep : Colors.transparent,
                            border: Border.all(
                                color: isClick == "B+" ? Colors.transparent : ColorRes.redDeep,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Text("B+", style: latoBold18.copyWith(
                            color: isClick == "B+" ? ColorRes.white : ColorRes.redDeep,
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBoxH(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        isClick = "A-";
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isClick == "A-" ? ColorRes.redDeep : Colors.transparent,
                            border: Border.all(
                                color: isClick == "A-" ? Colors.transparent : ColorRes.redDeep,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Text("A-", style: latoBold18.copyWith(
                            color: isClick == "A-" ? ColorRes.white : ColorRes.redDeep,
                          ),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        isClick = "AB-";
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isClick == "AB-" ? ColorRes.redDeep : Colors.transparent,
                            border: Border.all(
                                color: isClick == "AB-" ? Colors.transparent : ColorRes.redDeep,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Text("AB-", style: latoBold18.copyWith(
                            color: isClick == "AB-" ? ColorRes.white : ColorRes.redDeep,
                          ),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        isClick = "O-";
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isClick == "O-" ? ColorRes.redDeep : Colors.transparent,
                            border: Border.all(
                                color: isClick == "0-" ? Colors.transparent : ColorRes.redDeep,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Text("O-", style: latoBold18.copyWith(
                            color: isClick == "O-" ? ColorRes.white : ColorRes.redDeep,
                          ),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        isClick = "B-";
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isClick == "B-" ? ColorRes.redDeep : Colors.transparent,
                            border: Border.all(
                                color: isClick == "B-" ? Colors.transparent : ColorRes.redDeep,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Text("B-", style: latoBold18.copyWith(
                            color: isClick == "B-" ? ColorRes.white : ColorRes.redDeep,
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBoxH(10),
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        height: 100,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: ColorRes.redDeep)
                        ),

                      );
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

