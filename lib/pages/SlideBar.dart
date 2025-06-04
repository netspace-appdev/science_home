

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_home/flutter_flow/flutter_flow_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Generated code for this Column Widget...
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/bg.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 20),
                  child: InkWell(
                    onTap: (){
                      context.pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                   context.pushNamed('HomePage');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SvgPicture.asset(
                              'assets/images/homeicon.svg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Home',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ].divide(SizedBox(width: 20)),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    context.pushNamed('AllCategory');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SvgPicture.asset(
                              'assets/images/edit.svg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Category',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ].divide(SizedBox(width: 20)),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    context.pushNamed('Allproduct');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SvgPicture.asset(
                              'assets/images/copy.svg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Product',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ].divide(SizedBox(width: 20)),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SvgPicture.asset(
                            'assets/images/folder.svg',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          'Terms & Conditions',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ].divide(SizedBox(width: 20)),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20,
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    context.pushNamed('ContactUs');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SvgPicture.asset(
                              'assets/images/headfon.svg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Contact Us',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ].divide(SizedBox(width: 20)),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(height: 20)),
            ),
          ),
        )

    );
  }
}


