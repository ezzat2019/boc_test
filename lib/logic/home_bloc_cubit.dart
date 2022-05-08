
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_blocc/data/home_repo.dart';
import 'package:test_blocc/data/models/user_model.dart';

part 'home_bloc_state.dart';

class HomeBlocCubit extends Cubit<HomeBlocState> {
  UserModel?userModel;
  int x=0;
  int y=2;
  bool load=false;
  HomeBlocCubit() : super(HomeBlocInitial());
  void increseX(){
    x++;
    emit(HomeBlocInitial());
  }
  void decreseX(){
    x--;
    emit(HomeBlocInitial());
  }
  void incresey(){
    y++;
    emit(HomeBlocInitial());
  }
  void decresey(){
    y--;
    emit(HomeBlocInitial());
  }
  void callUsers()
  async{
    load=true;
    emit(HomeBlocInitial());
  var res=await HomeRepo.getUsers();
  y=res?.id??-20;
  userModel=res;
  load=false;
  emit(HomeBlocInitial());
  }
}
