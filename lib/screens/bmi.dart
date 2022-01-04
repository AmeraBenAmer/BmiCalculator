import 'dart:math';

import 'package:bmicalculator/screens/cubit/cubit.dart';
import 'package:bmicalculator/screens/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmiResult.dart';

enum Gender { male, female }

class BmiScreen extends StatelessWidget {
  // const BmiScreen({Key? key}) : super(key: key);

  late Gender selectedGender;

  BmiScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = "CALCULATE";
    return BlocProvider(
        create: (BuildContext context) => BMICubit(),
        child: BlocConsumer<BMICubit, BMIState>(listener: (context, state) {
          if (state is BMIInitialState) print("BMIInitialState");
          if (state is AddAgeState) print("AddAgeState");
          if (state is MinusAgeState) print("MinusAgeState");
        }, builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('BMI calculator'),
            ),
            body: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            BMICubit.get(context).isMaleValue(true);
                            // setState(() {
                            //   isMale = true;
                            // });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: BMICubit.get(context).isMale
                                    ? Colors.blue
                                    : Colors.grey[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('images/male.png'),
                                  height: 80.0,
                                  width: 80.0,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "MALE",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            BMICubit.get(context).isMaleValue(false);
                            // setState(() {
                            //   isMale = false;
                            // });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: !BMICubit.get(context).isMale
                                    ? Colors.blue
                                    : Colors.grey[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('images/female.png'),
                                  height: 80.0,
                                  width: 80.0,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "FEMALE",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "${BMICubit.get(context).height.round()}",
                              style: const TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Text(
                              "cm",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Slider(
                            value: BMICubit.get(context).height,
                            max: 220.0,
                            min: 80.0,
                            onChanged: (value) {
                              BMICubit.get(context).chageHeightValue(value);
                              // setState(() {
                              //   ;
                              // });
                            }),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[400],
                    ),
                  ),
                )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Weight",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${BMICubit.get(context).wieght}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      heroTag: "btnMunis",
                                      onPressed: () {
                                        BMICubit.get(context).minusWieght();
                                        // setState(() {
                                        //   weight--;
                                        // });
                                      },
                                      mini: true,
                                      child: const Icon(Icons.remove),
                                    ),
                                    FloatingActionButton(
                                      heroTag: "btnAdd",
                                      onPressed: () {
                                        BMICubit.get(context).addWieght();
                                        // setState(() {
                                        //   weight++;
                                        // });
                                      },
                                      mini: true,
                                      child: const Icon(Icons.add),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[400]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "age",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${BMICubit.get(context).age}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      heroTag: "btnAgeMunis",
                                      onPressed: () {
                                        BMICubit.get(context).minusAge();
                                        // setState(() {
                                        //   age--;
                                        // });
                                      },
                                      mini: true,
                                      child: const Icon(Icons.remove),
                                    ),
                                    FloatingActionButton(
                                      heroTag: "btnAgeMunis",
                                      onPressed: () {
                                        BMICubit.get(context).addAge();
                                        // setState(() {
                                        //   age++;
                                        // });
                                      },
                                      mini: true,
                                      child: const Icon(Icons.add),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: MaterialButton(
                    height: 50.0,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'RESULT',
                          style: TextStyle(
                            color: Color(0xffBFC1C6),
                          ),
                        ),
                        content: Text(
                            "${BMICubit.get(context).getResult().round()}"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // onPressed: () {

                    // double result = BMICubit.get(context).wieght /
                    //     pow(BMICubit.get(context).height / 100, 2);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (_context) => BMIResultScreen(
                    //             isMale: BMICubit.get(context).isMale,
                    //             result: result,
                    //             age: BMICubit.get(context).age,
                    //           )),
                    //   // builder: (context) => Scaffold(
                    //   //       body: Container(
                    //   //         child: Text("Test"),
                    //   //       ),
                    //   //     )),
                    //   );
                    // },
                    child: Text(
                      data,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}

// class _BmiScreenState extends State<BmiScreen> {
 
//   @override
//   Widget build(BuildContext context) {
//     var data = "CALCULATE";
//     return BlocProvider(create: BMICubit,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('BMI calculator'),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//                 child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isMale = true;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: isMale ? Colors.blue : Colors.grey[400]),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Icon(
//                               Icons.ac_unit,
//                               size: 70,
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Text(
//                               "MALE",
//                               style: TextStyle(
//                                   fontSize: 25, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20.0,
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isMale = false;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: !isMale ? Colors.blue : Colors.grey[400]),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Icon(
//                               Icons.ac_unit,
//                               size: 70,
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Text(
//                               "FEMALE",
//                               style: TextStyle(
//                                   fontSize: 25, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//             Expanded(
//                 child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "HEIGHT",
//                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(
//                       height: 5.0,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.baseline,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       textBaseline: TextBaseline.alphabetic,
//                       children: [
//                         Text(
//                           "${height.round()}",
//                           style: const TextStyle(
//                               fontSize: 35, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           width: 5.0,
//                         ),
//                         const Text(
//                           "cm",
//                           style: TextStyle(
//                               fontSize: 20.0, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     Slider(
//                         value: height,
//                         max: 220.0,
//                         min: 80.0,
//                         onChanged: (value) {
//                           setState(() {
//                             height = value;
//                           });
//                         }),
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Colors.grey[400],
//                 ),
//               ),
//             )),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: Colors.grey[400]),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "Weight",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "$weight",
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 FloatingActionButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       weight--;
//                                     });
//                                   },
//                                   mini: true,
//                                   child: const Icon(Icons.remove),
//                                 ),
//                                 FloatingActionButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       weight++;
//                                     });
//                                   },
//                                   mini: true,
//                                   child: const Icon(Icons.add),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20.0,
//                     ),
//                     Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: Colors.grey[400]),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "age",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "$age",
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 FloatingActionButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       age--;
//                                     });
//                                   },
//                                   mini: true,
//                                   child: const Icon(Icons.remove),
//                                 ),
//                                 FloatingActionButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       age++;
//                                     });
//                                   },
//                                   mini: true,
//                                   child: const Icon(Icons.add),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               color: Colors.black,
//               child: MaterialButton(
//                 height: 50.0,
//                 onPressed: () {
//                   double result = weight / pow(height / 100, 2);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => BMIResultScreen(
//                               isMale: isMale,
//                               result: result,
//                               age: age,
//                             )),
//                   );
//                 },
//                 child: Text(
//                   data,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
  
//   }
// }
