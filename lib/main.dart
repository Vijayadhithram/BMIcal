import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;

  String result ="" ;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          //app bar
            appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "Ninja BMI Calculator".toUpperCase(),
                  style: TextStyle(color: Colors.black),
                ),shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)              )
            ),
                elevation: 10.0,
                backgroundColor: Colors.lightBlueAccent,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.whatshot_outlined,
                        color: Colors.white,
                      ))
                ]
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(accountName: Text("Coding Ninja"),
                    accountEmail: Text("CodingNinja@gmail.com"),
                  currentAccountPicture: CircleAvatar(foregroundImage: AssetImage("iconimage.jpeg"),),)
                ],
              ),
            ),
            //creating body of the app
            //CREATING the BODY of the APP
            body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage("assets/ninjahere.jpg",),
                fit:BoxFit.fill,opacity: 0.85,
        alignment: Alignment.center,)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          radioButton("Shinobi", Colors.green, 0),
                          radioButton("Kunoichi", Colors.pink, 1),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text("Your Height in M :", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: heightController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "Your height in M",
                            filled: true,
                            fillColor: Colors.lightGreenAccent.withOpacity(0.7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      //now we are going to upload weight
                      Text("Your weight in KGs :",
                        style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: weightController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "Your weight in kgs",
                            filled: true,
                            fillColor: Color(0xffE5A188).withOpacity(0.7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      //calculator button
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        child: TextButton(
                          onPressed: () {
                            double height = double.parse(heightController.value.text);
                            double weight = double.parse(weightController.value.text);
                            calculateBmi(height, weight);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  BeveledRectangleBorder>(BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(30),))
                          ),
                          child: Text(
                            "Calculate", style: TextStyle(fontSize: 22.0),),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      //BMI button.....
                      Container(
                        width: double.infinity,
                        child: Text("Your BMI is :",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold, color: Color(0xff0EE8E8),
                          ),
                        ),
                      ),
                      //new one without text
                      SizedBox(height: 50.0,),
                      //BMI button.....
                      Container(
                        width: double.infinity,
                        child: Text("$result",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            )));
  }

  void calculateBmi(double height,double weight){
    double finalresult = weight / (height * height);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  //changing of index value
  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

//custom widget
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        //margin
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 100.0,
        decoration: ShapeDecoration(
          color: Colors.grey[200], shape: CircleBorder(),
        ),
        child: TextButton(
            child: Text(value,style: TextStyle(fontSize: 20.0),),
            style: TextButton.styleFrom(
              foregroundColor: currentindex == index ? color : Colors.grey[200],
              shape: CircleBorder(),shadowColor: Colors.green
            ),
            onPressed: () {
              changeIndex(index);
              },
        ),
      ),
    );
  }
}
