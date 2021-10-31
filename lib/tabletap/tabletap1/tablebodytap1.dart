import 'dart:async';
import 'dart:ui';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComBtnImage.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComYNPopup.dart';

import 'datatap1/datatap1.dart';
import 'modelintable.dart';

int ListTable1Status_RP = 0;

class DataListTable extends StatefulWidget {
  const DataListTable({Key? key, required this.datainput}) : super(key: key);
  final List<MainStrucTableTap1_RP> datainput;
  @override
  _DataListTableState createState() => _DataListTableState();
}

class _DataListTableState extends State<DataListTable> {
  int nCurrentSortIndex = 0; //index from Header DataColumn
  bool isSortAscending = true;

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap1_RP> Listdata_Clone = widget.datainput;

    double nDataColumnWidth = 75;
    double nDataColumnWidthIcon = 100;
    double nDataWidthIcon = 50;
    double nMarginToMakeIconSmaller = 8;

    void tapSort(int nIndex, int columnIndex, bool ascending) {
      if (ascending) {
        print(nIndex);
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item1.field01.compareTo(item2.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item1.field02.compareTo(item2.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item1.field03.compareTo(item2.field03));
            break;
          case 4:
            Listdata_Clone.sort(
                (item1, item2) => item1.field04.compareTo(item2.field04));
            break;
          case 5:
            Listdata_Clone.sort(
                (item1, item2) => item1.field05.compareTo(item2.field05));
            break;
          case 6:
            Listdata_Clone.sort(
                (item1, item2) => item1.field06.compareTo(item2.field06));
            break;
        }
      } else {
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item2.field01.compareTo(item1.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item2.field02.compareTo(item1.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item2.field03.compareTo(item1.field03));
            break;
          case 4:
            Listdata_Clone.sort(
                (item1, item2) => item2.field04.compareTo(item1.field04));
            break;
          case 5:
            Listdata_Clone.sort(
                (item1, item2) => item2.field05.compareTo(item1.field05));
            break;
          case 6:
            Listdata_Clone.sort(
                (item1, item2) => item2.field06.compareTo(item1.field06));
            break;
        }
      }
      //BlocPatientList.sort();
      setState(() {
        nCurrentSortIndex = columnIndex;
        isSortAscending = ascending;
      });
    }

    //------------------------------------------------------------------------------------------------

    void _tapView(MainStrucTableTap1_RP s) {
      //click all
      // print("123");
      // ListTable1Status = 1;
      // EditDataTable1 = s;
      // EditDataTable1buffer = s;

      // context.read<FetchDataTable1Bloc>().add(DataSequncePage1.select);
      // _ConsoleBox(s, context, zeroDropDownData);
    }

