import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap8/tablebodytap8.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap8/datatap8.dart';
import 'modelintable.dart';

class TableTap8Struc extends StatelessWidget {
  const TableTap8Struc({Key? key}) : super(key: key);

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
      create: (_) => FetchDataTable8Bloc(),
      child: BlocBuilder<FetchDataTable8Bloc, List<MainStrucTableTap8>>(
        builder: (_, State) {
          return _TableStrucMain8(
            datainput: State,
          );
        },
      ),
    );
  }
}

class _TableStrucMain8 extends StatefulWidget {
  const _TableStrucMain8({Key? key, this.datainput}) : super(key: key);

  final List<MainStrucTableTap8>? datainput;

  @override
  __TableStrucMain8State createState() => __TableStrucMain8State();
}

class __TableStrucMain8State extends State<_TableStrucMain8> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable8Bloc>().add(DataSequncePage8.select);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap8> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap8nPage = n;
      });
    }

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
            width: 500,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomTheme.colorGreyBg,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: CustomTheme.colorShadowBgStrong,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                  ),
                  child: DataListTable8(
                    datainput: _datainput,
                  ),
                ),
                _BottomPageNum(
                  func: tapChangeTablePage,
                  datainput: _datainput,
                )
              ],
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: CustomTheme.colorGreyBg,
          //     borderRadius: BorderRadius.all(Radius.circular(24)),
          //     boxShadow: [
          //       BoxShadow(
          //           color: CustomTheme.colorShadowBgStrong,
          //           offset: Offset(0, 0),
          //           blurRadius: 10,
          //           spreadRadius: 0)
          //     ],
          //   ),
          //   width: 500,
          //   height: 335,
          //   child: Column(
          //     // mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Align(
          //         alignment: Alignment.topCenter,
          //         child: Container(
          //           width: 460,
          //           height: 50,
          //           color: Colors.blue,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Container(
          //         width: 400,
          //         height: 40,
          //         // color: Colors.red,
          //         child: ComInputText(
          //           isContr: undercontroltap8,
          //           fnContr: (input) {
          //             undercontroltap8 = input;
          //           },
          //           sValue: EditDataTable8.number,
          //           returnfunc: () {},
          //           isEnabled: false,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 5,
          //       ),
          //       Container(
          //         width: 400,
          //         height: 40,
          //         // color: Colors.red,
          //         child: ComInputText(
          //             isContr: undercontroltap8,
          //             fnContr: (input) {
          //               undercontroltap8 = input;
          //             },
          //             sValue: EditDataTable8.field01,
          //             returnfunc: (String s) {
          //               EditDataTable8buffer.field01 = s;
          //             }),
          //       ),
          //       SizedBox(
          //         height: 5,
          //       ),
          //       Container(
          //         width: 400,
          //         height: 40,
          //         // color: Colors.red,
          //         child: ComInputText(
          //           isContr: undercontroltap8,
          //           fnContr: (input) {
          //             undercontroltap8 = input;
          //           },
          //           sValue: EditDataTable8.field02,
          //           returnfunc: (String s) {
          //             EditDataTable8buffer.field02 = s;
          //           },
          //         ),
          //       ),
          //       SizedBox(
          //         height: 5,
          //       ),
          //       Container(
          //         width: 400,
          //         height: 40,
          //         // color: Colors.red,
          //         child: ComInputText(
          //           isContr: undercontroltap8,
          //           fnContr: (input) {
          //             undercontroltap8 = input;
          //           },
          //           sValue: EditDataTable8.field03,
          //           returnfunc: (String s) {
          //             EditDataTable8buffer.field03 = s;
          //           },
          //         ),
          //       ),
          //       // SizedBox(
          //       //   height: 5,
          //       // ),
          //       // Container(
          //       //   width: 400,
          //       //   height: 40,
          //       //   // color: Colors.red,
          //       //   child: ComInputText(
          //       //     isContr: undercontroltap8,
          //       //     fnContr: (input) {
          //       //       undercontroltap8 = input;
          //       //     },
          //       //     sValue: EditDataTable8.field04,
          //       //     returnfunc: (String s) {
          //       //       EditDataTable8buffer.field04 = s;
          //       //     },
          //       //   ),
          //       // ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Align(
          //         alignment: Alignment.bottomCenter,
          //         child: Container(
          //           width: 460,
          //           height: 40,
          //           // color: Colors.blue,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               ComBtnBlack(
          //                   sLabel: "Save",
          //                   func: () {
          //                     // EditDataTable8buffer = EditDataTable8;
          //                     context.read<FetchDataTable8Bloc>().add(
          //                         DataSequncePage8
          //                             .update); //<------------------
          //                   },
          //                   nWidth: 134),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               ComBtnBlackBorder(
          //                   sLabel: "Cancle",
          //                   cBg: Colors.red,
          //                   func: () {
          //                     undercontroltap8 = true;
          //                     EditDataTable8 = MainStrucTableTap8(
          //                         number: "",
          //                         field01: "",
          //                         field02: "",
          //                         field03: "",
          //                         field04: "",
          //                         field05: "",
          //                         field06: "",
          //                         field07: "",
          //                         field08: "",
          //                         field09: "",
          //                         field10: "");
          //                     BlocProvider.of<BlocPageRebuild>(context)
          //                         .rebuildPage();
          //                   },
          //                   nWidth: 134),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               ComBtnBlackBorder(
          //                   sLabel: "New",
          //                   func: () {
          //                     context
          //                         .read<FetchDataTable8Bloc>()
          //                         .add(DataSequncePage8.insert);
          //                   },
          //                   nWidth: 134),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      )),
    );
  }
}

class _BottomPageNum extends StatelessWidget {
  _BottomPageNum({Key? key, required this.func, this.datainput})
      : super(key: key);
  final Function func;
  List<MainStrucTableTap8>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap8> _datainput = datainput ?? [];

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
          nPageSelects: TableTap8nPage,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable8,
          nTableCellPerEachPage: nTableCellPerEachPageTable8,
        )
      ],
    );
  }
}
