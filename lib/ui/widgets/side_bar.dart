import 'package:flutter/material.dart';
import 'package:tst_app2/themes/theme.dart';

class SideBarWidget extends StatefulWidget {
  String image;
  String barName;
  int indexNum;
  final List<bool> tappedStates; 
  final Function(int, List<bool>)? onTap;

  SideBarWidget(
    
    {
    Key? key,
    required this.image,
    required this.barName,
    required this.indexNum,
    required this.onTap,
    required this.tappedStates,

  }) : super(key: key);

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
   bool isTapped = false;
   Color? onTapColor;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;
    return InkWell(
    onTap: () {
            setState(() {
              for (int i = 0; i < widget.tappedStates.length; i++) {
                if (i == widget.indexNum) {
                  widget.tappedStates[i] = !widget.tappedStates[i];
                } else {
                  widget.tappedStates[i] = false;
                }
              }
              widget.onTap?.call(widget.indexNum, widget.tappedStates);
            });
          },  
   
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
        child: Container(
          height: 60,
          width: 140,
          decoration: BoxDecoration(
            color: widget.tappedStates[widget.indexNum] ? getColorForIndex() : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: widget.tappedStates[widget.indexNum] ? Colors.transparent : const Color.fromARGB(255, 209, 204, 204),
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.green,
                    child: Image.asset(
                      widget.image,
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Center(
                  child: Text(
                    widget.barName,
                    style: textTheme.titleSmall?.copyWith(color: cOLORBlack),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

    Color getColorForIndex() {
    List<Color> colors = [
      Color(0xffFED93E),
      Colors.blue,
      Colors.teal,
    ];

    return colors[widget.indexNum % colors.length];
  }

}
