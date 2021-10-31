import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap7/tablebodytap7.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap7/datatap7.dart';
import 'modelintable.dart';

class TableTap7Struc extends StatelessWidget {
  const TableTap7Struc({Key? key}) : super(key: key);

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
      create: (_) => FetchDataTable7Bloc(),
      child: BlocBuilder<FetchDataTable7Bloc, List<MainStrucTableTap7>>(
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
  final List<MainStrucTableTap7> State;

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

String GroupName7 = '';
String SampleTypeName7 = '';

class _TableStrucBufferCalldrop extends StatelessWidget {
  _TableStrucBufferCalldrop(
      {Key? key, required this.State, required this.datadropdown})
      : super(key: key);
  final List<MainStrucTableTap7> State;
  final DropDownData datadropdown;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CallDropdowndata(),
      child: BlocBuilder<CallDropdowndata, CallDropDownDataS>(
        builder: (_, State2) {
          return _TableStrucMain7(datainput: State, datadropdown: datadropdown);
        },
      ),
    );
  }
}

class _TableStrucMain7 extends StatefulWidget {
  const _TableStrucMain7({Key? key, this.datainput, required this.datadropdown})
      : super(key: key);

  final List<MainStrucTableTap7>? datainput;
  final DropDownData datadropdown;

  @override
  __TableStrucMain7State createState() => __TableStrucMain7State();
}

class __TableStrucMain7State extends State<_TableStrucMain7> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable7Bloc>().add(DataSequncePage7.select);
    context.read<Dropdowndata>().add(dropdownrequrst.set07);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap7> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap7nPage = n;
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
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Container(
              // color: Colors.red,
              width: 800,
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
                    child: DataListTable7(
                        datainput: _datainput, dropdowndata: _datadropdown),
                  ),
                  _BottomPageNum(
                    func: tapChangeTablePage,
                    datainput: _datainput,
                  )
                ],
              ),
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
          //   width: 400,
          //   height: 500,
          //   child: Padding(
          //     padding: EdgeInsetsDirectional.only(start: 30, end: 30),
          //     child: Column(
          //       // mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Align(
          //           alignment: Alignment.topCenter,
          //           child: Container(
          //             width: 400,
          //             height: 50,
          //             color: Colors.blue,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap7,
          //             fnContr: (input) {
          //               undercontroltap7 = input;
          //             },
          //             sValue: EditDataTable7.number,
          //             returnfunc: () {},
          //             isEnabled: false,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //               isContr: undercontroltap7,
          //               fnContr: (input) {
          //                 undercontroltap7 = input;
          //               },
          //               sValue: EditDataTable7.field01,
          //               returnfunc: (String s) {
          //                 EditDataTable7buffer.field01 = s;
          //               }),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap7,
          //             fnContr: (input) {
          //               undercontroltap7 = input;
          //             },
          //             sValue: EditDataTable7.field02,
          //             returnfunc: (String s) {
          //               EditDataTable7buffer.field02 = s;
          //             },
          //           ),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap7,
          //             fnContr: (input) {
          //               undercontroltap7 = input;
          //             },
          //             sValue: EditDataTable7.field03,
          //             returnfunc: (String s) {
          //               EditDataTable7buffer.field03 = s;
          //             },
          //           ),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap7,
          //             fnContr: (input) {
          //               undercontroltap7 = input;
          //             },
          //             sValue: EditDataTable7.field04,
          //             returnfunc: (String s) {
          //               EditDataTable7buffer.field04 = s;
          //             },
          //           ),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap7,
          //             fnContr: (input) {
          //               undercontroltap7 = input;
          //             },
          //             sValue: EditDataTable7.field05,
          //             returnfunc: (String s) {
          //               EditDataTable7buffer.field05 = s;
          //             },
          //           ),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap7,
          //             fnContr: (input) {
          //               undercontroltap7 = input;
          //             },
          //             sValue: EditDataTable7.field06,
          //             returnfunc: (String s) {
          //               EditDataTable7buffer.field06 = s;
          //             },
          //           ),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Container(
          //           width: 400,
          //           height: 40,
          //           // color: Colors.red,
          //           child: ComInputText(
          //             isContr: undercontroltap7,
          //             fnContr: (input) {
          //               undercontroltap7 = input;
          //             },
          //             sValue: EditDataTable7.field07,
          //             returnfunc: (String s) {
          //               EditDataTable7buffer.field07 = s;
          //             },
          //           ),
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
          //                       // EditDataTable7buffer = EditDataTable7;
          //                       context.read<FetchDataTable7Bloc>().add(
          //                           DataSequncePage7
          //                               .update); //<------------------
          //                     },
          //                     nWidth: 80),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 ComBtnBlackBorder(
          //                     sLabel: "Cancle",
          //                     cBg: Colors.red,
          //                     func: () {
          //                       undercontroltap7 = true;
          //                       EditDataTable7 = MainStrucTableTap7(
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
          //                     nWidth: 80),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 ComBtnBlackBorder(
          //                     sLabel: "New",
          //                     func: () {
          //                       context
          //                           .read<FetchDataTable7Bloc>()
          //                           .add(DataSequncePage7.insert);
          //                     },
          //                     nWidth: 80),
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
  List<MainStrucTableTap7>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap7> _datainput = datainput ?? [];

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
          nPageSelects: TableTap7nPage,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable7,
          nTableCellPerEachPage: nTableCellPerEachPageTable7,
        )
      ],
    );
  }
}
