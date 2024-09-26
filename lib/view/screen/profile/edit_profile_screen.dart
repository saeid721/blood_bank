
import 'dart:developer';
import 'package:blood_bank/controller/my_text_controller.dart';
import 'package:blood_bank/global/methods/button.dart';
import 'package:blood_bank/global/methods/show_toast.dart';
import 'package:blood_bank/global/style/montserrat.dart';
import 'package:blood_bank/global/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../controller/auth_crud/auth_model.dart';
import '../../../controller/auth_crud/auth_repo.dart';
import '../../../global/constants/datetime_formatter.dart';
import '../../../global/methods/show_datetime_picker.dart';
import '../../../global/methods/sizedbox_widget.dart';
import '../../../global/widget/dropdown_formfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  UserModel? userModel;
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  TextEditingController nameController = MyTextController().nameController;
  TextEditingController emailController = MyTextController().emailController;
  TextEditingController phoneController = MyTextController().phoneController;
  TextEditingController passController = MyTextController().passController;
  TextEditingController birthDateController = MyTextController().birthDateController;
  TextEditingController lastDateController = MyTextController().lastDateController;
  TextEditingController timeDonarController = MyTextController().timeDonarController;

  void loadUserData() async{
    UserModel? userModel = await AuthRepo.fetchUserInfo();

    if(userModel != null){
      nameController.text = userModel.name!;
      emailController.text = userModel.email!;
      phoneController.text = userModel.phone!;
      passController.text = userModel.password!;
      birthDateController.text = userModel.birthdate!;
      lastDateController.text = userModel.lastDate!;
      timeDonarController.text = userModel.timeDonar!;
      gender = userModel.gender!;
      group = userModel.bloodGroup!;
      division = userModel.division!;
      district = userModel.district!;
      upozilas = userModel.upozilas!;

    }

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
  void initState() {
    super.initState();
    setState(() {
      loadUserData();
      fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScrol){
            overScrol.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH(60),
                CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  titleText: "Name",
                  isDense: true,
                  controller: nameController..text = "${userModel?.name}",
                ),
                sizedBoxH(15),
                CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  titleText: "Email",
                  isDense: true,
                  controller: emailController..text = "${userModel?.email}",
                ),
                sizedBoxH(15),
                CustomTextFormField(
                  keyboardType: TextInputType.phone,
                  titleText: "Phone Number",
                  isDense: true,
                  controller: phoneController..text = "${userModel?.phone}",
                  enabled: false,
                ),
                sizedBoxH(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: birthDateController,
                        keyboardType: TextInputType.phone,
                        titleText: "Birth Date",
                        hintText: "dd/MM/yyyy",
                        isDense: true,
                        sufixIcon: IconButton(
                          onPressed: () async{
                            var pickedDate = await showDateOnlyPicker(context);
                            setState(() {
                              String formatedDate = DateTimeFormatter.showDateOnly.format(pickedDate);
                              birthDateController.text = formatedDate;
                            });
                          },
                          icon: const Icon(Icons.calendar_month,
                              color: Colors.red
                          ),
                        ),

                      ),
                    ),
                    sizedBoxW(8),
                    Expanded(
                      child: CustomTextFormField(
                        keyboardType: TextInputType.phone,
                        titleText: "Last Donate Date",
                        controller: lastDateController,
                        isDense: true,
                        hintText: "dd/MM/yyyy",
                        sufixIcon: GestureDetector(
                          onTap: () async{
                            var pickedDate = await showDateOnlyPicker(context);
                            setState(() {
                              String formatedDate = DateTimeFormatter.showDateOnly.format(pickedDate);
                              lastDateController.text = formatedDate;
                            });
                          },
                          child: const Icon(Icons.calendar_month,
                              color: Colors.red
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                sizedBoxH(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomDropDownFormField(
                        height: 50,
                        titleText: "Gender",
                        value: gender,
                        isDense: true,
                        items: const [
                          "Select",
                          "Male",
                          "Female",
                        ],
                        validator: (val){
                          if(val!.isEmpty || gender == "Select"){
                            return "Field is required!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                    sizedBoxW(8),
                    Expanded(
                      child: CustomDropDownFormField(
                        titleText: "Blood Group",
                        value: group,
                        height: 50,
                        isDense: true,
                        items: const [
                          "Select",
                          "A+",
                          "A-",
                          "B+",
                          "B-",
                          "O+",
                          "O-",
                          "AB+",
                          "AB-",
                        ],
                        validator: (val){
                          if(val!.isEmpty || group == "Select"){
                            return "Field is required!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            group = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                sizedBoxH(15),
                CustomTextFormField(
                  keyboardType: TextInputType.phone,
                  isDense: true,
                  titleText: "How many time donated?",
                  controller: timeDonarController..text = "${userModel?.timeDonar}",
                ),
                sizedBoxH(25),
                const Text("Permanent Address :", style: montserratSemiBold),
                sizedBoxH(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomDropDownFormField(
                        height: 50,
                        isDense: true,
                        titleText: "Division",
                        value: division,
                        items: const [
                          "Select",
                          "Dhaka",
                          "Chittagong",
                          "Barishal",
                          "Khulna",
                          "Rajshahi",
                          "Rangpur",
                          "Mymensingh",
                          "Sylhet",
                        ],
                        validator: (val){
                          if(val!.isEmpty || division == "Select"){
                            return "Field is required!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            division = value!;
                          });
                        },
                      ),
                    ),
                    sizedBoxW(8),
                    Expanded(
                      child: CustomDropDownFormField(
                        titleText: "District",
                        height: 50,
                        isDense: true,
                        value: district,
                        items: const [
                          "Select",
                          "Chittagong",
                          "Feni",
                          "Comila",
                          "Noyakhali",
                        ],
                        validator: (val){
                          if(val!.isEmpty || district == "Select"){
                            return "Field is required!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            district = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                sizedBoxH(15),
                CustomDropDownFormField(
                  titleText: "Upozilas",
                  value: upozilas,
                  height: 50,
                  isDense: true,
                  items: const [
                    "Select",
                    "Feni Sodor",
                    "Fulgazi",
                    "Sunagazi",
                    "Dagonbhuiyan",
                    "Chagolaiya",
                    "Porsuram",
                  ],
                  validator: (val){
                    if(val!.isEmpty || upozilas == "Select"){
                      return "Field is required!";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      upozilas = value!;
                    });
                  },
                ),
                sizedBoxH(40),
                CustomButtonWidget(
                  onTap: () async {
                    try{
                      await AuthRepo.reqUpdateProfile(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        phone: phoneController.text.trim(),
                        birthdate: birthDateController.text.trim(),
                        lastDate: lastDateController.text.trim(),
                        gender: gender,
                        bloodGroup: group,
                        timeDonar: timeDonarController.text.trim(),
                        division: division,
                        district: district,
                        upozilas: upozilas,
                      );
                      showSuccessToast("Profile Updated Successfully!");
                    } catch(e){
                      showFailedToast("Failed to update profile: $e");
                    }
                  },
                  title: "Update Profile",
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
