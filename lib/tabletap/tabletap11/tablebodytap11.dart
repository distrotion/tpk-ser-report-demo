import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/bloc/BlocPageRebuild.dart';
import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_bloc.dart';

import 'package:pick_edit_datatable/bloc/datasequnce/datasequnce_event.dart';
import 'package:pick_edit_datatable/style/style.dart';
import 'package:pick_edit_datatable/widget/Advancedropdown.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlack.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';

import 'package:pick_edit_datatable/widget/ComBtnImage.dart';
import 'package:pick_edit_datatable/widget/ComInputText.dart';
import 'package:pick_edit_datatable/widget/ComYNPopup.dart';

import 'datatap11/datatap11.dart';
import 'modelintable.dart';
import 'tablestruc11.dart';

int ListTable11Status = 0;

class DataListTable11 extends StatefulWidget {
  DataListTable11(
      {Key? key, required this.datainput, required this.dropdowndata})
      : super(key: key);
  final List<MainStrucTableTap11> datainput;
  DropDownData dropdowndata;
  @override
  _DataListTable11State createState() => _DataListTable11State();
}

class _DataListTable11State extends State<DataListTable11> {
  int nCurrentSortIndex = 0; //index from Header DataColumn
  bool isSortAscending = true;

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap11> Listdata_Clone = widget.datainput;

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
          case 7:
            Listdata_Clone.sort(
                (item1, item2) => item1.field07.compareTo(item2.field07));
            break;
          case 8:
            Listdata_Clone.sort(
                (item1, item2) => item1.field08.compareTo(item2.field08));
            break;
          case 9:
            Listdata_Clone.sort(
                (item1, item2) => item1.field09.compareTo(item2.field09));
            break;
          case 10:
            Listdata_Clone.sort(
                (item1, item2) => item1.field10.compareTo(item2.field10));
            break;
          case 11:
            Listdata_Clone.sort(
                (item1, item2) => item1.field11.compareTo(item2.field11));
            break;
          case 12:
            Listdata_Clone.sort(
                (item1, item2) => item1.field12.compareTo(item2.field12));
            break;
          case 13:
            Listdata_Clone.sort(
                (item1, item2) => item1.field13.compareTo(item2.field13));
            break;
          case 14:
            Listdata_Clone.sort(
                (item1, item2) => item1.field14.compareTo(item2.field14));
            break;
          case 15:
            Listdata_Clone.sort(
                (item1, item2) => item1.field15.compareTo(item2.field15));
            break;
          case 16:
            Listdata_Clone.sort(
                (item1, item2) => item1.field16.compareTo(item2.field16));
            break;
          case 17:
            Listdata_Clone.sort(
                (item1, item2) => item1.field17.compareTo(item2.field17));
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
          case 7:
            Listdata_Clone.sort(
                (item1, item2) => item2.field07.compareTo(item1.field07));
            break;
          case 8:
            Listdata_Clone.sort(
                (item1, item2) => item2.field08.compareTo(item1.field08));
            break;
          case 9:
            Listdata_Clone.sort(
                (item1, item2) => item2.field09.compareTo(item1.field09));
            break;
          case 10:
            Listdata_Clone.sort(
                (item1, item2) => item2.field10.compareTo(item1.field10));
            break;
          case 11:
            Listdata_Clone.sort(
                (item1, item2) => item2.field11.compareTo(item1.field11));
            break;
          case 12:
            Listdata_Clone.sort(
                (item1, item2) => item2.field12.compareTo(item1.field12));
            break;
          case 13:
            Listdata_Clone.sort(
                (item1, item2) => item2.field13.compareTo(item1.field13));
            break;
          case 14:
            Listdata_Clone.sort(
                (item1, item2) => item2.field14.compareTo(item1.field14));
            break;
          case 15:
            Listdata_Clone.sort(
                (item1, item2) => item2.field15.compareTo(item1.field15));
            break;
          case 16:
            Listdata_Clone.sort(
                (item1, item2) => item2.field16.compareTo(item1.field16));
            break;
          case 17:
            Listdata_Clone.sort(
                (item1, item2) => item2.field17.compareTo(item1.field17));
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

