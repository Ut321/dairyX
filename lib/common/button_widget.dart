import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key,required this.onPressed, this.width = double.infinity,required this.buttonText,this.buttonColor = Colors.green,this.textColor = Colors.black});
  VoidCallback onPressed;
  double width;
  Color buttonColor;
  String buttonText;
  Color textColor;
   

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        
                  onPressed: onPressed,
                  child:   Text(buttonText,style: TextStyle(color: textColor),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
    );
  }
}