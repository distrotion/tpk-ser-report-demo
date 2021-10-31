import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap6/tablebodytap6.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap6/datatap6.dart';
import 'modelintable.dart';

class TableTap6Struc extends StatelessWidget {
  const TableTap6Struc({Key? key}) : super(key: key);

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
      create: (_) => FetchDataTable6Bloc(),
      child: BlocBuilder<FetchDataTable6Bloc, List<MainStrucTableTap6>>(
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
  final List<MainStrucTableTap6> State;

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

String GroupType6 = '';

class _TableStrucBufferCalldrop extends StatelessWidget {
  _TableStrucBufferCalldrop(
      {Key? key, required this.State, required this.datadropdown})
      : super(key: key);
  final List<MainStrucTableTap6> State;
  final DropDownData datadropdown;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CallDropdowndata(),
      child: BlocBuilder<CallDropdowndata, CallDropDownDataS>(
        builder: (_, State2) {
          return _TableStrucMain6(datainput: State, datadropdown: datadropdown);
        },
      ),
    );
  }
}

class _TableStrucMain6 extends StatefulWidget {
  const _TableStrucMain6({Key? key, this.datainput, required this.datadropdown})
      : super(key: key);

  final List<MainStrucTableTap6>? datainput;
  final DropDownData datadropdown;

  @override
  __TableStrucMain6State createState() => __TableStrucMain6State();
}

class __TableStrucMain6State extends State<_TableStrucMain6> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable6Bloc>().add(DataSequncePage6.select);
    context.read<Dropdowndata>().add(dropdownrequrst.set06);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap6> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap6nPage = n;
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
            width: 680,
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
                  child: DataListTable6(
                      datainput: _datainput, dropdowndata: _datadropdown),
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
          //   height: 380,
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
          //           isContr: undercontroltap6,
          //           fnContr: (input) {
          //             undercontroltap6 = input;
          //           },
          //           sValue: EditDataTable6.number,
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
          //             isContr: undercontroltap6,
          //             fnContr: (input) {
          //               undercontroltap6 = input;
          //             },
          //             sValue: EditDataTable6.field01,
          //             returnfunc: (String s) {
          //               EditDataTable6buffer.field01 = s;
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
          //           isContr: undercontroltap6,
          //           fnContr: (input) {
          //             undercontroltap6 = input;
          //           },
          //           sValue: EditDataTable6.field02,
          //           returnfunc: (String s) {
          //             EditDataTable6buffer.field02 = s;
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
          //           isContr: undercontroltap6,
          //           fnContr: (input) {
          //             undercontroltap6 = input;
          //           },
          //           sValue: EditDataTable6.field03,
          //           returnfunc: (String s) {
          //             EditDataTable6buffer.field03 = s;
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
          //           isContr: undercontroltap6,
          //           fnContr: (input) {
          //             undercontroltap6 = input;
          //           },
          //           sValue: EditDataTable6.field04,
          //           returnfunc: (String s) {
          //             EditDataTable6buffer.field04 = s;
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
          //           isContr: undercontroltap6,
          //           fnContr: (input) {
          //             undercontroltap6 = input;
          //           },
          //           sValue: EditDataTable6.field05,
          //           returnfunc: (String s) {
          //             EditDataTable6buffer.field05 = s;
          //           },
          //         ),
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
          //                     // EditDataTable6buffer = EditDataTable6;
          //                     context.read<FetchDataTable6Bloc>().add(
          //                         DataSequncePage6
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
          //                     undercontroltap6 = true;
          //                     EditDataTable6 = new MainStrucTableTap6(
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
          //                         .read<FetchDataTable6Bloc>()
          //                         .add(DataSequncePage6.insert);
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
  List<MainStrucTableTap6>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap6> _datainput = datainput ?? [];

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
          nPageSelects: TableTap6nPage,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable6,
          nTableCellPerEachPage: nTableCellPerEachPageTable6,
        )
      ],
    );
  }
}
