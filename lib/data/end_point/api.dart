import 'package:dio/dio.dart';
Dio? _dio;
class Api{

  final BASE_URL='https://jsonplaceholder.typicode.com';
  buildApi(){
    _dio=Dio(BaseOptions(
      baseUrl: BASE_URL
    ));

  }

  Future<Response?> callApi({ required String path, String? method,dynamic data})async{
   Response res;
    if(method==POST_METHOD)
      {
       res =await _dio!.post(path,data: data);

      }else if(method==PUT_METHOD)
        {
          res =await _dio!.put(path,data: data);
        }
    else{
      res =await _dio!.get(path,);
    }
    print(res.toString());
    if(res.statusCode==200)
      {
        return res;
      }else
        {
          return null;
        }

  }


}


final GET_METHOD="get";
final POST_METHOD="post";
final PUT_METHOD="put";