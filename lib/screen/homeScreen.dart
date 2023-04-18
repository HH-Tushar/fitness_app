import 'dart:convert';

import 'package:fitness_app/model.dart';
import 'package:fitness_app/screen/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'landingScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String url= "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR1s0681ePa8Rr6o_MM04G4Hnpp8MlweW4DKO-SOawqKbIB2nlR98cBzpT8";

  fetchData() async{
    var response=await http.get(Uri.parse(url));
    var responseBody=jsonDecode(response.body);
    for(var i in responseBody["exercises"]){
      exercisesModel = ExercisesModel(
        title: i["title"],
        image: i["thumbnail"],
        id: i["id"],
        gif: i["gif"],
      );
      setState(() {
        exercisesDataList.add(exercisesModel!);
      });

    }
  }
@override
  void initState() {
  fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return exercisesDataList.length==null? const LandingScreen():
    Scaffold(
      appBar: AppBar(title: Text("Fitness Today"),centerTitle: true,
        elevation: 0.0,
        bottomOpacity: 0,
      ),
      body: ListView.builder(
        padding:const EdgeInsets.symmetric(horizontal: 10),
          itemCount: exercisesDataList.length,
          itemBuilder: (_,index)=>GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsScreen(detailsData:exercisesDataList[index],)));},
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20 ),
              image: DecorationImage(image: NetworkImage("${exercisesDataList[index].image}"),fit: BoxFit.cover)
              ),
              child: Container(
                alignment: AlignmentDirectional.bottomStart,
                  height: 50,
                  decoration:  const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end:  Alignment.center,

                  colors: [
                    //Colors.black,
                    Colors.black,
                    Colors.black54,
                    Colors.black12,
                    Colors.transparent

                  ]
              ),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
            ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,bottom: 15),
                    child: Text("${exercisesDataList[index].title}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                  )),
            ),
          ),
      )
    );
  }
}
