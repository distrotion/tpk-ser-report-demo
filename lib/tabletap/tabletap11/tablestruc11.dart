import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap11/tablebodytap11.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap11/datatap11.dart';
import 'modelintable.dart';

class TableTap11Struc extends StatelessWidget {
  const TableTap11Struc({Key? key}) : super(key: key);

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
      create: (_) => FetchDataTable11Bloc(),
      child: BlocBuilder<FetchDataTable11Bloc, List<MainStrucTableTap11>>(
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
  final List<MainStrucTableTap11> State;

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
  final List<MainStrucTableTap11> State;
  final DropDownData datadropdown;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CallDropdowndata(),
      child: BlocBuilder<CallDropdowndata, CallDropDownDataS>(
        builder: (_, State2) {
          return _TableStrucMain11(
              datainput: State, datadropdown: datadropdown);
        },
      ),
    );
  }
}

String InstrumentName11 = '';

String Unit01_11 = '';
String Unit02_11 = '';
String Unit03_11 = '';
String Unit04_11 = '';
String Unit05_11 = '';
String Unit06_11 = '';
String Unit07_11 = '';
String Unit08_11 = '';
String Unit09_11 = '';
String Unit10_11 = '';

class _TableStrucMain11 extends StatefulWidget {
  const _TableStrucMain11(
      {Key? key, this.datainput, required this.datadropdown})
      : super(key: key);

  final List<MainStrucTableTap11>? datainput;
  final DropDownData datadropdown;

  @override
  __TableStrucMain11State createState() => __TableStrucMain11State();
}

class __TableStrucMain11State extends State<_TableStrucMain11> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable11Bloc>().add(DataSequncePage11.select);
    context.read<Dropdowndata>().add(dropdownrequrst.set11);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap11> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap11nPage = n;
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
          child: Padding(
        padding: EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Wrap(
          children: [
            Container(
              // color: Colors.red,
              width: 1200,
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
                    child: DataListTable11(
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
            //   width: 1200,
            //   height: 450,
            //   child: Column(
            //     // mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Column(
            //             children: [
            //               Align(
            //                 alignment: Alignment.topCenter,
            //                 child: Container(
            //                   width: 350,
            //                   height: 50,
            //                   color: Colors.blue,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.number,
            //                   returnfunc: () {},
            //                   isEnabled: false,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                     isContr: undercontroltap11,
            //                     fnContr: (input) {
            //                       undercontroltap11 = input;
            //                     },
            //                     sValue: EditDataTable11.field01,
            //                     returnfunc: (String s) {
            //                       EditDataTable11buffer.field01 = s;
            //                     }),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field02,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field02 = s;
            //                   },
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field03,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field03 = s;
            //                   },
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field04,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field04 = s;
            //                   },
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field05,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field05 = s;
            //                   },
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field06,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field06 = s;
            //                   },
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Column(
            //             children: [
            //               Align(
            //                 alignment: Alignment.topCenter,
            //                 child: Container(
            //                   width: 350,
            //                   height: 50,
            //                   color: Colors.blue,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                     isContr: undercontroltap11,
            //                     fnContr: (input) {
            //                       undercontroltap11 = input;
            //                     },
            //                     sValue: EditDataTable11.field07,
            //                     returnfunc: (String s) {
            //                       EditDataTable11buffer.field07 = s;
            //                     }),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field08,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field08 = s;
            //                   },
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field09,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field09 = s;
            //                   },
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field10,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field10 = s;
            //                   },
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field11,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field11 = s;
            //                   },
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field12,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field12 = s;
            //                   },
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                   isContr: undercontroltap11,
            //                   fnContr: (input) {
            //                     undercontroltap11 = input;
            //                   },
            //                   sValue: EditDataTable11.field13,
            //                   returnfunc: (String s) {
            //                     EditDataTable11buffer.field13 = s;
            //                   },
            //                 ),
            //               ),
            //             ],
            //           ),
            //           Column(
            //             children: [
            //               Align(
            //                 alignment: Alignment.topCenter,
            //                 child: Container(
            //                   width: 350,
            //                   height: 50,
            //                   color: Colors.blue,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                     isContr: undercontroltap11,
            //                     fnContr: (input) {
            //                       undercontroltap11 = input;
            //                     },
            //                     sValue: EditDataTable11.field14,
            //                     returnfunc: (String s) {
            //                       EditDataTable11buffer.field14 = s;
            //                     }),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                     isContr: undercontroltap11,
            //                     fnContr: (input) {
            //                       undercontroltap11 = input;
            //                     },
            //                     sValue: EditDataTable11.field15,
            //                     returnfunc: (String s) {
            //                       EditDataTable11buffer.field15 = s;
            //                     }),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                     isContr: undercontroltap11,
            //                     fnContr: (input) {
            //                       undercontroltap11 = input;
            //                     },
            //                     sValue: EditDataTable11.field16,
            //                     returnfunc: (String s) {
            //                       EditDataTable11buffer.field16 = s;
            //                     }),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //                 child: ComInputText(
            //                     isContr: undercontroltap11,
            //                     fnContr: (input) {
            //                       undercontroltap11 = input;
            //                     },
            //                     sValue: EditDataTable11.field17,
            //                     returnfunc: (String s) {
            //                       EditDataTable11buffer.field17 = s;
            //                     }),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Container(
            //                 width: 300,
            //                 height: 40,
            //                 // color: Colors.red,
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
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
            //                     // EditDataTable11buffer = EditDataTable11;
            //                     context.read<FetchDataTable11Bloc>().add(
            //                         DataSequncePage11
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
            //                     undercontroltap11 = true;
            //                     EditDataTable11 = MainStrucTableTap11(
            //                       number: "",
            //                       field01: "",
            //                       field02: "",
            //                       field03: "",
            //                       field04: "",
            //                       field05: "",
            //                       field06: "",
            //                       field07: "",
            //                       field08: "",
            //                       field09: "",
            //                       field10: "",
            //                       field11: "",
            //                       field12: "",
            //                       field13: "",
            //                       field14: "",
            //                       field15: "",
            //                       field16: "",
            //                       field17: "",
            //                     );
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
            //                         .read<FetchDataTable11Bloc>()
            //                         .add(DataSequncePage11.insert);
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
        ),
      )),
    );
  }
}

class _BottomPageNum extends StatelessWidget {
  _BottomPageNum({Key? key, required this.func, this.datainput})
      : super(key: key);
  final Function func;
  List<MainStrucTableTap11>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap11> _datainput = datainput ?? [];

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
          nPageSelects: TableTap11nPage,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable11,
          nTableCellPerEachPage: nTableCellPerEachPageTable11,
        )
      ],
    );
  }
}
