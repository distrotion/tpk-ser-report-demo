import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap12/tablebodytap12.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap12/datatap12.dart';
import 'modelintable.dart';

class TableTap12Struc extends StatelessWidget {
  const TableTap12Struc({Key? key}) : super(key: key);

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
      create: (_) => FetchDataTable12Bloc(),
      child: BlocBuilder<FetchDataTable12Bloc, List<MainStrucTableTap12>>(
        builder: (_, State) {
          return _TableStrucBuffer2(
            State: State,
          );
        },
      ),
    );
  }
}

class _TableStrucBuffer2 extends StatelessWidget {
  _TableStrucBuffer2({Key? key, required this.State}) : super(key: key);
  final List<MainStrucTableTap12> State;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Dropdowndata(),
      child: BlocBuilder<Dropdowndata, DropDownData>(
        builder: (_, Statedrop) {
          return _TableStrucBufferCalldrop(
              State: State, datadropdown: Statedrop);
        },
      ),
    );
  }
}

class _TableStrucBufferCalldrop extends StatelessWidget {
  _TableStrucBufferCalldrop(
      {Key? key, required this.State, required this.datadropdown})
      : super(key: key);
  final List<MainStrucTableTap12> State;
  final DropDownData datadropdown;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CallDropdowndata(),
      child: BlocBuilder<CallDropdowndata, CallDropDownDataS>(
        builder: (_, State2) {
          return _TableStrucMain12(
              datainput: State, datadropdown: datadropdown);
        },
      ),
    );
  }
}

String GroupName12 = '';
String SampleTypeName12 = '';
String InsrumentName12 = '';
String ItemName12 = '';

class _TableStrucMain12 extends StatefulWidget {
  const _TableStrucMain12(
      {Key? key, this.datainput, required this.datadropdown})
      : super(key: key);

  final List<MainStrucTableTap12>? datainput;
  final DropDownData datadropdown;
  @override
  __TableStrucMain12State createState() => __TableStrucMain12State();
}

