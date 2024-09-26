
import 'package:blood_bank/controller/my_text_controller.dart';
import 'package:blood_bank/global/methods/button.dart';
import 'package:blood_bank/global/methods/show_datetime_picker.dart';
import 'package:blood_bank/global/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../controller/auth_crud/auth_repo.dart';
import '../../../global/constants/datetime_formatter.dart';
import '../../../global/methods/show_toast.dart';
import '../../../global/methods/sizedbox_widget.dart';
import '../../../global/style/lato_styles.dart';
import '../../../global/widget/dropdown_formfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  TextEditingController nameController = MyTextController().nameController;
  TextEditingController emailController = MyTextController().emailController;
  TextEditingController phoneController = MyTextController().phoneController;
  TextEditingController passController = MyTextController().passController;
  TextEditingController birthDateController = MyTextController().birthDateController;
  TextEditingController lastDateController = MyTextController().lastDateController;
  TextEditingController timeDonarController = MyTextController().timeDonarController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

  }

/*  bool areDropDownsValid(){
    return gender != "Select"
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScrol){
              overScrol.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxH(30),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      titleText: "Name",
                      controller: nameController,
                      isDense: true,
                    ),
                    sizedBoxH(15),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      titleText: "Email",
                      controller: emailController,
                      isDense: true,
                      validator: (val) {
                        // Check if this field is empty
                        if (val == null || val.isEmpty) {
                          return 'This field is required';
                        }

                        // using regular expression
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
                          return "Please enter a valid email address";
                        }

                        if (!RegExp(r'@gmail\.com').hasMatch(val)) {
                          return "Please enter a valid email address";
                        }

                        // the email is valid
                        return null;
                      },
                    ),
                    sizedBoxH(15),
                    CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      titleText: "Phone Number",
                      controller: phoneController,
                      enabled: false,
                      isDense: true,
                    ),
                    sizedBoxH(15),
                    Row(
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
                      controller: timeDonarController,
                    ),
                    sizedBoxH(25),
                    const Text("Permanent Address :", style: latoBold16),
                    sizedBoxH(15),
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
                        if(formKey.currentState!.validate()){
                          if(gender == "Select"
                              || group == "Select"
                              || division == "Select"
                              || district == "Select"
                              || upozilas == "Select"){
                            showFailedToast("Drop Down Field is required!");
                          } else{
                            await AuthRepo.reqSignUp(
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
                            nameController.clear();
                            emailController.clear();
                            phoneController.clear();
                            passController.clear();
                            birthDateController.clear();
                            lastDateController.clear();
                            timeDonarController.clear();
                          }

                        } else{
                          showFailedToast("Field is required!");
                        }
                      },
                      title: "Registration",
                    ),
                    sizedBoxH(20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
