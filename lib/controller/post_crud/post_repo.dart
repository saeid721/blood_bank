
import 'dart:developer';
import 'package:blood_bank/controller/auth_crud/auth_model.dart';
import 'package:blood_bank/controller/auth_crud/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../global/methods/show_toast.dart';
import 'post_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _postCollectionRef = _firestore.collection('post');

class PostRepo{
  static Future<Response> postCreate({
    String? patientProblem,
    String? bloodVolume,
    String? donationDate,
    String? donationTime,
    String? patientGender,
    String? patientBloodGroup,
    String? hemoglobin,
    String? location,
    String? mobileNo,
    String? referenceMblNo,

  }) async{
    Response response = Response();
    // String? phone = FirebaseAuth.instance.currentUser!.phoneNumber;
    UserModel? userModel = await AuthRepo.fetchUserInfo();

    Map<String, dynamic> params = {};
    params['name'] = userModel!.name;
    params['phone'] = userModel.phone;
    params['patient_problem'] = patientProblem;
    params['blood_amount'] = bloodVolume;
    params['donation_date'] = donationDate;
    params['donation_time'] = donationTime;
    params['patient_gender'] = patientGender;
    params['patient_blood_group'] = patientBloodGroup;
    params['hemoglobin'] = hemoglobin;
    params['location'] = location;
    params['mobileNo'] = mobileNo;
    params['referenceMblNo'] = referenceMblNo;
    params['img_url'] = userModel.image;

    try{
      DocumentReference newPostRef = await _postCollectionRef.add(params);

      response.statusCode = 200;
      response.data = {'postId': newPostRef.id};
      showSuccessToast("Post Upload");
      PostModel postModel = PostModel(
        name: userModel.name,
        phone: userModel.phone,
        patientProblem: patientProblem,
        bloodAmount: bloodVolume,
        donationDate: donationDate,
        donationTime: donationTime,
        patientGender: patientGender,
        patientBloodGroup: patientBloodGroup,
        hemoglobin: hemoglobin,
        location: location,
        mobileNo: mobileNo,
        referenceMblNo: referenceMblNo,
        img: userModel.image
      );
      log("==@PostModel: $postModel");
    } catch(error){
      response.statusCode == 500;
      showFailedToast("Post Upload Failed");
    }
    return response;
  }

  static Future<List<PostModel>> fetchPostInfo() async{
    List<PostModel> posts = [];
    try{
      QuerySnapshot querySnapshot = await _postCollectionRef.get();

      for(QueryDocumentSnapshot document in querySnapshot.docs){
        Map<String, dynamic> params = document.data() as Map<String, dynamic>;
        PostModel postModel = PostModel(
          id: document.id,
          name: params['name'],
          phone: params['phone'],
          patientProblem: params['patient_problem'],
          bloodAmount: params['blood_amount'],
          donationDate: params['donation_date'],
          donationTime: params['donation_time'],
          patientGender: params['patient_gender'],
          patientBloodGroup: params['patient_blood_group'],
          hemoglobin: params['hemoglobin'],
          location: params['location'],
          mobileNo: params['mobileNo'],
          referenceMblNo: params['referenceMblNo'],
          img: params['img_url'],
        );
        log("==@ Img Data: ${postModel.img}");
        log("==@ Name Data: ${postModel.name}");
        posts.add(postModel);
        log("==@ Posts Data: $posts");
      }
    } catch(error){
      log("Error fetching posts: $posts");
    }
    return posts;
  }

}

