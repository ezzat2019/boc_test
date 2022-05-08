import 'dart:developer';

import 'package:test_blocc/data/end_point/api.dart';
import 'package:test_blocc/data/models/user_model.dart';
import 'package:test_blocc/helper/const.dart';

class HomeRepo{
 static Future<UserModel?> getUsers()
  async{

    var res=await Api().callApi(path:USER_URL+"/1",method: GET_METHOD);
    if(res!=null){
      log(res.toString());
      UserModel list=UserModel.fromJson(res.data);
      return list;
    }else
      {
        return null;
      }

  }
}