import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_blocc/logic/home_bloc_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    var homeBloc = BlocProvider.of<HomeBlocCubit>(context);
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            child: BlocBuilder<HomeBlocCubit, HomeBlocState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(homeBloc.x.toString(),style: TextStyle(fontSize: 30),),
                    SizedBox(height: 20,),
                    Text(homeBloc.y.toString(),style: TextStyle(fontSize: 30),),
                    SizedBox(height: 20,),
                    homeBloc.load?
                    Center(child: CircularProgressIndicator()):Text(homeBloc.userModel?.name ??"company",style: TextStyle(fontSize: 30),),

                  ],
                );
              },
            ),

          ),
        ),

      ],
    ),floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(onPressed: () {
          homeBloc.increseX();
        },),
        FloatingActionButton(onPressed: () {
          homeBloc.decreseX();
        },),
        SizedBox(height: 30,),
        FloatingActionButton(onPressed: () {
          homeBloc.incresey();
        },),
        FloatingActionButton(onPressed: () {
          homeBloc.decresey();
        },),
        SizedBox(height: 30,),
        FloatingActionButton(onPressed: () {
          homeBloc.callUsers();
        },),
      ],
    ),);
  }
}
