import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap1/datatap1.dart';
import 'modelintable.dart';
import 'tablebodytap1.dart';

class TableTap1Struc extends StatelessWidget {
  const TableTap1Struc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TableStrucBuffer();
  }
}

class _TableStrucBuffer extends StatelessWidget {
  const _TableStrucBuffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FetchDataTable1Bloc(),
      child: BlocBuilder<FetchDataTable1Bloc, List<MainStrucTableTap1>>(
        builder: (_, State) {
          return _TableStrucMain1(
            datainput: State,
          );
        },
      ),
    );
  }
}

class _TableStrucMain1 extends StatefulWidget {
  const _TableStrucMain1({Key? key, this.datainput}) : super(key: key);

  final List<MainStrucTableTap1>? datainput;

  @override
  __TableStrucMain1State createState() => __TableStrucMain1State();
}

class __TableStrucMain1State extends State<_TableStrucMain1> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable1Bloc>().add(DataSequncePage1.select);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap1> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap1nPage = n;
      });
    }

    print("xxx");

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
          child: Wrap(
        children: [
          Container(
            // color: Colors.red,
            width: 800,
            height: 420,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomTheme.colorGreyBg,
                    // borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: CustomTheme.colorShadowBgStrong,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                  ),
                  child: DataListTable(
                    datainput: _datainput,
                  ),
                ),
                BottomPageNum(
                  func: tapChangeTablePage,
                  datainput: _datainput,
                )
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsetsDirectional.only(start: 20, end: 20),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: CustomTheme.colorGreyBg,
          //       // borderRadius: BorderRadius.all(Radius.circular(24)),
          //       boxShadow: [
          //         BoxShadow(
          //             color: CustomTheme.colorShadowBgStrong,
          //             offset: Offset(0, 0),
          //             blurRadius: 10,
          //             spreadRadius: 0)
          //       ],
          //     ),
          //     width: 400,
          //     height: 420,
          //     child: Padding(
          //       padding: EdgeInsetsDirectional.only(start: 30, end: 30),
          //       child: Column(
          //         // mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Column(
          //             children: [
          //               Align(
          //                 alignment: Alignment.topCenter,
          //                 child: Container(
          //                   width: 400,
          //                   height: 30,
          //                   // color: Colors.blue,
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 10,
          //               ),
          //               Container(
          //                 width: 400,
          //                 height: 40,
          //                 // color: Colors.red,
          //                 child: ComInputText(
          //                   isContr: undercontroltap1,
          //                   fnContr: (input) {
          //                     undercontroltap1 = input;
          //                   },
          //                   sValue: EditDataTable1.number,
          //                   returnfunc: () {},
          //                   isEnabled: false,
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Container(
          //                 width: 400,
          //                 height: 40,
          //                 // color: Colors.red,
          //                 child: ComInputText(
          //                     isContr: undercontroltap1,
          //                     fnContr: (input) {
          //                       undercontroltap1 = input;
          //                     },
          //                     sValue: EditDataTable1.field01,
          //                     returnfunc: (String s) {
          //                       EditDataTable1buffer.field01 = s;
          //                     }),
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Container(
          //                 width: 400,
          //                 height: 40,
          //                 // color: Colors.red,
          //                 child: ComInputText(
          //                   isContr: undercontroltap1,
          //                   fnContr: (input) {
          //                     undercontroltap1 = input;
          //                   },
          //                   sValue: EditDataTable1.field02,
          //                   returnfunc: (String s) {
          //                     EditDataTable1buffer.field02 = s;
          //                   },
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Container(
          //                 width: 400,
          //                 height: 40,
          //                 // color: Colors.red,
          //                 child: ComInputText(
          //                   isContr: undercontroltap1,
          //                   fnContr: (input) {
          //                     undercontroltap1 = input;
          //                   },
          //                   sValue: EditDataTable1.field03,
          //                   returnfunc: (String s) {
          //                     EditDataTable1buffer.field03 = s;
          //                   },
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Container(
          //                 width: 400,
          //                 height: 40,
          //                 // color: Colors.red,
          //                 child: ComInputText(
          //                   isContr: undercontroltap1,
          //                   fnContr: (input) {
          //                     undercontroltap1 = input;
          //                   },
          //                   sValue: EditDataTable1.field04,
          //                   returnfunc: (String s) {
          //                     EditDataTable1buffer.field04 = s;
          //                   },
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Container(
          //                 width: 400,
          //                 height: 40,
          //                 // color: Colors.red,
          //                 child: ComInputText(
          //                   isContr: undercontroltap1,
          //                   fnContr: (input) {
          //                     undercontroltap1 = input;
          //                   },
          //                   sValue: EditDataTable1.field05,
          //                   returnfunc: (String s) {
          //                     EditDataTable1buffer.field05 = s;
          //                   },
          //                 ),
          //               ),
          //               Container(
          //                 width: 400,
          //                 height: 40,
          //                 // color: Colors.red,
          //                 child: ComInputText(
          //                   isContr: undercontroltap1,
          //                   fnContr: (input) {
          //                     undercontroltap1 = input;
          //                   },
          //                   sValue: EditDataTable1.field06,
          //                   returnfunc: (String s) {
          //                     EditDataTable1buffer.field06 = s;
          //                   },
          //                 ),
          //               ),
          //             ],
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Align(
          //             alignment: Alignment.bottomCenter,
          //             child: Container(
          //               width: 460,
          //               height: 40,
          //               // color: Colors.blue,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   ComBtnBlack(
          //                       sLabel: "Save",
          //                       func: () {
          //                         // print(EditDataTable1buffer.field04);
          //                         // EditDataTable1buffer = EditDataTable1;
          //                         context.read<FetchDataTable1Bloc>().add(
          //                             DataSequncePage1
          //                                 .update); //<------------------
          //                       },
          //                       nWidth: 80),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   ComBtnBlackBorder(
          //                       sLabel: "Cancle",
          //                       cBg: Colors.red,
          //                       func: () {
          //                         undercontroltap1 = true;
          //                         EditDataTable1 = MainStrucTableTap1(
          //                             number: "",
          //                             field01: "",
          //                             field02: "",
          //                             field03: "",
          //                             field04: "",
          //                             field05: "",
          //                             field06: "",
          //                             field07: "",
          //                             field08: "",
          //                             field09: "",
          //                             field10: "");
          //                         EditDataTable1buffer = MainStrucTableTap1(
          //                             number: "",
          //                             field01: "",
          //                             field02: "",
          //                             field03: "",
          //                             field04: "",
          //                             field05: "",
          //                             field06: "",
          //                             field07: "",
          //                             field08: "",
          //                             field09: "",
          //                             field10: "");
          //                         BlocProvider.of<BlocPageRebuild>(context)
          //                             .rebuildPage();
          //                       },
          //                       nWidth: 80),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   ComBtnBlackBorder(
          //                       sLabel: "New",
          //                       func: () {
          //                         context
          //                             .read<FetchDataTable1Bloc>()
          //                             .add(DataSequncePage1.insert);
          //                       },
          //                       nWidth: 80),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      )),
    );
  }
}

//------------------------------------------------------------------------------------------------

class BottomPageNum extends StatelessWidget {
  BottomPageNum({Key? key, required this.func, this.datainput})
      : super(key: key);
  final Function func;
  List<MainStrucTableTap1>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap1> _datainput = datainput ?? [];

    //print("build BottomPageNum " + BlocPatientList.state.patientTableData.length.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Pages",
          style: TxtStyle(fontSize: 12),
        ),
        ComPageNumBtnGroup(
          nItemNum: _datainput.length,
          nPageSelects: TableTap1nPage,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable1,
          nTableCellPerEachPage: nTableCellPerEachPageTable1,
        )
      ],
    );
  }
}
