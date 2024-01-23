import 'package:flutter/material.dart';
import 'package:tst_app2/ui/all_product_list.dart';
import 'package:tst_app2/ui/customer_list.dart';
import 'package:tst_app2/ui/pageControllers.dart';
import 'package:tst_app2/utils/theme.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  Map<String, bool> checklist = {};
  // List<String> questions = [
  //   'আপনি কি স্টক কাউন্ট করেছেন ?',
  //   'আপনি কি কোনো পরিবর্তন করেছেন ?',
  //   'আপনি কি স্টক কাউন্ট সম্পূর্ণ করেছেন ?',
  // ];
    List<String> questions = [
    'Did you perform a stock count?',
    'Did you perform merchandising operations?',
    'Promo SKU(s)',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Questions ",
          style: TextStyle(color: white),
        ),
        centerTitle: true,
        actions: [ 
          GestureDetector(
            onTap: (() {
              for(int i=0; i<questions.length;i++){
                checklist[questions[i]] =true;
              }
          setState(() {
            
          });
                   

                                     
              
              
            }),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/icons/select_all.png",color: white,),
            ),
          )

        ],
      ),
      body:
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
            children: [


              Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            color: checklist[questions[index]] == true
                                ? mainShadeColorNow
                                : Colors.transparent,
                            child: CheckboxListTile(
                              checkColor: white,
                              activeColor: mainColor,
                              title: Text(questions[index].toString()
                                
                                  ),
                              value: checklist[questions[index]]?? false,
                              onChanged: (value) {
                                setState(() {
                                  checklist[questions[index]] = value!;
                                });
                              },
                            ),
                          ),
                          const Divider(
                            height: 3,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(
                            builder: (context) => PageControllerScreen(bottomNav: 1))));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "Next",
                        style: TextStyle(fontSize: 16, color: white),
                      )),
                    ),
                  ),
                ),
              )
            ],
                 ),
         ),
     

    );
  }
}