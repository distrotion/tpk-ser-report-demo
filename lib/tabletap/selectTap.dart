import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/tabletap/tabletap1/tablestruc1.dart';
import 'package:pick_edit_datatable/tabletap/tabletap11/tablestruc11.dart';
import 'package:pick_edit_datatable/tabletap/tabletap12/tablestruc12.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import '../bloc/BlocPageRebuild.dart';
import 'tabletap10/tablestruc10.dart';
import 'tabletap2/tablestruc2.dart';
import 'tabletap3/tablestruc3.dart';
import 'tabletap4/tablestruc4.dart';
import 'tabletap5/tablestruc5.dart';
import 'tabletap6/tablestruc6.dart';
import 'tabletap7/tablestruc7.dart';
import 'tabletap8/tablestruc8.dart';
import 'tabletap9/tablestruc9.dart';

int selectedTap = 1;

class TapMainBody extends StatelessWidget {
  const TapMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            constraints: BoxConstraints(maxWidth: 1250, minHeight: 400),
            // color: Colors.blue,
            // width: double.infinity,
            // height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // color: Colors.red,
                    height: 80,
                    constraints: BoxConstraints(maxWidth: 1250, maxHeight: 80),
                    child: alltap(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: PageSelectFunc(selectedTap),
                  )
                ],
              ),
            )));
  }
}

class alltap extends StatelessWidget {
  const alltap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = 200;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  ComBtnBlackBorder(
                      sLabel: "Report",
                      cBg: selectedTap == 1 ? Colors.black : Colors.transparent,
                      cText: selectedTap == 1 ? Colors.white : null,
                      func: () {
                        selectedTap = 1;
                        BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      },
                      nWidth: wi),
                  ComBtnBlackBorder(
                      sLabel: "Report Setup",
                      cBg: selectedTap == 2 ? Colors.black : Colors.transparent,
                      cText: selectedTap == 2 ? Colors.white : null,
                      func: () {
                        selectedTap = 2;
                        BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      },
                      nWidth: wi),
                  // ComBtnBlackBorder(
                  //     sLabel: "Frequency",
                  //     cBg: selectedTap == 3 ? Colors.black : Colors.transparent,
                  //     cText: selectedTap == 3 ? Colors.white : null,
                  //     func: () {
                  //       selectedTap = 3;
                  //       BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                  //     },
                  //     nWidth: wi),
                  // ComBtnBlackBorder(
                  //     sLabel: "Routine Customer",
                  //     cBg: selectedTap == 4 ? Colors.black : Colors.transparent,
                  //     cText: selectedTap == 4 ? Colors.white : null,
                  //     func: () {
                  //       selectedTap = 4;
                  //       BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                  //     },
                  //     nWidth: wi),
                  // ComBtnBlackBorder(
                  //     sLabel: "GroupName",
                  //     cBg: selectedTap == 5 ? Colors.black : Colors.transparent,
                  //     cText: selectedTap == 5 ? Colors.white : null,
                  //     func: () {
                  //       selectedTap = 5;
                  //       BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                  //     },
                  //     nWidth: wi),
                  // ComBtnBlackBorder(
                  //     sLabel: "SampleType",
                  //     cBg: selectedTap == 6 ? Colors.black : Colors.transparent,
                  //     cText: selectedTap == 6 ? Colors.white : null,
                  //     func: () {
                  //       selectedTap = 6;
                  //       BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                  //     },
                  //     nWidth: wi),
                ],
              ),
              // Row(
              //   children: [
              //     ComBtnBlackBorder(
              //         sLabel: "Sample Name",
              //         cBg: selectedTap == 7 ? Colors.black : Colors.transparent,
              //         cText: selectedTap == 7 ? Colors.white : null,
              //         func: () {
              //           selectedTap = 7;
              //           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
              //         },
              //         nWidth: wi),
              //     ComBtnBlackBorder(
              //         sLabel: "Tank",
              //         cBg: selectedTap == 8 ? Colors.black : Colors.transparent,
              //         cText: selectedTap == 8 ? Colors.white : null,
              //         func: () {
              //           selectedTap = 8;
              //           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
              //         },
              //         nWidth: wi),
              //     ComBtnBlackBorder(
              //         sLabel: "Instrument",
              //         cBg: selectedTap == 9 ? Colors.black : Colors.transparent,
              //         cText: selectedTap == 9 ? Colors.white : null,
              //         func: () {
              //           selectedTap = 9;
              //           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
              //         },
              //         nWidth: wi),
              //     ComBtnBlackBorder(
              //         sLabel: "Unit",
              //         cBg:
              //             selectedTap == 10 ? Colors.black : Colors.transparent,
              //         cText: selectedTap == 10 ? Colors.white : null,
              //         func: () {
              //           selectedTap = 10;
              //           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
              //         },
              //         nWidth: wi),
              //     ComBtnBlackBorder(
              //         sLabel: "item",
              //         cBg:
              //             selectedTap == 11 ? Colors.black : Colors.transparent,
              //         cText: selectedTap == 11 ? Colors.white : null,
              //         func: () {
              //           selectedTap = 11;
              //           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
              //         },
              //         nWidth: wi),
              //     ComBtnBlackBorder(
              //         sLabel: "ItemGroup",
              //         cBg:
              //             selectedTap == 12 ? Colors.black : Colors.transparent,
              //         cText: selectedTap == 12 ? Colors.white : null,
              //         func: () {
              //           selectedTap = 12;
              //           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
              //         },
              //         nWidth: wi),
              //   ],
              // ),
            ],
          )
        ],
      ),
    );
  }
}

Widget PageSelectFunc(int page) {
  Widget Pageoutput = TableTap1Struc();

  if (page == 1) {
    Pageoutput = TableTap1Struc();
  } else if (page == 2) {
    Pageoutput = TableTap2Struc();
  } else if (page == 3) {
    Pageoutput = TableTap3Struc();
  } else if (page == 4) {
    Pageoutput = TableTap4Struc();
  } else if (page == 5) {
    Pageoutput = TableTap5Struc();
  } else if (page == 6) {
    Pageoutput = TableTap6Struc();
  } else if (page == 7) {
    Pageoutput = TableTap7Struc();
  } else if (page == 8) {
    Pageoutput = TableTap8Struc();
  } else if (page == 9) {
    Pageoutput = TableTap9Struc();
  } else if (page == 10) {
    Pageoutput = TableTap10Struc();
  }
  if (page == 11) {
    Pageoutput = TableTap11Struc();
  }
  if (page == 12) {
    Pageoutput = TableTap12Struc();
  }

  return Pageoutput;
}
