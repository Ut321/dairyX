import 'package:flutter/material.dart';

class SuccessfulWidget extends StatelessWidget {
   SuccessfulWidget({super.key, required this.title, required this.onNavigate});
  final String title;
  final VoidCallback onNavigate; 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Future.delayed(const Duration(seconds: 3), onNavigate);
    
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: size.height * 0.6,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Image.asset("assets/successful_icon.png",height: size.height * 0.2,),
              const SizedBox(height: 20,),
              Text(title,style: const TextStyle(color: Color(0xff2aba67),fontSize: 20),textAlign: TextAlign.center,),
              const SizedBox(height: 20,),
              const Text("Please wait..."),
               const SizedBox(height: 10,),
              const Text("You will be directed to the homepage soon.",textAlign: TextAlign.center,),
              const SizedBox(height: 13,),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}