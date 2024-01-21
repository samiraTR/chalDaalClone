import 'package:flutter/material.dart';
import 'package:tst_app2/service/all_services.dart';
import 'package:tst_app2/service/repositories.dart';
import 'package:tst_app2/utils/theme.dart';

class AreaListScreen extends StatefulWidget {
  const AreaListScreen({super.key});

  @override
  State<AreaListScreen> createState() => _AreaListScreenState();
}

class _AreaListScreenState extends State<AreaListScreen> {
  List areaList=[];
  Map<String, bool> checklist = {};
  
  @override
  void initState() {
    getAreaList(); 
    super.initState();

  }

  getAreaList() async {
  Map<String, dynamic> responseData = await Repositories().getAreaList(
      "https://my.transcombd.com/smart_api", "SMART", "IT19", "8899");
  areaList = responseData["ret_str"]["area_list"];

  Map<String, dynamic> todayBeatList = await Repositories().getAReWiseList(
      "https://my.transcombd.com/smart_api",
      "SMART",
      "IT19",
      "8899",
      "2023-12-14");
  String beatId = todayBeatList["ret_str"]["visit_plan"]["beat_id"];
  if(responseData!={} && beatId.isNotEmpty ){
    for (String location in areaList) {
    checklist[location] = false;
    if (location.startsWith(beatId)) {
      checklist[location] = true;
    }
    }
  }
  else{
    AllServices().dynamicToastMessage("No Area found", Colors.red, white, 16);
  }
  
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("Area Screen ",style: TextStyle(
          color: white
        ),),
        centerTitle: true,
      ),
      body:Padding(
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
                        color:checklist[areaList[index]]==true? mainShadeColorNow :Colors.transparent,
                        child: CheckboxListTile(
                          checkColor: white,
                          activeColor: mainColor,
                          title: Text(areaList[index]),
                          value: checklist[areaList[index]] ,
                          onChanged: (value) {
                            setState(() {
                              checklist[areaList[index]] = value!;
                            });
                          },
                        ),
                      ),
                     const Divider(height: 3,)
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
                  
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,width: 150,
                    decoration: BoxDecoration(
                      color: mainColor,borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("Next",style: TextStyle(fontSize: 16,color: white),)),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}