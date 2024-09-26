// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:blood_bank/global/style/montserrat.dart';
import 'package:circular_badge_avatar/circular_badge_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/auth_crud/auth_model.dart';
import '../../../controller/auth_crud/auth_repo.dart';
import '../../../controller/my_text_controller.dart';
import '../../../global/constants/color_resources.dart';
import '../../../global/methods/sizedbox_widget.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  UserModel? userModel;
  String? fireSelectImg;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

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
          fireSelectImg = userModel!.image;
          log("Image Fire: $fireSelectImg");
        });
      } else{
        log("Error!");
      }
    } catch(e){
      log("==@ Error: $e");
    }

  }


  Future<XFile?> showPickerDialogue() async {
    final ImagePicker picker = ImagePicker();
    return await showModalBottomSheet<XFile?>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: ColorRes.black,
            ),
            title: const Text("Take a picture"),
            onTap: ()async {
              XFile? imagePicker = await picker.pickImage(source: ImageSource.camera);
              setState(() {
                if (imagePicker != null) {
                  selectedImage = XFile(selectedImage!.path);
                  Get.back<XFile>(result: selectedImage);
                } else {
                  Get.back();
                }
              });
              await AuthRepo.reqSignUp(image: selectedImage!.path);
            },
          ),
          ListTile(
            onTap: () async{
              XFile? imagePicker = await picker.pickImage(source: ImageSource.gallery);
              setState(() {
                if (imagePicker != null) {
                  selectedImage = XFile(imagePicker.path);
                  Get.back<XFile>(result: selectedImage);
                } else {
                  Get.back();
                }
              });
              log("==@ Image Url: ${selectedImage!.path}");
              log("==@ Image Url: ${userModel?.image}");
              await AuthRepo.reqSignUp(image: selectedImage!.path);
            },
            leading: const Icon(
              Icons.photo,
              color: ColorRes.black,
            ),
            title: const Text("Choose one from gallery"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    log("==@ Profile Image: ${userModel?.image}");
    return Scaffold(
      key: _drawerKey,
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        backgroundColor: ColorRes.white,
        elevation: 0,
        actions: [
          GestureDetector(
              onTap: (){
                showPickerDialogue();
              },
              child: const Icon(
                  Icons.camera_alt_outlined,
                  color: ColorRes.black
              )
          ),
          const SizedBox(width: 20,),
          GestureDetector(
              onTap: (){
                _drawerKey.currentState!.isEndDrawerOpen
                    ? _drawerKey.currentState!.closeEndDrawer()
                    : _drawerKey.currentState!.openEndDrawer();
              },
              child: const Icon(
                  Icons.menu,
                  color: ColorRes.black
              )
          ),
          const SizedBox(width: 15,)
        ],
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              customDivider,
              ListTile(
                onTap: () {
                  // Get.to(()=> SettingScreen());
                },
                leading: const Icon(
                  Icons.settings_outlined,
                  color: ColorRes.black,
                ),
                title: const Text("Settings"),
              ),
              customDivider,
              Expanded(child: Container()),
              customDivider,
              ListTile(
                onTap: () {
                  AuthRepo.logOut();
                },
                leading: const Icon(
                  Icons.logout,
                  color: ColorRes.black,
                ),
                title: const Text("LogIn Out"),
              ),
              customDivider,
              sizedBoxH(10)
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxH(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    child: CircularBadgeAvatar(
                      imageString: fireSelectImg,
                      imagePath: selectedImage,
                      iconPosition: 70,
                      needImagePickerIcon: false,
                      networkImage: "https://raw.githubusercontent.com/muktabd/public-images/main/user_placeholder.png",
                      // iconOnPressed: () async {
                      //   log("Hello badge");
                      //   final file =  await showModalBottomSheet<XFile?>(
                      //       context: context,
                      //       builder: (context) {
                      //         return const BottomSheetImagePicker();
                      //       });
                      //   setState(() {
                      //     selectedImage = file;
                      //   });
                      //   await AuthRepo.reqSignUp(image: selectedImage!.path);
                      // },
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Column(
                          children: [
                            Text(userModel?.bloodGroup ?? "", style: montserratMedium, textAlign: TextAlign.center,),
                            const SizedBox(height: 4,),
                            Text("Blood Group", style: montserratSemiBold.copyWith(fontSize: 13), textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                      sizedBoxW(10),
                      SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            Text(userModel?.timeDonar ?? "", style: montserratMedium, textAlign: TextAlign.center,),
                            const SizedBox(height: 4,),
                            Text("Time Donation", style: montserratSemiBold.copyWith(fontSize: 13), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                      sizedBoxW(10),
                      SizedBox(
                        width: 70,
                        child: Column(
                          children: [
                            Text(userModel?.lastDate ?? "", style: montserratMedium, textAlign: TextAlign.center,),
                            const SizedBox(height: 4,),
                            Text("Last Donate Date", style: montserratSemiBold.copyWith(fontSize: 13), textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              sizedBoxH(10),
              Text(userModel?.name ?? "", style: montserratSemiBold16,),
              const SizedBox(height: 2,),
              Text(userModel?.email ?? "", style: montserratMedium,),
              const SizedBox(height: 12,),
              GestureDetector(
                onTap: (){
                  Get.to(()=> const EditProfileScreen());
                },
                child: Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorRes.chatIconColor
                  ),
                  child: Center(child: Text("Edit Profile", style: montserratSemiBold.copyWith(
                      color: ColorRes.black
                  ),),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// SizedBox(
//   height: 100,
//   child: NetworkImageAvatar(
//     imageString: fireSelectImg,
//     imagePath: selectedImage,
//     iconPosition: 70,
//     isIcon: false,
//     networkImage: "https://raw.githubusercontent.com/muktabd/public-images/main/user_placeholder.png",
//     iconOnPressed: () async {
//       log("Hello badge");
//       final file =  await showModalBottomSheet<XFile?>(
//           context: context,
//           builder: (context) {
//             return const BottomSheetImagePicker();
//           });
//       setState(() {
//         selectedImage = file;
//       });
//       await AuthRepo.reqSignUp(image: selectedImage!.path);
//     },
//   ),
// ),

// Container(
//   height: 80,
//   width: 80,
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(100),
//       border: Border.all(
//           width: 0.5,
//           color: ColorResources.lightSkyBlue
//       )
//   ),
//   child: ClipRRect(
//       borderRadius: BorderRadius.circular(100),
//       child: selectedImage == null
//           ? userModel?.image != null
//           ? Image.file(File(userModel?.image ?? ""))
//           : Image.asset("assets/images/user_placeholder.png")
//           : Image.file(File(selectedImage!.path))
//       // child: Image.file(File(userModel?.image ?? ""))
//   ),
// ),