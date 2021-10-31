import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap10/tablebodytap10.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComPageNumBtnGroup.dart';

import 'datatap10/datatap10.dart';
import 'modelintable.dart';

class TableTap10Struc extends StatelessWidget {
  const TableTap10Struc({Key? key}) : super(key: key);

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
      create: (_) => FetchDataTable10Bloc(),
      child: BlocBuilder<FetchDataTable10Bloc, List<MainStrucTableTap10>>(
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
  final List<MainStrucTableTap10> State;

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

String GroupName10 = '';

class _TableStrucBufferCalldrop extends StatelessWidget {
  _TableStrucBufferCalldrop(
      {Key? key, required this.State, required this.datadropdown})
      : super(key: key);
  final List<MainStrucTableTap10> State;
  final DropDownData datadropdown;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CallDropdowndata(),
      child: BlocBuilder<CallDropdowndata, CallDropDownDataS>(
        builder: (_, State2) {
          return _TableStrucMain10(
              datainput: State, datadropdown: datadropdown);
        },
      ),
    );
  }
}

class _TableStrucMain10 extends StatefulWidget {
  const _TableStrucMain10(
      {Key? key, this.datainput, required this.datadropdown})
      : super(key: key);

  final List<MainStrucTableTap10>? datainput;
  final DropDownData datadropdown;
  @override
  __TableStrucMain10State createState() => __TableStrucMain10State();
}

class __TableStrucMain10State extends State<_TableStrucMain10> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataTable10Bloc>().add(DataSequncePage10.select);
    context.read<Dropdowndata>().add(dropdownrequrst.set10);
  }

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap10> _datainput = widget.datainput ?? [];
    void tapChangeTablePage(int n) {
      setState(() {
        // print(n);
        TableTap10nPage = n;
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
                  child: DataListTable10(
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
          //           isContr: undercontroltap10,
          //           fnContr: (input) {
          //             undercontroltap10 = input;
          //           },
          //           sValue: EditDataTable10.number,
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
          //             isContr: undercontroltap10,
          //             fnContr: (input) {
          //               undercontroltap10 = input;
          //             },
          //             sValue: EditDataTable10.field01,
          //             returnfunc: (String s) {
          //               EditDataTable10buffer.field01 = s;
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
          //           isContr: undercontroltap10,
          //           fnContr: (input) {
          //             undercontroltap10 = input;
          //           },
          //           sValue: EditDataTable10.field02,
          //           returnfunc: (String s) {
          //             EditDataTable10buffer.field02 = s;
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
          //           isContr: undercontroltap10,
          //           fnContr: (input) {
          //             undercontroltap10 = input;
          //           },
          //           sValue: EditDataTable10.field03,
          //           returnfunc: (String s) {
          //             EditDataTable10buffer.field03 = s;
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
          //           isContr: undercontroltap10,
          //           fnContr: (input) {
          //             undercontroltap10 = input;
          //           },
          //           sValue: EditDataTable10.field04,
          //           returnfunc: (String s) {
          //             EditDataTable10buffer.field04 = s;
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
          //           isContr: undercontroltap10,
          //           fnContr: (input) {
          //             undercontroltap10 = input;
          //           },
          //           sValue: EditDataTable10.field05,
          //           returnfunc: (String s) {
          //             EditDataTable10buffer.field05 = s;
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
          //                     // EditDataTable10buffer = EditDataTable10;
          //                     context.read<FetchDataTable10Bloc>().add(
          //                         DataSequncePage10
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
          //                     undercontroltap10 = true;
          //                     EditDataTable10 = MainStrucTableTap10(
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
          //                         .read<FetchDataTable10Bloc>()
          //                         .add(DataSequncePage10.insert);
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
  List<MainStrucTableTap10>? datainput;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;
    List<MainStrucTableTap10> _datainput = datainput ?? [];

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
          nPageSelects: TableTap10nPage,
          func: func,
          nNumToShowArrowAtPage: nNumToShowArrowAtPageTable10,
          nTableCellPerEachPage: nTableCellPerEachPageTable10,
        )
      ],
    );
  }
}
