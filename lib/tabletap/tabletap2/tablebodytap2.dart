import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';

import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/datatap2/datatap2.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/tablestruc2.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import 'package:pick_edit_datatable/widget/ComBtnImage.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComYNPopup.dart';
import 'package:pick_edit_datatable/widget/Easydropdown.dart';

import 'modelintable.dart';

int ListTable2Status = 0;

class DataListTable2 extends StatefulWidget {
  const DataListTable2({Key? key, required this.datainput}) : super(key: key);
  final List<MainStrucTableTap2> datainput;
  @override
  _DataListTable2State createState() => _DataListTable2State();
}

class _DataListTable2State extends State<DataListTable2> {
  int nCurrentSortIndex = 0; //index from Header DataColumn
  bool isSortAscending = true;

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap2> Listdata_Clone = widget.datainput;

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

    void _tapView(MainStrucTableTap2 s) {
      //click all
      // print("123");
      ListTable2Status = 1;
      EditDataTable2 = s;
      EditDataTable2buffer = s;
      undercontroltap2 = true;
      Branch = s.field04;
      Code = s.field05;

      context.read<FetchDataTable2Bloc>().add(DataSequncePage2.select);
      _ConsoleBox(s, context, zeroDropDownData);
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
    void _Edit(MainStrucTableTap2 s) {
      _CloseYNPopup();
      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _Delete(String s) {
      _CloseYNPopup();
      context.read<FetchDataTable2Bloc>().add(DataSequncePage2.delete);
    }

    void _tapEdit(MainStrucTableTap2 s) {
      // _CallYNPopup('Edit ${s}', 'Do you want to Edit ${s} now?', 'Yes', 'No',
      //     _Edit, _CloseYNPopup, s, false);
      EditDataTable2 = s;
      EditDataTable2buffer = s;
      undercontroltap2 = true;
      context.read<FetchDataTable2Bloc>().add(DataSequncePage2.select);
      // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _tapDelete(MainStrucTableTap2 s) {
      DeleteDataTable2buffer.number = s.number;
      DeleteDataTable2buffer.field01 = s.field01;
      DeleteDataTable2buffer.field02 = s.field02;
      DeleteDataTable2buffer.field03 = s.field03;
      DeleteDataTable2buffer.field04 = s.field04;
      DeleteDataTable2buffer.field05 = s.field05;
      DeleteDataTable2buffer.field06 = s.field06;
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
      TableTap2nPage, //data
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                // color: Colors.red,
                child: ComBtnBlackBorder(
                    sLabel: "New",
                    func: () {
                      ListTable2Status = 0;
                      MainStrucTableTap2 Zerodata = MainStrucTableTap2(
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
                        field10: "",
                      );
                      // CustFull = '';
                      // FrequencyRequest = '';
                      // Incharge = '';
                      // SubLeader = '';
                      // GL = '';
                      // JP = '';
                      // DMG = '';
                      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      _ConsoleBox(Zerodata, context, zeroDropDownData);
                    },
                    nWidth: 134),
              ),
              // SizedBox(
              //   width: 100,
              // ),
            ],
          ),
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
                    1, "NO", 'Sort Field 1', nDataColumnWidth, tapSort),
                _getDataColumn(
                    2, "CP", 'Sort Field 2', nDataColumnWidth, tapSort),
                _getDataColumn(
                    3, "Customer", 'Sort Field 3', nDataColumnWidth, tapSort),
                _getDataColumn(
                    4, "Materail", 'Sort Field 4', nDataColumnWidth, tapSort),
                _getDataColumn(
                    5, "Branch", 'Sort Field 5', nDataColumnWidth, tapSort),
                _getDataColumn(6, "Report Type", 'Sort Field 6',
                    nDataColumnWidth, tapSort),
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
  List<MainStrucTableTap2> Listdata_Clone,
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
  int nStartCell = (currentPage - 1) * nTableCellPerEachPageTable2;

  List<DataRow> dataRowList = [];
  for (int n = nStartCell;
      n < (nStartCell + nTableCellPerEachPageTable2);
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
    MainStrucTableTap2 getData) {
  //cells num must be match header column num

  return DataRow(
      cells: [
        _getDataCell_Label(number, nDataColumnWidth),
        _getDataCell_Label(field01, nDataColumnWidth),
        _getDataCell_Label(field02, nDataColumnWidth),
        _getDataCell_Label(field03, nDataColumnWidth),
        _getDataCell_Label(field04, nDataColumnWidth),
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
    MainStrucTableTap2 GetData) {
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Container(
          //   width: nDataWidthIcon,
          //   height: 100,
          //   // color: Colors.blue,
          //   child: ComBtnImage(
          //     sImgPath: Icons.edit,
          //     func: _tapEdit,
          //     nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
          //   ),
          // ),
          Container(
            width: nDataWidthIcon,
            height: 100,
            child: ComBtnImage(
              sImgPath: Icons.delete,
              func: _tapDelete,
              nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
            ),
          ),
        ],
      ),
    ),
  );
}

