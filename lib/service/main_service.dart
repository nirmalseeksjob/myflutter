import 'dart:io';

import 'package:sfframework/constant/api_url.dart';

import '../helper/jwt-Interceptor.dart';

import 'package:dio/dio.dart';

import 'hive_service.dart';

final hiveService = HiveService();

class MainService {
  // Future<CalleeModel> getUserCallees() async {
  //   Dio dio = new Dio();
  //   try {
  //     Response response = await dio.get(Home_User_Callees);

  //     ///print(response.data);
  //     return CalleeModel.fromJson(response.data);
  //   } on DioError catch (e) {
  //     // return e.response.data;
  //     return null;
  //   }
  // }

  Future getAllPackage() async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get(Package_Info);

      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future userbrowse(var param) async {
    Dio dio = new Dio();
    try {
      Response response = await dio.post(User_Browse, data: param);

      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future userActivity(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(User_Av_Charge, data: param);

      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future notifications() async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get(Home_Notification);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future homeLocations() async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get(HOME_LOCATION);

      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future homePertialsItem() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(HOME_PARTIALS_ITEM_URL);

      hiveService.setData("NotiCount", response.data["NotiCount"].toString());

      hiveService.setData("CartCount", response.data["CartCount"].toString());

      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future homeItem() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(HOME_ITEM_URL);
      // if (response.data["NotiCount"] != null) {

      ///  hiveService.setData("NotiCount", response.data["NotiCount"]);
      // }
      //if (response.data["CartCount"] != null) {
      //  hiveService.setData("CartCount", response.data["CartCount"]);
      // }
      return response.data;
    } on DioError catch (e) {
      // print(e.response.data);
      return null;
    }
  }

  Future activity(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Home_Activity, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future addReview(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Service_Add_Review, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future hometserviceList(var param) async {
    Dio dio = new Dio();
    try {
      Response response = await dio.post(Home_Trending_Services, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future pushnotification() async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get(Home_Push_Notification);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future hometbestserviceList(var param) async {
    Dio dio = new Dio();
    try {
      Response response = await dio.post(Home_Best_Services, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future servicebrowse(var param) async {
    Dio dio = new Dio();
    try {
      Response response = await dio.post(Service_Browse, data: param);

      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future servicecategory(var param) async {
    Dio dio = new Dio();
    try {
      Response response = await dio.post(Service_Category, data: param);

      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future shoppingcart() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(Manage_Cart);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future shoppingcartcheckout() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(Manage_Checkout);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future shoppingcheckoutbook(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Manage_Checkout_Book, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future chatList(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(User_Chats, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future shoppingcheckoutonlinebook(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response =
          await dio.post(Manage_Checkout_Online_Book, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future addeditaddress(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Manage_AddEditAddress, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future favlist() async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get(Manage_Fav);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future myprofile() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(Manage_MyProfile);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future savemyprofile(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Manage_MyProfile_Update, data: param);
      // Response response = await dio.post(Manage_MyProfile_Update,
      //     data: param,
      //     options: Options(
      //         method: 'POST',
      //         responseType: ResponseType.json //ResponseType.PLAIN // or
      //         ));
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future changesetting() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(Manage_Setting);

      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future savesetting(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Manage_Save_Setting, data: param);

      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future changepassword(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response =
          await dio.post(Manage_MyProfile_ChangePassword, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future savemyprofileimage(var param) async {
    Dio dio = await tokenDio();

    try {
      Response response = await dio.post(Manage_MyProfile_Image,
          data: param, options: Options(contentType: 'multipart/form-data'));

      return response.data;
    } on DioError catch (e) {
      return null;
    }
  }

  Future mybook() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(Manage_Book);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future mybookcancel(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Manage_Book_Cancel + "?id=" + param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future shoppingcartdelete(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Manage_Cart_Delete + "?id=" + param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future shoppingcartupdate(var id, var q) async {
    Dio dio = await tokenDio();
    try {
      Response response =
          await dio.post(Manage_Cart_Update + "?id=" + id + "&q=" + q);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future favdelete(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Manage_Fav_Delete + "?id=" + param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future activitytest(int id, String sc, String n, String a) async {
    Dio dio = new Dio();
    try {
      Response response = await dio.get(Home_Activity +
          "?Id=" +
          id.toString() +
          "&ServiceContext=" +
          sc +
          "&Nature=" +
          n +
          "&Activity=" +
          a);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future logout() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(Account_Logout);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future forgot(var param) async {
    Dio dio = new Dio();
    try {
      Response response = await dio.post(Account_Forgot, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future allCategory() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(ALL_CATEGORY_URL);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future getServices(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(SERVICES_URL, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future professionalList(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.post(PROFESSIONAL_LIST_URL, data: param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future professionalDetail(var param) async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(Service_Detail + "?id=" + param);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future getServiceSuggesion(var param, var city) async {
    Dio dio = new Dio();
    try {
      Response response =
          await dio.get(Service_Suggesion + "?q=" + param + "&c=" + city);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }

  Future addressAutoComplete(String keyword) async {
    String googleUri =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${keyword}&types=address&key=AIzaSyDkbe67PXV-OrjRrl0g1RV7BfqlVgPmMR0';
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(googleUri);
      print(response.data['predictions']);
      return response.data['predictions'];
    } on DioError catch (e) {
      return e.response.data;
    }
  }

  Future walletBalance() async {
    Dio dio = await tokenDio();
    try {
      Response response = await dio.get(User_Wallet);
      //  print(response.data);
      return response.data;
    } on DioError catch (e) {
      // return e.response.data;
      return null;
    }
  }
}
