import 'dart:ui';

import 'package:appscrip/Models/model.dart';
import 'package:appscrip/constant/color_const.dart';
import 'package:appscrip/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class UserViewScreen extends StatefulWidget {
  final UserModel userModel;
  const UserViewScreen({super.key, required this.userModel});

  @override
  State<UserViewScreen> createState() => _UserViewScreenState();
}

class _UserViewScreenState extends State<UserViewScreen> {
  UserModel? user ;
  @override
  void initState() {

    user = widget.userModel;
    setState(() {

    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: Column(

        children: [
          Padding(
            padding:  EdgeInsets.all(width*0.03),
            child: Column(
              children: [
                Center(child: Stack(children:[ CircleAvatar(radius: width*0.15,backgroundColor: colorconst.black,child: Icon(Icons.person_outline_outlined,size: width*0.2,color: colorconst.white,),)])),

                SizedBox(height: height*0.02,),
                Text(user!.name,style: TextStyle(fontWeight: FontWeight.w800,color: colorconst.black,fontSize: width*0.08),),
                Text(user!.username,style: TextStyle(color: colorconst.grey,fontWeight: FontWeight.w600,fontSize: width*0.05),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(width*0.08),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Email Address",style: TextStyle(color: colorconst.black,fontWeight: FontWeight.w800)),
                    Text(user!.email),
                    Divider(color: colorconst.black,)
                  ],),
                SizedBox(height: height*0.02,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Mobile Number",style: TextStyle(color: colorconst.black,fontWeight: FontWeight.w800)),
                    Text(user!.phone,style: TextStyle(fontWeight: FontWeight.w500)),
                    Divider(color: colorconst.black,)
                  ],),
                SizedBox(height: height*0.02,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Website",style: TextStyle(color: colorconst.black,fontWeight: FontWeight.w800)),
                    Text(user!.website,style: TextStyle(fontWeight: FontWeight.w500)),
                    Divider(color: colorconst.black,)
                  ],),
                SizedBox(height: height*0.02,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Home Address",style: TextStyle(color: colorconst.black,fontWeight: FontWeight.w800),),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(user!.address.city,style: TextStyle(fontWeight: FontWeight.w500),),

                            Text(user!.address.street,style: TextStyle(fontWeight: FontWeight.w500),), ],),
                        Row(
                          children: [
                            Text(user!.address.suite,style: TextStyle(fontWeight: FontWeight.w500),),

                            Text(user!.address.zipcode,style: TextStyle(fontWeight: FontWeight.w500),)],

                        ),
                        Row(
                          children: [
                            Text(user!.address.geo.lat,style: TextStyle(fontWeight: FontWeight.w500),),
                            Text(user!.address.geo.lng,style: TextStyle(fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: colorconst.black,)
                  ],),
                SizedBox(height: height*0.02,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Office Address",style: TextStyle(color: colorconst.black,fontWeight: FontWeight.w800),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(user!.company.name,style: TextStyle(fontWeight: FontWeight.w500),),
                        Text(user!.company.catchPhrase,style: TextStyle(fontWeight: FontWeight.w500),),
                        Text(user!.company.bs,style: TextStyle(fontWeight: FontWeight.w500),)
                      ],
                    ),
                    Divider(color:colorconst.black,)
                  ],),
              ],
            ),
          ),
        ],
      ),
    );
  }
}