import 'package:appscrip/Controller/User_Controller.dart';
import 'package:appscrip/Screens/Home_page_view.dart';
import 'package:appscrip/constant/color_const.dart';
import 'package:appscrip/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {


//
  final loading =false;
//
//

  TextEditingController searchController = TextEditingController();

  @override



  Widget build(BuildContext context) {
    return RefreshIndicator(

      onRefresh: () async{
        Future.delayed(Duration(seconds: 3));
        ref.watch(userListProvider(searchController.text));

      },
      child: Scaffold(
        appBar: AppBar(

            toolbarHeight: height * 0.2,
            title:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("AppScrip",
                    style:GoogleFonts.alegreyaSc(textStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.brown,
                      fontSize: width * 0.08,
                    ),
                    ),
                ),
                SizedBox(height: height * 0.03),
                Center(
                    child: Container(
                        height: height * 0.07,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.06),
                          color: colorconst.white,
                        ),
                        child:Container(
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.04),
                            color: Colors.black12
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              ref.watch(userListProvider(value));
                            },
                            controller: searchController,
                            keyboardType: TextInputType.text,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              suffixIcon: Icon(CupertinoIcons.search),
                              prefix: SizedBox(width: 10,),
                              label: Padding(
                                padding:  EdgeInsets.all(width*0.04),
                                child: Text(
                                  "Search",
                                  style: TextStyle(
                                    color:colorconst.black,
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        )

                    ))
              ],
            )),
        body:loading?
        Center(child: CircularProgressIndicator()): SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(
                height: width* 0.04,
              ),

              ref.watch(userListProvider(searchController.text)).when(data: (data) {
                return
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: data.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    UserViewScreen(userModel: data[index],),));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.03, right: width* 0.03),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: width * 0.08,
                                    backgroundColor: colorconst.black,
                                    child: Icon(
                                      Icons.person_outline_outlined,
                                      color: colorconst.white,
                                    ),
                                  ),
                                  SizedBox(width: width* 0.05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "Name : ${data[index].name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: colorconst.black),
                                      ),
                                      Text(
                                        "Email : ${data[index].email}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color:colorconst.black),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: height * 0.03,
                      );
                    },

                  );
              },  error: (error, stackTrace) {
                return Text(error.toString());
              },
                loading: () {
                  return Center(child: const CircularProgressIndicator());
                },),

            ],
          ),
        ),
      ),
    );
  }
}