class __TableStrucMain12State extends State<_TableStrucMain12> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable12Bloc>().add(DataSequncePage12.select);
    context.read<Dropdowndata>().add(dropdownrequrst.set12);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap12> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap12nPage = n;
      });
    }

    DropDownData _datadropdown = widget.datadropdown;

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
            width: 1100,
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
                  child: DataListTable12(
                    datainput: _datainput,
                    dropdowndata: _datadropdown,
                  ),
                ),
                _BottomPageNum(
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
          //       borderRadius: BorderRadius.all(Radius.circular(24)),
          //       boxShadow: [
          //         BoxShadow(
          //             color: CustomTheme.colorShadowBgStrong,
          //             offset: Offset(0, 0),
          //             blurRadius: 10,
          //             spreadRadius: 0)
          //       ],
          //     ),
          //     width: 1050,
          //     height: 380,
          //     child: Column(
          //       // mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Column(
          //               children: [
          //                 Align(
          //                   alignment: Alignment.topCenter,
          //                   child: Container(
          //                     width: 460,
          //                     height: 50,
          //                     // color: Colors.blue,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 10,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                     isContr: undercontroltap12,
          //                     fnContr: (input) {
          //                       undercontroltap12 = input;
          //                     },
          //                     sValue: EditDataTable12.number,
          //                     returnfunc: () {},
          //                     isEnabled: false,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                       isContr: undercontroltap12,
          //                       fnContr: (input) {
          //                         undercontroltap12 = input;
          //                       },
          //                       sValue: EditDataTable12.field01,
          //                       returnfunc: (String s) {
          //                         EditDataTable12buffer.field01 = s;
          //                       }),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                     isContr: undercontroltap12,
          //                     fnContr: (input) {
          //                       undercontroltap12 = input;
          //                     },
          //                     sValue: EditDataTable12.field02,
          //                     returnfunc: (String s) {
          //                       EditDataTable12buffer.field02 = s;
          //                     },
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                     isContr: undercontroltap12,
          //                     fnContr: (input) {
          //                       undercontroltap12 = input;
          //                     },
          //                     sValue: EditDataTable12.field03,
          //                     returnfunc: (String s) {
          //                       EditDataTable12buffer.field03 = s;
          //                     },
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                     isContr: undercontroltap12,
          //                     fnContr: (input) {
          //                       undercontroltap12 = input;
          //                     },
          //                     sValue: EditDataTable12.field04,
          //                     returnfunc: (String s) {
          //                       EditDataTable12buffer.field04 = s;
          //                     },
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Column(
          //               children: [
          //                 Align(
          //                   alignment: Alignment.topCenter,
          //                   child: Container(
          //                     width: 460,
          //                     height: 50,
          //                     // color: Colors.blue,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 10,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                     isContr: undercontroltap12,
          //                     fnContr: (input) {
          //                       undercontroltap12 = input;
          //                     },
          //                     sValue: EditDataTable12.field05,
          //                     returnfunc: (String s) {
          //                       EditDataTable12buffer.field05 = s;
          //                     },
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                     isContr: undercontroltap12,
          //                     fnContr: (input) {
          //                       undercontroltap12 = input;
          //                     },
          //                     sValue: EditDataTable12.field06,
          //                     returnfunc: (String s) {
          //                       EditDataTable12buffer.field06 = s;
          //                     },
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                     isContr: undercontroltap12,
          //                     fnContr: (input) {
          //                       undercontroltap12 = input;
          //                     },
          //                     sValue: EditDataTable12.field07,
          //                     returnfunc: (String s) {
          //                       EditDataTable12buffer.field07 = s;
          //                     },
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                     isContr: undercontroltap12,
          //                     fnContr: (input) {
          //                       undercontroltap12 = input;
          //                     },
          //                     sValue: EditDataTable12.field08,
          //                     returnfunc: (String s) {
          //                       EditDataTable12buffer.field08 = s;
          //                     },
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Container(
          //                   width: 400,
          //                   height: 40,
          //                   // color: Colors.red,
          //                   child: ComInputText(
          //                     isContr: undercontroltap12,
          //                     fnContr: (input) {
          //                       undercontroltap12 = input;
          //                     },
          //                     sValue: EditDataTable12.field09,
          //                     returnfunc: (String s) {
          //                       EditDataTable12buffer.field09 = s;
          //                     },
          //                   ),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Align(
          //           alignment: Alignment.bottomCenter,
          //           child: Container(
          //             width: 460,
          //             height: 40,
          //             // color: Colors.blue,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 ComBtnBlack(
          //                     sLabel: "Save",
          //                     func: () {
          //                       // EditDataTable12buffer = EditDataTable12;
          //                       context.read<FetchDataTable12Bloc>().add(
          //                           DataSequncePage12
          //                               .update); //<------------------
          //                     },
          //                     nWidth: 134),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 ComBtnBlackBorder(
          //                     sLabel: "Cancle",
          //                     cBg: Colors.red,
          //                     func: () {
          //                       undercontroltap12 = true;
          //                       EditDataTable12 = MainStrucTableTap12(
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
          //                         field10: "",
          //                       );
          //                       BlocProvider.of<BlocPageRebuild>(context)
          //                           .rebuildPage();
          //                     },
          //                     nWidth: 134),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 ComBtnBlackBorder(
          //                     sLabel: "New",
          //                     func: () {
          //                       context
          //                           .read<FetchDataTable12Bloc>()
          //                           .add(DataSequncePage12.insert);
          //                     },
          //                     nWidth: 134),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
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
  List<MainStrucTableTap12>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap12> _datainput = datainput ?? [];

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
          nPageSelects: TableTap12nPage,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable12,
          nTableCellPerEachPage: nTableCellPerEachPageTable12,
        )
      ],
    );
  }
}
