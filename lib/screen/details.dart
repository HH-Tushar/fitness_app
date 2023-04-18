import 'package:fitness_app/model.dart';
import 'package:fitness_app/screen/practiceScreen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DetailsScreen extends StatefulWidget {
  ExercisesModel detailsData;
  DetailsScreen({Key? key, required this.detailsData}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int second=5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.detailsData.title}"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 40),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("${widget.detailsData.image}"),fit: BoxFit.cover)),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.transparent.withOpacity(0.3)),
                child: SleekCircularSlider(
                  min: 0,
                  max: 70,
                  initialValue: 5,
                  onChange: (double value) {
                    setState(() {
                      second=value.toInt();
                    });
                    // callback providing a value while its being changed (with a pan gesture)
                  },
                  // onChangeStart: (double startValue) {
                  //   // callback providing a starting value (when a pan gesture starts)
                  // },
                  // onChangeEnd: (double endValue) {
                  //   // ucallback providing an ending value (when a pan gesture ends)
                  // },
                  innerWidget: (double value) {
                    return Center(child: Text(second.toStringAsFixed(0),style: const TextStyle(
                        fontSize: 40,color: Colors.orange,fontWeight: FontWeight.w300),));
                    // use your custom widget inside the slider (gets a slider value from the callback)
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>PracticeScreen(gifUrl: '${widget.detailsData.gif}', second: second, Title: '${widget.detailsData.title}',)));
                },
                child: Text("Start Practice"),
              )
            ],
          )),
    );
  }
}
