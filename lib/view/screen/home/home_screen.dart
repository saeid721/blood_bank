
import 'package:blood_bank/controller/post_crud/post_repo.dart';
import 'package:blood_bank/global/methods/methods.dart';
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
import 'package:flutter/material.dart';
import '../../../controller/my_text_controller.dart';
import '../../../controller/post_crud/post_model.dart';
import '../../../global/constants/color_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/methods/sizedbox_widget.dart';
import '../../../global/style/lato_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool saved = true;
  bool favorite = true;
  String? selectImg;
  List<PostModel> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPostsData();
    // fetchUserData();
  }

  void fetchPostsData() async{
    List<PostModel> fetchPosts = await PostRepo.fetchPostInfo();
    setState(() {
      posts = fetchPosts;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    messagePrint("Message");
    return Scaffold(
      backgroundColor: ColorRes.backGroundColor,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScrol){
          overScrol.disallowIndicator();
          return true;
        },
        child: ListView.builder(
          itemCount: posts.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                child: Container(
                  color: ColorRes.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: CircularBadgeAvatar(
                                    imageString: posts[index].img,
                                    iconPosition: 70,
                                    needImagePickerIcon: false,
                                  ),
                                ),
                                sizedBoxW(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(posts[index].name ?? "", style: latoBold16.copyWith(
                                      color: ColorRes.black
                                    ),),
                                    const SizedBox(height: 4,),
                                    Text("12h", style: latoRegular.copyWith(
                                        color: ColorRes.black
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(Icons.more_vert, size: 20,),
                                )
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("রোগীর সমস্যা: ${posts[index].patientProblem ?? ""}", style: latoRegular16.copyWith(
                                color: ColorRes.black
                            ),),
                            Text("রক্তের গ্রুপ: ${posts[index].patientBloodGroup ?? ""}", style: latoRegular16.copyWith(
                                color: ColorRes.black
                            ),),
                            Text("রক্তের পরিমাণ: ${posts[index].bloodAmount ?? ""}", style: latoRegular16.copyWith(
                                color: ColorRes.black
                            ),),
                            Text("রক্তদানের তারিখ: ${posts[index].donationDate ?? ""}", style: latoRegular16.copyWith(
                                color: ColorRes.black
                            ),),
                            Text("রক্তদানের সময়: ${posts[index].donationTime ?? ""}", style: latoRegular16.copyWith(
                                color: ColorRes.black
                            ),),
                            Text("হিমোগ্লোবিন: ${posts[index].hemoglobin ?? ""}", style: latoRegular16.copyWith(
                                color: ColorRes.black
                            ),),
                            Text("রক্তদানের স্থান: ${posts[index].location ?? ""}", style: latoRegular16.copyWith(
                                color: ColorRes.black
                            ),),
                            Text("যোগাযোগ: ${posts[index].mobileNo ?? ""}", style: latoRegular16.copyWith(
                                color: ColorRes.black
                            ),),
                            Text("রেফারেন্স নাম্বার: ${posts[index].referenceMblNo ?? ""}", style: latoRegular16.copyWith(
                                color: ColorRes.black
                            ),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Image.asset(
                        AllImages.profileImage,
                        height: 300,
                        width: size.width,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap:(){
                                setState(() {
                                  favorite = !favorite;
                                });
                              },
                              child: Image.asset(
                                favorite
                                    ? AllImages.faboriteDup
                                    : AllImages.favorite,
                                height: 25,
                                width: 25,
                                color: favorite ? ColorRes.black : ColorRes.red,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(AllImages.comment,
                              height: 25,
                              width: 25,
                              color: ColorRes.black,
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap:(){
                                setState(() {
                                  saved = !saved;
                                });
                              },
                              child: Image.asset(
                                saved
                                    ? AllImages.savedDup
                                    : AllImages.saved,
                                height: 22,
                                width: 22,
                                color: ColorRes.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      )
    );
  }
}

// ClipRRect(
//   borderRadius: BorderRadius.circular(100),
//   child: Image.asset(
//     AllImages.profileImage,
//     height: 45,
//     width: 45,
//     fit: BoxFit.cover,
//   ),
// ),