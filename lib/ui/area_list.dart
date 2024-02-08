import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tst_app2/service/repositories.dart';
import 'package:tst_app2/ui/oultet_list_.dart';
import 'package:tst_app2/utils/constants.dart';
import 'package:tst_app2/utils/theme.dart';

class AreaListScreen extends StatefulWidget {
  const AreaListScreen({Key? key}) : super(key: key);

  @override
  State<AreaListScreen> createState() => _AreaListScreenState();
}

class _AreaListScreenState extends State<AreaListScreen> {
  List areaList = [];
  Map<String, bool> checklist = {};

  @override
  void initState() {
    super.initState();
    homeColorNav = mainColor;
  }

  Future<void> getAreaList() async {
    Map<String, dynamic> responseData = await Repositories().getAreaList(
        "https://my.transcombd.com/smart_api_uat/area/index", "SMART", "IT22", "1234","v1.0-20240203-1","6269");
    areaList = responseData["ret_str"]["area_list"];

    Map<String, dynamic> todayBeatList = await Repositories().getAReWiseList(
        "https://my.transcombd.com/smart_api","SMART", "IT22", "1234", "2024-01-28","v1.0-20240203-1","6269");
    String beatId = todayBeatList["ret_str"]["visit_plan"]["beat_id"];
    for (String location in areaList) {
      checklist[location] = false;
      if (location.startsWith(beatId)) {
        checklist[location] = true;
        print("Found: $location");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Area Screen ",
          style: GoogleFonts.inter(color: white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<void>(
        future: getAreaList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return  Center(
                child : CircularProgressIndicator(color: mainColor),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return  Text(snapshot.error.toString());
              } else {
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: ListView.builder(
                            itemCount: areaList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                       color: checklist[areaList[index]] == true
                                        ? mainShadeColorNow
                                        : Colors.transparent,
                                        borderRadius: BorderRadius.circular(5)

                                    ),
                                    
                                   
                                    child: CheckboxListTile(
                                      checkColor: white,
                                      activeColor: mainColor,
                                      title: Text(areaList[index]
                                          .toString()
                                          .substring(
                                              areaList[index].toString().indexOf("|") +
                                                  1)),
                                      value: checklist[areaList[index]],
                                      onChanged: (value) {
                                        setState(() {
                                          checklist[areaList[index]] = value!;
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
                      //const Spacer(),
           SizedBox(
               width: MediaQuery.of(context).size.width/1.2,
               height: 320, // Set the desired height
               child: Image.asset(
                      "assets/icons/stock.jpg",
                      fit: BoxFit.cover, // Choose the BoxFit that suits your needs
               ),
           )
                      //  Center(child: Opacity(
                      //    opacity: 1, 
                      //   child: 
                      //   Image.asset("assets/icons/stock.jpg",height: 450,)
                      //   )),
                      // Expanded(
                        
                      //   child: SizedBox(
                      //   child: Image.asset("assets/icons/area.png",height: 400,),
                      // ))
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           (MaterialPageRoute(
                      //               builder: (context) => const Syncpage())));
                      //     },
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Container(
                      //         height: 50,
                      //         width: 150,
                      //         decoration: BoxDecoration(
                      //             color: mainColor,
                      //             borderRadius: BorderRadius.circular(10)),
                      //         child: Center(
                      //             child: Text(
                      //           "Next",
                      //           style: TextStyle(fontSize: 16, color: white),
                      //         )),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                );
              }

            default:
              return Text('Unhandle State');
          }
        },
      ),
      floatingActionButton:FloatingActionButton.extended(
        backgroundColor: mainColor,
    
        label:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Start",style: TextStyle(color: white),),
        ),
        onPressed: (){
        Navigator.push(
                                context,
                                (MaterialPageRoute(
                                    builder: (context) => CutomerListScreen(fromScreenName: 'Home',))));
        }) ,
    );
  }
}