import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:school_home/flutter_flow/flutter_flow_model.dart';
import 'package:school_home/flutter_flow/flutter_flow_util.dart';
import 'package:school_home/pages/contact/ContactUSModel.dart';

import '../../flutter_flow/backend/api_requests/api_calls.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../SlideBar.dart';

class Contactuspage extends StatefulWidget {
  const Contactuspage({super.key});

  @override
  State<Contactuspage> createState() => _ContactuspageState();

}



class _ContactuspageState extends State<Contactuspage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Contactusmodel _model;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = createModel(context, () => Contactusmodel());

    contactListApi();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child:
      Container(
         height: MediaQuery.of(context).size.height * 0.9, // 90% of the screen height
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/bg.png',
            ).image,
          ),
        ),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).transparent,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).transparent,
            automaticallyImplyLeading: true,

            title: Text(
              'Science Home',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Inter Tight',
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 18.0,
                letterSpacing: 0.0,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      scaffoldKey.currentState?.openDrawer();
                    },
                    child: SvgPicture.asset(
                      'assets/images/menu_icon.svg',
                      width: 25,
                      height: 25,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            ),
            actions: [

              // Generated code for this Image Widget...
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SvgPicture.asset(
                  'assets/images/notification.svg',
                  width: 45,
                  height: 45,
                  fit: BoxFit.none,
                  color: Colors.black,

                ),
              )
            ],
            centerTitle: true,
            elevation: 0.0,

          ),
          drawer: CustomDrawer(), // Attach your drawer here
          body: SafeArea(
            top: true,
            child:  _model.isLoaderActive == false ? Center(child: CircularProgressIndicator(color: FlutterFlowTheme.of(context).primary)) :SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
    Container(
      width: double.infinity,
      height: 500,
      child: ListView.builder(
      itemCount: _model.contactUsResponse?.data?.length,
      itemBuilder: (context, index) {
        final contact = _model.contactUsResponse?.data?[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${contact?.name}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Email: ${contact?.email}'),
                Text('Number: ${contact?.number}'),
                Text('Subject: ${contact?.subject}'),
                SizedBox(height: 8.0),
                Text(
                  'Message:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              //  Text(contact?.message.toString()),
              ],
            ),
          ),
        );
      }
      ),
    ),

    ]
              ),
            ),
          ),
        ),
      ),
    );
  }

  void contactListApi () async{
  setState(() {

  });
    _model.isLoaderActive=false;
    _model.contactUsResponse = await BaseUrlGroup.contactUsApi.call();
    _model.isLoaderActive=true;
    setState(() {

    });

  }
  }

