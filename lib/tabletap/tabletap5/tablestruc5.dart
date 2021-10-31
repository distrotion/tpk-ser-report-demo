import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap5/tablebodytap5.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap5/datatap5.dart';
import 'modelintable.dart';

class TableTap5Struc extends StatelessWidget {
  const TableTap5Struc({Key? key}) : super(key: key);

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
      create: (_) => FetchDataTable5Bloc(),
      child: BlocBuilder<FetchDataTable5Bloc, List<MainStrucTableTap5>>(
        builder: (_, State) {
          return _TableStrucMain5(
            datainput: State,
          );
        },
      ),
    );
  }
}

class _TableStrucMain5 extends StatefulWidget {
  const _TableStrucMain5({Key? key, this.datainput}) : super(key: key);

  final List<MainStrucTableTap5>? datainput;

  @override
  __TableStrucMain5State createState() => __TableStrucMain5State();
}

class __TableStrucMain5State extends State<_TableStrucMain5> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable5Bloc>().add(DataSequncePage5.select);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap5> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap5nPage = n;
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
                  child: DataListTable5(
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
          //           isContr: undercontroltap5,
          //           fnContr: (input) {
          //             undercontroltap5 = input;
          //           },
          //           sValue: EditDataTable5.number,
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
          //             isContr: undercontroltap5,
          //             fnContr: (input) {
          //               undercontroltap5 = input;
          //             },
          //             sValue: EditDataTable5.field01,
          //             returnfunc: (String s) {
          //               EditDataTable5buffer.field01 = s;
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
          //           isContr: undercontroltap5,
          //           fnContr: (input) {
          //             undercontroltap5 = input;
          //           },
          //           sValue: EditDataTable5.field02,
          //           returnfunc: (String s) {
          //             EditDataTable5buffer.field02 = s;
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
          //           isContr: undercontroltap5,
          //           fnContr: (input) {
          //             undercontroltap5 = input;
          //           },
          //           sValue: EditDataTable5.field03,
          //           returnfunc: (String s) {
          //             EditDataTable5buffer.field03 = s;
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
          //       //     isContr: undercontroltap5,
          //       //     fnContr: (input) {
          //       //       undercontroltap5 = input;
          //       //     },
          //       //     sValue: EditDataTable5.field04,
          //       //     returnfunc: (String s) {
          //       //       EditDataTable5buffer.field04 = s;
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
          //                     // EditDataTable5buffer = EditDataTable5;
          //                     context.read<FetchDataTable5Bloc>().add(
          //                         DataSequncePage5
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
          //                     undercontroltap5 = true;
          //                     EditDataTable5 = MainStrucTableTap5(
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
          //                         .read<FetchDataTable5Bloc>()
          //                         .add(DataSequncePage5.insert);
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
  List<MainStrucTableTap5>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap5> _datainput = datainput ?? [];

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
          nPageSelects: TableTap5nPage,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable5,
          nTableCellPerEachPage: nTableCellPerEachPageTable5,
        )
      ],
    );
  }
}
