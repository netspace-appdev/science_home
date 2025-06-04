import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:school_home/flutter_flow/flutter_flow_theme.dart';

class Splacescreen extends StatefulWidget {
  const Splacescreen({super.key});

  @override
  State<Splacescreen> createState() => _SplacescreenState();
}

class _SplacescreenState extends State<Splacescreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      context.pushReplacementNamed('HomePage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       height: MediaQuery.of(context).size.height * 0.9, // 90% of the screen height
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/splash.jpg',
          ).image,
        ),
      ),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // Align(
           //   alignment: AlignmentDirectional.center,x
           //   child: Image.asset('assets/images/splash.jpg',
           //   height: 190,
           //   width: 190,)
           //   // Text('Science Home',
           //   // style: TextStyle(
           //   //   color: FlutterFlowTheme.of(context).primary,
           //   //   fontWeight: FontWeight.w700,
           //   //   fontSize: 26
           //   // ),),
           // )
        ],),
      ),
    );
  }
}
