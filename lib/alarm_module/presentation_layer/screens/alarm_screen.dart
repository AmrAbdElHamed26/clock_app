import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/shared/custom_colors.dart';
class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 030, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alarm",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * .05),
              ),
              SizedBox(
                height: screenHeight * .13,
              ),
              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 32 , right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    width: double.infinity,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: GradientColors.sea,
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                     boxShadow: [
                       BoxShadow(
                         color: GradientColors.sea.last.withOpacity(0.2),
                         blurRadius: 5,
                         spreadRadius: 3,
                         offset: Offset(1,1),
                       ),
                     ],
                     borderRadius: BorderRadius.all(Radius.circular(24)),
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [


                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             Icon(Icons.article_outlined , color: Colors.white,size: screenWidth*.03,),
                             SizedBox(width: screenHeight*.01,),
                             Text("Office" , style: TextStyle(color: Colors.white , fontSize: screenWidth*.03),),
                           ],
                         ),
                         Switch(value: true, onChanged: (bool value){} , activeColor: Colors.white,)
                       ],
                     ),
SizedBox(height: screenHeight * .00001,),
                     Text("Monday" , style: TextStyle(color: Colors.white , fontSize: screenWidth * .03 ),),
                       SizedBox(height: screenHeight * .02,),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("06:00" , style: TextStyle(color: Colors.white , fontSize: screenWidth * .08 , fontWeight: FontWeight.bold ),),
                           IconButton(onPressed: (){}, icon:Icon( Icons.expand_circle_down , color: Colors.white,size: screenWidth * .06,)),
                         ],
                       ),


                     ],),
                  ),
                );
              },
                itemCount: 100,
              ))
            ],
          ),
        ));
  }
}
