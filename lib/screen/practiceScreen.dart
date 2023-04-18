import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class PracticeScreen extends StatefulWidget {
  String gifUrl;
  String Title;
  int second;
   PracticeScreen({Key? key,required this.gifUrl,required this.Title,required this.second}) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  late int startTime=widget.second;
  bool _start=false;
  bool isDone = false;
  showDia(){
    return showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Text("Time Over"),
        content: Text("Your ${widget.second} Second's Task Completed"),
        actions: [
          MaterialButton(
              child: Text('Try Another'),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);

              }),
          MaterialButton(
              child: const Text("Repeat it"),
              onPressed: (){
                _start=false;
                startTime=widget.second;
                count();
                Navigator.pop(context);

              })
        ],
      );
    });
  }
  count(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(timer.tick-1==widget.second){
        timer.cancel();
        _start=false;
        showDia();
        setState(() {

        });

      }

      else{
        setState(() {
          //startTime=timer.tick;
          startTime--;
        });
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(title: Text("${widget.Title}"),),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                fadeInCurve: Curves.bounceIn,
                cacheKey: "${widget.Title}",
                height: MediaQuery.of(context).size.height*0.6,
                width: double.infinity,
                imageUrl:widget.gifUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(
                        color: Colors.blueGrey,
                        backgroundColor: Colors.orange,
                        value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height*0.6,
            //   child:Image.network(widget.gifUrl,fit: BoxFit.cover,),),
            SizedBox(height: 20),

            Text("Duration : ${widget.second} Seconds",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            SizedBox(height: 10),
            Text("Remaining : $startTime Seconds",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
            SizedBox(height: 20),
            MaterialButton(
              color: Colors.orange,
              onPressed: (){
                if(_start==false){
                  startTime=widget.second;
                  count();
                  _start=true;
                }
                },child: Text("Start Now"),)
      ]),
    );
  }
}