void _ConsoleBox(MainStrucTableTap2 input, BuildContext contextinput,
    DropDownData dropdowndata) {
  showDialog(
    context: contextinput,
    barrierDismissible: true,
    builder: (BuildContext context) {
      // DropDownData _datadropdown = dropdowndata;
      EditDataTable2.field04 = Branch;
      EditDataTable2.field05 = Code;
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
          height: 420,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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
                child:
                    Align(alignment: Alignment.centerLeft, child: Text("CP")),
              ),
              Container(
                width: 400,
                height: 40,
                // color: Colors.red,
                child: ComInputText(
                  isContr: undercontroltap2,
                  fnContr: (input) {
                    undercontroltap2 = input;
                  },
                  sValue: EditDataTable2.number,
                  returnfunc: () {},
                  isEnabled: false,
                ),
              ),
              SizedBox(
                width: 400,
                height: 15,
                child: Align(
                    alignment: Alignment.centerLeft, child: Text("Custommer")),
              ),
              Container(
                width: 400,
                height: 40,
                // color: Colors.red,
                child: ComInputText(
                    isContr: undercontroltap2,
                    fnContr: (input) {
                      undercontroltap2 = input;
                    },
                    sValue: EditDataTable2.field01,
                    returnfunc: (String s) {
                      EditDataTable2buffer.field01 = s;
                    }),
              ),
              SizedBox(
                width: 400,
                height: 15,
                child:
                    Align(alignment: Alignment.centerLeft, child: Text("PART")),
              ),
              Container(
                width: 400,
                height: 40,
                // color: Colors.red,
                child: ComInputText(
                  isContr: undercontroltap2,
                  fnContr: (input) {
                    undercontroltap2 = input;
                  },
                  sValue: EditDataTable2.field02,
                  returnfunc: (String s) {
                    EditDataTable2buffer.field02 = s;
                  },
                ),
              ),
              SizedBox(
                width: 400,
                height: 15,
                child: Align(
                    alignment: Alignment.centerLeft, child: Text("Material")),
              ),
              Container(
                width: 400,
                height: 40,
                // color: Colors.red,
                child: ComInputText(
                  isContr: undercontroltap2,
                  fnContr: (input) {
                    undercontroltap2 = input;
                  },
                  sValue: EditDataTable2.field03,
                  returnfunc: (String s) {
                    EditDataTable2buffer.field03 = s;
                  },
                ),
              ),
              SizedBox(
                width: 400,
                height: 15,
                child: Align(
                    alignment: Alignment.centerLeft, child: Text("Branch")),
              ),
              EasyDropDown(
                width: 400,
                height: 40,
                value: Branch,
                onChangeinside: (newValue) {
                  Branch = newValue!;
                  EditDataTable2buffer.field04 = newValue;
                  BlocProvider.of<BlocPageRebuild>(contextinput).rebuildPage();
                },
                listdropdown: ['', 'RAYONG', 'BANGPOO', 'GATEWAY'],
              ),
              SizedBox(
                width: 400,
                height: 15,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Report Type")),
              ),
              EasyDropDown(
                width: 400,
                height: 40,
                value: Code,
                onChangeinside: (newValue) {
                  Code = newValue!;
                  EditDataTable2buffer.field05 = newValue;
                  BlocProvider.of<BlocPageRebuild>(contextinput).rebuildPage();
                },
                listdropdown: ['', 'TPK-SAR-STD', 'TPK-SAR-Condition01'],
              ),
              // SizedBox(
              //   width: 400,
              //   height: 15,
              //   // child:
              //   //     Align(alignment: Alignment.centerLeft, child: Text("test")),
              // ),
              // Container(
              //   width: 400,
              //   height: 40,
              //   // color: Colors.red,
              //   child: ComInputText(
              //     isContr: undercontroltap2,
              //     fnContr: (input) {
              //       undercontroltap2 = input;
              //     },
              //     sValue: EditDataTable2.field06,
              //     returnfunc: (String s) {
              //       EditDataTable2buffer.field06 = s;
              //     },
              //   ),
              // ),
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
                            // print(EditDataTable2buffer.field04);
                            // EditDataTable2buffer = EditDataTable2;
                            contextinput.read<FetchDataTable2Bloc>().add(
                                DataSequncePage2.update); //<------------------
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
                            undercontroltap2 = true;
                            EditDataTable2 = MainStrucTableTap2(
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
                              field10: "",
                            );

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
                                .read<FetchDataTable2Bloc>()
                                .add(DataSequncePage2.insert);
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
