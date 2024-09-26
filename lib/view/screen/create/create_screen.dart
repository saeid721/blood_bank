import 'package:blood_bank/controller/post_crud/post_repo.dart';
import 'package:blood_bank/global/constants/datetime_formatter.dart';
import 'package:flutter/material.dart';
import '../../../controller/my_text_controller.dart';
import '../../../global/methods/button.dart';
import '../../../global/methods/show_datetime_picker.dart';
import '../../../global/methods/sizedbox_widget.dart';
import '../../../global/widget/dropdown_formfield.dart';
import '../../../global/widget/text_field.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  TextEditingController patientProblemsCon = MyTextController().patientProblemsCon;
  TextEditingController bloodVolumeCon = MyTextController().bloodVolumeCon;
  TextEditingController donationDateCon = MyTextController().donationDateCon;
  TextEditingController donationTimeCon = MyTextController().donationTimeCon;
  TextEditingController locationCon = MyTextController().locationOfBloodDonationCon;
  TextEditingController mobileNoCon = MyTextController().mobileNoCon;
  TextEditingController referenceMobileNoCon = MyTextController().referenceMobileNoCon;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxH(40),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    titleText: "Patient Problems :",
                    controller: patientProblemsCon,
                    hintText: "What is the patient's problem?",
                    isDense: true,
                  ),
                  sizedBoxH(10),
                  CustomTextFormField(
                    keyboardType: TextInputType.phone,
                    titleText: "Blood Amount :",
                    hintText: "How many bags of blood does the patient need?",
                    controller: bloodVolumeCon,
                    isDense: true,
                  ),
                  sizedBoxH(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: donationDateCon,
                          keyboardType: TextInputType.phone,
                          titleText: "Date of Blood Donation :",
                          hintText: "dd/MM/yyyy",
                          isDense: true,
                          sufixIcon: IconButton(
                            onPressed: () async{
                              var pickedDate = await showDateOnlyPicker(context);
                              setState(() {
                                String formatedDate = DateTimeFormatter.showDateOnly.format(pickedDate);
                                donationDateCon.text = formatedDate;
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
                          controller: donationTimeCon,
                          keyboardType: TextInputType.phone,
                          titleText: "Time of Blood Donation :",
                          hintText: "dd/MM/yyyy",
                          isDense: true,
                          sufixIcon: IconButton(
                            onPressed: () async{
                              var pickedDate = await showDateOnlyPicker(context);
                              setState(() {
                                String formatedDate = DateTimeFormatter.showDateOnly.format(pickedDate);
                                donationTimeCon.text = formatedDate;
                              });
                            },
                            icon: const Icon(Icons.calendar_month,
                                color: Colors.red
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                  sizedBoxH(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomDropDownFormField(
                          titleText: "Gender :",
                          value: patientGender,
                          isDense: true,
                          items: const [
                            "Select",
                            "Male",
                            "Female",
                          ],
                          onChanged: (value) {
                            setState(() {
                              patientGender = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomDropDownFormField(
                          titleText: "Blood Group :",
                          value: patientBloodGroup,
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
                          onChanged: (value) {
                            setState(() {
                              patientBloodGroup = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  sizedBoxH(10),
                  CustomDropDownFormField(
                    titleText: "Hemoglobin :",
                    value: hemoglobin,
                    isDense: true,
                    items: const [
                      "Select",
                      "0",
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                      "6",
                      "7",
                      "8",
                      "9",
                    ],
                    onChanged: (value) {
                      setState(() {
                        hemoglobin = value!;
                      });
                    },
                  ),
                  sizedBoxH(10),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    titleText: "Location of Blood Donation :",
                    controller: locationCon,
                  ),
                  sizedBoxH(10),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    titleText: "Mobile No. :",
                    hintText: "01*********",
                    controller: mobileNoCon,
                  ),
                  sizedBoxH(10),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    titleText: "Reference Mobile No. :",
                    hintText: "01*********",
                    controller: referenceMobileNoCon,
                  ),
                  const SizedBox(height: 40,),
                  CustomButtonWidget(
                    onTap: () async {
                      await PostRepo.postCreate(
                          patientProblem: patientProblemsCon.text.trim(),
                          bloodVolume: bloodVolumeCon.text.trim(),
                          donationDate: donationDateCon.text.trim(),
                          donationTime: donationTimeCon.text.trim(),
                          patientGender: patientGender,
                          patientBloodGroup: patientBloodGroup,
                          hemoglobin: hemoglobin,
                          location: locationCon.text.trim(),
                          mobileNo: mobileNoCon.text.trim(),
                          referenceMblNo: referenceMobileNoCon.text.trim()
                      );
                      patientProblemsCon.clear();
                      bloodVolumeCon.clear();
                      donationDateCon.clear();
                      donationTimeCon.clear();
                      locationCon.clear();
                      mobileNoCon.text.trim();
                      referenceMobileNoCon.text.trim();
                    },
                    title: "Post Submit",
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