    void _CallYNPopup(
        String sTxtHead,
        String sTxtBody,
        String sTxtBtnYes,
        String sTxtBtnNo,
        Function funcYes,
        Function funcNo,
        String sFuncData,
        bool isSwitchYNBtnPos) {
      showDialog<String>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => ComYNPopup(
          sTxtHead: sTxtHead,
          sTxtBody: sTxtBody,
          sTxtBtnYes: sTxtBtnYes,
          sTxtBtnNo: sTxtBtnNo,
          funcYes: funcYes,
          funcNo: funcNo,
          sFuncData: sFuncData,
          isSwitchYNBtnPos: isSwitchYNBtnPos,
        ),
      );
    }

    void _CloseYNPopup() {
      Navigator.pop(context, '');
    }

    // void GoToTele(String s) {
    //   CloseYNPopup();
    //   BlocProvider.of<BlocChangePage>(context).changePage(enumPageList.Tele);
    // }
    void _Edit(MainStrucTableTap1_RP s) {
      // _CloseYNPopup();
      // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _Delete(String s) {
      _CloseYNPopup();

      context.read<FetchDataTable1Bloc_RP>().add(DataSequncePage1_RP.delete);
    }

    void _tapEdit(MainStrucTableTap1_RP s) {
      print(s.number);
      print(s.field04);
      js.context.callMethod('open', [
        'http://172.20.30.46/ReportServer?%2fReport+Project4%2f${s.field04}&rs:Format=PDF&rs:Command=Render&T1=${s.number}'
      ]);
      context.read<FetchDataTable1Bloc_RP>().add(DataSequncePage1_RP.select);
      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _tapDelete(MainStrucTableTap1_RP s) {
      // print(s.field01);
      DeleteDataTable1buffer_RP.number = s.number;
      DeleteDataTable1buffer_RP.field01 = s.field01;
      DeleteDataTable1buffer_RP.field02 = s.field02;
      DeleteDataTable1buffer_RP.field03 = s.field03;
      DeleteDataTable1buffer_RP.field04 = s.field04;
      DeleteDataTable1buffer_RP.field05 = s.field05;
      DeleteDataTable1buffer_RP.field06 = s.field06;
      _CallYNPopup(
          'Delete ${s.number}',
          'Are you sure you want to delete ${s.number}?',
          'Delete',
          'Cancel',
          _Delete,
          _CloseYNPopup,
          s.number,
          true);
    }

    //all cells data for this page.
    List<DataRow> RowDataInput = _getDataRowList(
      Listdata_Clone,
      nDataColumnWidth,
      nDataColumnWidthIcon,
      nDataWidthIcon,
      nMarginToMakeIconSmaller,
      _tapView,
      _tapEdit,
      _tapDelete,
      TableTap1nPage_RP, //data
    );

    //fixed error when sort the hide column on mobile
    // nCurrentSortIndex = 0;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Container(
          //       height: 30,
          //       // color: Colors.red,
          //       child: ComBtnBlackBorder(
          //           sLabel: "New",
          //           func: () {
          //             ListTable1Status = 0;
          //             MainStrucTableTap1 Zerodata = MainStrucTableTap1(
          //               number: "",
          //               field01: "",
          //               field02: "",
          //               field03: "",
          //               field04: "",
          //               field05: "",
          //               field06: "",
          //               field07: "",
          //               field08: "",
          //               field09: "",
          //               field10: "",
          //             );
          //             // CustFull = '';
          //             // FrequencyRequest = '';
          //             // Incharge = '';
          //             // SubLeader = '';
          //             // GL = '';
          //             // JP = '';
          //             // DMG = '';
          //             BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
          //             _ConsoleBox(Zerodata, context, zeroDropDownData);
          //           },
          //           nWidth: 134),
          //     ),
          //     // SizedBox(
          //     //   width: 100,
          //     // ),
          //   ],
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              sortColumnIndex: nCurrentSortIndex,
              sortAscending: isSortAscending,
              showCheckboxColumn:
                  false, //Hide checkbox that come from tap row 'onselectchanged'
              columnSpacing: 10,
              dataRowHeight: 56,
              // Header Column -----------------------------------------------------------
              columns: [
                _getDataColumn(
                    1, "PO", 'Sort Field 1', nDataColumnWidth, tapSort),
                _getDataColumn(
                    2, "CP", 'Sort Field 2', nDataColumnWidth, tapSort),
                _getDataColumn(3, "Custommer", 'Sort Field 3', 150, tapSort),
                _getDataColumn(
                    4, "Incharge", 'Sort Field 4', nDataColumnWidth, tapSort),
                _getDataColumn(5, "Report Type", 'Sort Field 5', 120, tapSort),
                _getDataColumn(
                    6, "Status", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getBlankDataColumn(nDataColumnWidthIcon),
              ],
              // Cell Row  -----------------------------------------------------------
              rows: [
                for (DataRow dataRow in RowDataInput) dataRow,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Header Column --------------------------------------------------------------

DataColumn _getDataColumn(int nIndex, String sLabel, String sTooltip,
    double nDataColumnWidth, Function func) {
  return DataColumn(
    label: Container(
      width: nDataColumnWidth,
      child: Text(sLabel),
      //color: Colors.red,
    ),
    numeric: false,
    tooltip: sTooltip,
    onSort: (int columnIndex, bool ascending) {
      func(nIndex, columnIndex, ascending);
    },
  );
}

// blank for call icon
DataColumn _getBlankDataColumn(double nDataColumnWidthIcon) {
  return DataColumn(
    label: Expanded(
      child: Container(
          // color: Colors.red,
          ),
    ),
  );
}

// Cell Row -------------------------------------------------------------------
List<DataRow> _getDataRowList(
  List<MainStrucTableTap1_RP> Listdata_Clone,
  double nDataColumnWidth,
  double nDataColumnWidthIcon,
  double nDataWidthIcon,
  double nMarginToMakeIconSmaller,
  // enumScreenResponsiveList screenResponsive,
  Function funcView,
  Function funcEdit,
  Function funcDelete,
  int currentPage,
) {
  int nStartCell = (currentPage - 1) * nTableCellPerEachPageTable1_RP;

  List<DataRow> dataRowList = [];
  for (int n = nStartCell;
      n < (nStartCell + nTableCellPerEachPageTable1_RP);
      n++) {
    if (n < Listdata_Clone.length) {
      dataRowList.add(_getDataRow(
        Listdata_Clone[n].number,
        Listdata_Clone[n].field01,
        Listdata_Clone[n].field02,
        Listdata_Clone[n].field03,
        Listdata_Clone[n].field04,
        Listdata_Clone[n].field05,
        Listdata_Clone[n].field06,
        nDataColumnWidth,
        nDataColumnWidthIcon,
        nDataWidthIcon,
        nMarginToMakeIconSmaller,
        // screenResponsive,
        funcView,
        funcEdit,
        funcDelete,
        Listdata_Clone[n],
      ));
    }
  }
  return dataRowList;
}

DataRow _getDataRow(
    String number,
    String field01,
    String field02,
    String field03,
    String field04,
    String field05,
    String field06,
    double nDataColumnWidth,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    // enumScreenResponsiveList screenResponsive,
    Function funcView,
    Function funcEdit,
    Function funcDelete,
    MainStrucTableTap1_RP getData) {
  //cells num must be match header column num

  return DataRow(
      cells: [
        _getDataCell_Label(number, nDataColumnWidth),
        _getDataCell_Label(field01, nDataColumnWidth),
        _getDataCell_Label(field02, 150),
        _getDataCell_Label(field03, nDataColumnWidth),
        _getDataCell_Label(field04, 120),
        _getDataCell_Label(field05, nDataColumnWidth),
        _getDataCell_Icon(number, funcEdit, funcDelete, nDataColumnWidthIcon,
            nDataWidthIcon, nMarginToMakeIconSmaller, getData),
      ],
      onSelectChanged: (value) {
        // funcView(number);
        // print(value);
        // print(number);
        funcView(getData);
      });
}

DataCell _getDataCell_ImgName(
    String sName, double nDataColumnWidth, int nGender) {
  return DataCell(InkWell(
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              // ComProfileImg(
              //   profileImg: enumProfileImgList.Patient_Default,
              //   nGender: nGender,
              //   nWidthHeight: 40,
              // ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Text(sName,
                      overflow: TextOverflow.fade, softWrap: false)),
            ],
          ))));
}