    void _tapView(MainStrucTableTap11 s) {
      //click all
      // print("123");
      ListTable11Status = 1;
      EditDataTable11 = s;
      EditDataTable11buffer = s;
      undercontroltap11 = true;
      InstrumentName11 = s.field02;
      Unit01_11 = s.field07;
      Unit02_11 = s.field08;
      Unit03_11 = s.field09;
      Unit04_11 = s.field10;
      Unit05_11 = s.field11;
      Unit06_11 = s.field12;
      Unit07_11 = s.field13;
      Unit08_11 = s.field14;
      Unit09_11 = s.field15;
      Unit10_11 = s.field16;

      context.read<FetchDataTable11Bloc>().add(DataSequncePage11.select);
      _ConsoleBox(s, context, widget.dropdowndata);
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
    void _Edit(MainStrucTableTap11 s) {
      _CloseYNPopup();
      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _Delete(String s) {
      _CloseYNPopup();
      context.read<FetchDataTable11Bloc>().add(DataSequncePage11.delete);
    }

    void _tapEdit(MainStrucTableTap11 s) {
      // _CallYNPopup('Edit ${s}', 'Do you want to Edit ${s} now?', 'Yes', 'No',
      //     _Edit, _CloseYNPopup, s, false);
      EditDataTable11 = s;
      EditDataTable11buffer = s;
      undercontroltap11 = true;
      context.read<FetchDataTable11Bloc>().add(DataSequncePage11.select);
      // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _tapDelete(MainStrucTableTap11 s) {
      DeleteDataTable11buffer.number = s.number;
      DeleteDataTable11buffer.field01 = s.field01;
      DeleteDataTable11buffer.field02 = s.field02;
      DeleteDataTable11buffer.field03 = s.field03;
      DeleteDataTable11buffer.field04 = s.field04;
      DeleteDataTable11buffer.field05 = s.field05;
      DeleteDataTable11buffer.field06 = s.field06;
      DeleteDataTable11buffer.field07 = s.field07;
      DeleteDataTable11buffer.field08 = s.field08;
      DeleteDataTable11buffer.field09 = s.field09;
      DeleteDataTable11buffer.field10 = s.field10;
      DeleteDataTable11buffer.field11 = s.field11;
      DeleteDataTable11buffer.field12 = s.field12;
      DeleteDataTable11buffer.field13 = s.field13;
      DeleteDataTable11buffer.field14 = s.field14;
      DeleteDataTable11buffer.field15 = s.field15;
      DeleteDataTable11buffer.field16 = s.field16;
      DeleteDataTable11buffer.field17 = s.field17;
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
      TableTap11nPage, //data
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
                      ListTable11Status = 0;
                      MainStrucTableTap11 Zerodata = MainStrucTableTap11(
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
                        field11: "",
                        field12: "",
                        field13: "",
                        field14: "",
                        field15: "",
                        field16: "",
                        field17: "",
                      );
                      // CustFull = '';
                      // FrequencyRequest = '';
                      // Incharge = '';
                      // SubLeader = '';
                      // GL = '';
                      // JP = '';
                      // DMG = '';
                      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      _ConsoleBox(Zerodata, context, widget.dropdowndata);
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
                    1, "No", 'Sort Field 1', nDataColumnWidth, tapSort),
                _getDataColumn(
                    2, "Ins-Id", 'Sort Field 2', nDataColumnWidth, tapSort),
                _getDataColumn(
                    3, "Ins-Name", 'Sort Field 3', nDataColumnWidth, tapSort),
                _getDataColumn(
                    4, "ItemId", 'Sort Field 4', nDataColumnWidth, tapSort),
                _getDataColumn(
                    5, "ItemName", 'Sort Field 5', nDataColumnWidth, tapSort),
                _getDataColumn(
                    6, "Cost", 'Sort Field 6', nDataColumnWidth, tapSort),
                _getDataColumn(
                    7, "Price", 'Sort Field 7', nDataColumnWidth, tapSort),
                _getDataColumn(
                    8, "Unit-01", 'Sort Field 8', nDataColumnWidth, tapSort),
                _getDataColumn(
                    9, "Unit-02", 'Sort Field 9', nDataColumnWidth, tapSort),
                _getDataColumn(
                    10, "Unit-03", 'Sort Field 10', nDataColumnWidth, tapSort),
                _getDataColumn(
                    11, "Unit-04", 'Sort Field 11', nDataColumnWidth, tapSort),
                _getDataColumn(
                    12, "Unit-05", 'Sort Field 12', nDataColumnWidth, tapSort),
                _getDataColumn(
                    13, "Unit-06", 'Sort Field 13', nDataColumnWidth, tapSort),
                _getDataColumn(
                    14, "Unit-07", 'Sort Field 14', nDataColumnWidth, tapSort),
                _getDataColumn(
                    15, "Unit-08", 'Sort Field 15', nDataColumnWidth, tapSort),
                _getDataColumn(
                    16, "Unit-09", 'Sort Field 16', nDataColumnWidth, tapSort),
                _getDataColumn(
                    17, "Unit-10", 'Sort Field 17', nDataColumnWidth, tapSort),
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
  List<MainStrucTableTap11> Listdata_Clone,
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
  int nStartCell = (currentPage - 1) * nTableCellPerEachPageTable11;

  List<DataRow> dataRowList = [];
  for (int n = nStartCell;
      n < (nStartCell + nTableCellPerEachPageTable11);
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
        Listdata_Clone[n].field07,
        Listdata_Clone[n].field08,
        Listdata_Clone[n].field09,
        Listdata_Clone[n].field10,
        Listdata_Clone[n].field11,
        Listdata_Clone[n].field12,
        Listdata_Clone[n].field13,
        Listdata_Clone[n].field14,
        Listdata_Clone[n].field15,
        Listdata_Clone[n].field16,
        Listdata_Clone[n].field17,

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
    String field07,
    String field08,
    String field09,
    String field10,
    String field11,
    String field12,
    String field13,
    String field14,
    String field15,
    String field16,
    String field17,
    double nDataColumnWidth,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    // enumScreenResponsiveList screenResponsive,
    Function funcView,
    Function funcEdit,
    Function funcDelete,
    MainStrucTableTap11 getData) {
  //cells num must be match header column num

  return DataRow(
      cells: [
        _getDataCell_Label(number, nDataColumnWidth),
        _getDataCell_Label(field01, nDataColumnWidth),
        _getDataCell_Label(field02, nDataColumnWidth),
        _getDataCell_Label(field03, nDataColumnWidth),
        _getDataCell_Label(field04, nDataColumnWidth),
        _getDataCell_Label(field05, nDataColumnWidth),
        _getDataCell_Label(field06, nDataColumnWidth),
        _getDataCell_Label(field07, nDataColumnWidth),
        _getDataCell_Label(field08, nDataColumnWidth),
        _getDataCell_Label(field09, nDataColumnWidth),
        _getDataCell_Label(field10, nDataColumnWidth),
        _getDataCell_Label(field11, nDataColumnWidth),
        _getDataCell_Label(field12, nDataColumnWidth),
        _getDataCell_Label(field13, nDataColumnWidth),
        _getDataCell_Label(field14, nDataColumnWidth),
        _getDataCell_Label(field15, nDataColumnWidth),
        _getDataCell_Label(field16, nDataColumnWidth),
        // _getDataCell_Label(field17, nDataColumnWidth),
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
    MainStrucTableTap11 GetData) {
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

void _ConsoleBox(MainStrucTableTap11 input, BuildContext contextinput,
    DropDownData dropdowndata) {
  showDialog(
    context: contextinput,
    barrierDismissible: true,
    builder: (BuildContext context) {
      DropDownData _datadropdown = dropdowndata;
      List<String> _list1 = _datadropdown.list01;
      List<String> _list2 = _datadropdown.list02;

      return Dialog(
          child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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
          width: 1050,
          height: 470,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 350,
                            height: 20,
                            // color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("NO")),
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                            isContr: undercontroltap11,
                            fnContr: (input) {
                              undercontroltap11 = input;
                            },
                            sValue: EditDataTable11.number,
                            returnfunc: () {},
                            isEnabled: false,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("InstrumentId")),
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                              isEnabled: false,
                              isContr: undercontroltap11,
                              fnContr: (input) {
                                undercontroltap11 = input;
                              },
                              sValue: EditDataTable11.field01,
                              returnfunc: (String s) {
                                EditDataTable11buffer.field01 = s;
                              }),
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("InstrumentName")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: InstrumentName11,
                          onChangeinside: (newValue) {
                            InstrumentName11 = newValue!;
                            EditDataTable11buffer.field02 = newValue;
                            undercontroltap11 = true;
                            _onLoading(
                                contextinput,
                                contextinput
                                    .read<CallDropdowndata>()
                                    .add(calldropdownrequrst.set11_1));
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list1,
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("ItemId")),
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                            isContr: undercontroltap11,
                            fnContr: (input) {
                              undercontroltap11 = input;
                            },
                            sValue: EditDataTable11.field03,
                            returnfunc: (String s) {
                              EditDataTable11buffer.field03 = s;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("ItemName")),
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                            isContr: undercontroltap11,
                            fnContr: (input) {
                              undercontroltap11 = input;
                            },
                            sValue: EditDataTable11.field04,
                            returnfunc: (String s) {
                              EditDataTable11buffer.field04 = s;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Cost")),
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                            isContr: undercontroltap11,
                            fnContr: (input) {
                              undercontroltap11 = input;
                            },
                            sValue: EditDataTable11.field05,
                            returnfunc: (String s) {
                              EditDataTable11buffer.field05 = s;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Price")),
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                            isContr: undercontroltap11,
                            fnContr: (input) {
                              undercontroltap11 = input;
                            },
                            sValue: EditDataTable11.field06,
                            returnfunc: (String s) {
                              EditDataTable11buffer.field06 = s;
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 350,
                            height: 20,
                            // color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit01")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit01_11,
                          onChangeinside: (newValue) {
                            Unit01_11 = newValue!;
                            EditDataTable11buffer.field07 = newValue;
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit02")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit02_11,
                          onChangeinside: (newValue) {
                            Unit02_11 = newValue!;
                            EditDataTable11buffer.field08 = newValue;
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit03")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit03_11,
                          onChangeinside: (newValue) {
                            Unit03_11 = newValue!;
                            EditDataTable11buffer.field09 = newValue;
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit04")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit04_11,
                          onChangeinside: (newValue) {
                            Unit04_11 = newValue!;
                            EditDataTable11buffer.field10 = newValue;
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit05")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit05_11,
                          onChangeinside: (newValue) {
                            Unit05_11 = newValue!;
                            EditDataTable11buffer.field11 = newValue;
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit06")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit06_11,
                          onChangeinside: (newValue) {
                            Unit06_11 = newValue!;
                            EditDataTable11buffer.field12 = newValue;
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit07")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit07_11,
                          onChangeinside: (newValue) {
                            Unit07_11 = newValue!;
                            EditDataTable11buffer.field13 = newValue;
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 350,
                            height: 20,
                            // color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit08")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit08_11,
                          onChangeinside: (newValue) {
                            Unit08_11 = newValue!;
                            EditDataTable11buffer.field14 = newValue;

                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit09")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit09_11,
                          onChangeinside: (newValue) {
                            Unit09_11 = newValue!;
                            EditDataTable11buffer.field15 = newValue;
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                        SizedBox(
                          width: 300,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Unit10")),
                        ),
                        AdvanceDropDown(
                          width: 300,
                          height: 40,
                          value: Unit10_11,
                          onChangeinside: (newValue) {
                            Unit10_11 = newValue!;
                            EditDataTable11buffer.field16 = newValue;
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list2,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: 40,
                          // color: Colors.red,
                        ),
                      ],
                    ),
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
                              // EditDataTable11buffer = EditDataTable11;
                              contextinput.read<FetchDataTable11Bloc>().add(
                                  DataSequncePage11
                                      .update); //<------------------
                              Navigator.pop(contextinput);
                            },
                            nWidth: 134),
                        SizedBox(
                          width: 10,
                        ),
                        ComBtnBlackBorder(
                            sLabel: "Clear",
                            cBg: Colors.red,
                            func: () {
                              undercontroltap11 = true;
                              EditDataTable11 = MainStrucTableTap11(
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
                                field11: "",
                                field12: "",
                                field13: "",
                                field14: "",
                                field15: "",
                                field16: "",
                                field17: "",
                              );
                              BlocProvider.of<BlocPageRebuild>(contextinput)
                                  .rebuildPage();
                            },
                            nWidth: 134),
                        SizedBox(
                          width: 10,
                        ),
                        ComBtnBlackBorder(
                            sLabel: "Insert",
                            func: () {
                              contextinput
                                  .read<FetchDataTable11Bloc>()
                                  .add(DataSequncePage11.insert);
                              Navigator.pop(contextinput);
                            },
                            nWidth: 134),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
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

class TxtStyleDetail extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily = 'Mitr';
  final FontStyle fontStyle = FontStyle.normal;

  const TxtStyleDetail(
      {this.fontSize = 5,
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