// each cell inside 1 row
DataCell _getDataCell_Label(String sLabel, double nDataColumnWidth) {
  return DataCell(InkWell(
      child: Container(
    // color: Colors.red,
    width: nDataColumnWidth,
    child: Text(sLabel, overflow: TextOverflow.fade, softWrap: false),
  )));
}

DataCell _getDataCell_Icon(
    String sId,
    Function funcEdit,
    Function funcDelete,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    MainStrucTableTap1_RP GetData) {
  void _tapEdit() {
    funcEdit(GetData);
  }

  void _tapDelete() {
    funcDelete(GetData);
  }

  return DataCell(
    Container(
      width: nDataColumnWidthIcon,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: nDataWidthIcon,
            height: 50,
            // color: Colors.blue,
            child: ComBtnImage(
              sImgPath: Icons.checklist_outlined,
              func: _tapEdit,
              nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
            ),
          ),
          // Container(
          //   width: nDataWidthIcon,
          //   height: 100,
          //   child: ComBtnImage(
          //     sImgPath: Icons.delete,
          //     func: _tapDelete,
          //     nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
          //   ),
          // ),
        ],
      ),
    ),
  );
}

void _ConsoleBox(MainStrucTableTap1_RP input, BuildContext contextinput,
    DropDownData dropdowndata) {
  showDialog(
    context: contextinput,
    barrierDismissible: true,
    builder: (BuildContext context) {
      // DropDownData _datadropdown = dropdowndata;
      return Dialog(
        child: Container(
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
          width: 450,
          height: 440,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 400,
                      height: 20,
                      // color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 15,
                    child: Align(
                        alignment: Alignment.centerLeft, child: Text("ID")),
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    // color: Colors.red,
                    child: ComInputText(
                      isContr: undercontroltap1_RP,
                      fnContr: (input) {
                        undercontroltap1_RP = input;
                      },
                      sValue: EditDataTable1_RP.number,
                      returnfunc: () {},
                      isEnabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 15,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("USER NAME")),
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    // color: Colors.red,
                    child: ComInputText(
                        isContr: undercontroltap1_RP,
                        fnContr: (input) {
                          undercontroltap1_RP = input;
                        },
                        sValue: EditDataTable1_RP.field01,
                        returnfunc: (String s) {
                          EditDataTable1buffer_RP.field01 = s;
                        }),
                  ),
                  SizedBox(
                    width: 400,
                    height: 15,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("PASSWORD")),
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    // color: Colors.red,
                    child: ComInputText(
                      isContr: undercontroltap1_RP,
                      fnContr: (input) {
                        undercontroltap1_RP = input;
                      },
                      sValue: EditDataTable1_RP.field02,
                      returnfunc: (String s) {
                        EditDataTable1buffer_RP.field02 = s;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 15,
                    child: Align(
                        alignment: Alignment.centerLeft, child: Text("NAME")),
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    // color: Colors.red,
                    child: ComInputText(
                      isContr: undercontroltap1_RP,
                      fnContr: (input) {
                        undercontroltap1_RP = input;
                      },
                      sValue: EditDataTable1_RP.field03,
                      returnfunc: (String s) {
                        EditDataTable1buffer_RP.field03 = s;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 15,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("SECTION")),
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    // color: Colors.red,
                    child: ComInputText(
                      isContr: undercontroltap1_RP,
                      fnContr: (input) {
                        undercontroltap1_RP = input;
                      },
                      sValue: EditDataTable1_RP.field04,
                      returnfunc: (String s) {
                        EditDataTable1buffer_RP.field04 = s;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    height: 15,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("ROLE ID")),
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    // color: Colors.red,
                    child: ComInputText(
                      isContr: undercontroltap1_RP,
                      fnContr: (input) {
                        undercontroltap1_RP = input;
                      },
                      sValue: EditDataTable1_RP.field05,
                      returnfunc: (String s) {
                        EditDataTable1buffer_RP.field05 = s;
                      },
                    ),
                  ),
                  // Container(
                  //   width: 400,
                  //   height: 40,
                  //   // color: Colors.red,
                  //   child: ComInputText(
                  //     isContr: undercontroltap1,
                  //     fnContr: (input) {
                  //       undercontroltap1 = input;
                  //     },
                  //     sValue: EditDataTable1.field06,
                  //     returnfunc: (String s) {
                  //       EditDataTable1buffer.field06 = s;
                  //     },
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 460,
                  height: 40,
                  // color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ComBtnBlack(
                          sLabel: "Update",
                          func: () {
                            // print(EditDataTable1buffer.field04);
                            // EditDataTable1buffer = EditDataTable1;
                            contextinput.read<FetchDataTable1Bloc_RP>().add(
                                DataSequncePage1_RP
                                    .update); //<------------------
                            Navigator.pop(contextinput);
                          },
                          nWidth: 80),
                      SizedBox(
                        width: 10,
                      ),
                      ComBtnBlackBorder(
                          sLabel: "Clear",
                          cBg: Colors.red,
                          func: () {
                            undercontroltap1_RP = true;
                            EditDataTable1_RP = MainStrucTableTap1_RP(
                                number: "",
                                field01: "",
                                field02: "",
                                field03: "",
                                field04: "",
                                field05: "",
                                field06: "",
                                field07: "",
                                field08: "",
                                field09: "",
                                field10: "");
                            EditDataTable1buffer_RP = MainStrucTableTap1_RP(
                                number: "",
                                field01: "",
                                field02: "",
                                field03: "",
                                field04: "",
                                field05: "",
                                field06: "",
                                field07: "",
                                field08: "",
                                field09: "",
                                field10: "");
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          nWidth: 80),
                      SizedBox(
                        width: 10,
                      ),
                      ComBtnBlackBorder(
                          sLabel: "Insert",
                          func: () {
                            contextinput
                                .read<FetchDataTable1Bloc_RP>()
                                .add(DataSequncePage1_RP.insert);
                            Navigator.pop(contextinput);
                          },
                          nWidth: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class TxtStylePOP extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily = 'Mitr';
  final FontStyle fontStyle = FontStyle.normal;

  const TxtStylePOP(
      {this.fontSize = 12,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal})
      : super();
}

void _onLoading(BuildContext contextin, void newValue) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      newValue;
      return Container(
        // color: Colors.red,

        child: Dialog(
          child: Container(
              height: 75,
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 30),
                  new CircularProgressIndicator(),
                  SizedBox(width: 20),
                  new Text("Loading"),
                ],
              )),
        ),
      );
    },
  );

  Timer(Duration(seconds: 1), () {
    BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
    Navigator.pop(contextin);
  });
}
