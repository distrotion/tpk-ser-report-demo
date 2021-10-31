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

import 'datatap12/datatap12.dart';
import 'modelintable.dart';
import 'tablestruc12.dart';

int ListTable12Status = 0;

class DataListTable12 extends StatefulWidget {
  DataListTable12(
      {Key? key, required this.datainput, required this.dropdowndata})
      : super(key: key);
  final List<MainStrucTableTap12> datainput;
  DropDownData dropdowndata;
  @override
  _DataListTable12State createState() => _DataListTable12State();
}

class _DataListTable12State extends State<DataListTable12> {
  int nCurrentSortIndex = 0; //index from Header DataColumn
  bool isSortAscending = true;

  @override
  Widget build(BuildContext context) {
    List<MainStrucTableTap12> Listdata_Clone = widget.datainput;

    double nDataColumnWidth = 100;
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
        }
      }
      //BlocPatientList.sort();
      setState(() {
        nCurrentSortIndex = columnIndex;
        isSortAscending = ascending;
      });
    }

    //------------------------------------------------------------------------------------------------

    void _tapView(MainStrucTableTap12 s) {
      //click all
      // print("123");
      ListTable12Status = 1;
      EditDataTable12 = s;
      EditDataTable12buffer = s;
      undercontroltap12 = true;
      GroupName12 = s.field02;
      SampleTypeName12 = s.field04;
      InsrumentName12 = s.field06;
      ItemName12 = s.field08;
      context.read<FetchDataTable12Bloc>().add(DataSequncePage12.select);
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
    void _Edit(MainStrucTableTap12 s) {
      _CloseYNPopup();
      BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _Delete(String s) {
      _CloseYNPopup();
      context.read<FetchDataTable12Bloc>().add(DataSequncePage12.delete);
    }

    void _tapEdit(MainStrucTableTap12 s) {
      // _CallYNPopup('Edit ${s}', 'Do you want to Edit ${s} now?', 'Yes', 'No',
      //     _Edit, _CloseYNPopup, s, false);
      EditDataTable12 = s;
      EditDataTable12buffer = s;
      undercontroltap12 = true;
      context.read<FetchDataTable12Bloc>().add(DataSequncePage12.select);
      // BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
    }

    void _tapDelete(MainStrucTableTap12 s) {
      DeleteDataTable12buffer.number = s.number;
      DeleteDataTable12buffer.field01 = s.field01;
      DeleteDataTable12buffer.field02 = s.field02;
      DeleteDataTable12buffer.field03 = s.field03;
      DeleteDataTable12buffer.field04 = s.field04;
      DeleteDataTable12buffer.field05 = s.field05;
      DeleteDataTable12buffer.field06 = s.field06;
      DeleteDataTable12buffer.field07 = s.field07;
      DeleteDataTable12buffer.field08 = s.field08;
      DeleteDataTable12buffer.field09 = s.field09;
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
      TableTap12nPage, //data
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
                      ListTable12Status = 0;
                      MainStrucTableTap12 Zerodata = MainStrucTableTap12(
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
                    1, "NO", 'Sort Field 1', nDataColumnWidth, tapSort),
                _getDataColumn(
                    2, "GroupId", 'Sort Field 2', nDataColumnWidth, tapSort),
                _getDataColumn(
                    3, "GroupName", 'Sort Field 3', nDataColumnWidth, tapSort),
                _getDataColumn(4, "SampleTypeId", 'Sort Field 4',
                    nDataColumnWidth, tapSort),
                _getDataColumn(5, "SampleTypeName", 'Sort Field 5',
                    nDataColumnWidth, tapSort),
                _getDataColumn(6, "InstrumentId", 'Sort Field 6',
                    nDataColumnWidth, tapSort),
                _getDataColumn(7, "InsrumentName", 'Sort Field 7',
                    nDataColumnWidth, tapSort),
                _getDataColumn(
                    8, "ItemId", 'Sort Field 8', nDataColumnWidth, tapSort),
                _getDataColumn(
                    9, "ItemName", 'Sort Field 9', nDataColumnWidth, tapSort),
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
  List<MainStrucTableTap12> Listdata_Clone,
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
  int nStartCell = (currentPage - 1) * nTableCellPerEachPageTable12;

  List<DataRow> dataRowList = [];
  for (int n = nStartCell;
      n < (nStartCell + nTableCellPerEachPageTable12);
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
    double nDataColumnWidth,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    // enumScreenResponsiveList screenResponsive,
    Function funcView,
    Function funcEdit,
    Function funcDelete,
    MainStrucTableTap12 getData) {
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
        // _getDataCell_Label(field09, nDataColumnWidth),
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
    MainStrucTableTap12 GetData) {
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

void _ConsoleBox(MainStrucTableTap12 input, BuildContext contextinput,
    DropDownData dropdowndata) {
  showDialog(
    context: contextinput,
    barrierDismissible: true,
    builder: (BuildContext context) {
      DropDownData _datadropdown = dropdowndata;
      List<String> _list1 = _datadropdown.list01;
      List<String> _list2 = _datadropdown.list02;
      List<String> _list3 = _datadropdown.list03;
      List<String> _list4 = _datadropdown.list04;

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
            width: 900,
            height: 390,
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
                            width: 450,
                            height: 20,
                            // color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("NO")),
                        ),
                        Container(
                          width: 400,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                            isContr: undercontroltap12,
                            fnContr: (input) {
                              undercontroltap12 = input;
                            },
                            sValue: EditDataTable12.number,
                            returnfunc: () {},
                            isEnabled: false,
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("GroupId")),
                        ),
                        Container(
                          width: 400,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                              isEnabled: false,
                              isContr: undercontroltap12,
                              fnContr: (input) {
                                undercontroltap12 = input;
                              },
                              sValue: EditDataTable12.field01,
                              returnfunc: (String s) {
                                EditDataTable12buffer.field01 = s;
                              }),
                        ),
                        SizedBox(
                          width: 400,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("GroupName")),
                        ),
                        // Container(
                        //   width: 400,
                        //   height: 40,
                        //   // color: Colors.red,
                        //   child: ComInputText(
                        //     isContr: undercontroltap12,
                        //     fnContr: (input) {
                        //       undercontroltap12 = input;
                        //     },
                        //     sValue: EditDataTable12.field02,
                        //     returnfunc: (String s) {
                        //       EditDataTable12buffer.field02 = s;
                        //     },
                        //   ),
                        // ),
                        AdvanceDropDown(
                          width: 400,
                          height: 40,
                          value: GroupName12,
                          onChangeinside: (newValue) {
                            GroupName12 = newValue!;
                            EditDataTable12buffer.field02 = newValue;
                            undercontroltap12 = true;
                            _onLoading(
                                contextinput,
                                contextinput
                                    .read<CallDropdowndata>()
                                    .add(calldropdownrequrst.set12_1));
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list1,
                        ),
                        SizedBox(
                          width: 400,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("SampleTypeId")),
                        ),
                        Container(
                          width: 400,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                            isEnabled: false,
                            isContr: undercontroltap12,
                            fnContr: (input) {
                              undercontroltap12 = input;
                            },
                            sValue: EditDataTable12.field03,
                            returnfunc: (String s) {
                              EditDataTable12buffer.field03 = s;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("SampleTypeName")),
                        ),
                        // Container(
                        //   width: 400,
                        //   height: 40,
                        //   // color: Colors.red,
                        //   child: ComInputText(
                        //     isContr: undercontroltap12,
                        //     fnContr: (input) {
                        //       undercontroltap12 = input;
                        //     },
                        //     sValue: EditDataTable12.field04,
                        //     returnfunc: (String s) {
                        //       EditDataTable12buffer.field04 = s;
                        //     },
                        //   ),
                        // ),
                        AdvanceDropDown(
                          width: 400,
                          height: 40,
                          value: SampleTypeName12,
                          onChangeinside: (newValue) {
                            SampleTypeName12 = newValue!;
                            EditDataTable12buffer.field04 = newValue;
                            undercontroltap12 = true;
                            _onLoading(
                                contextinput,
                                contextinput
                                    .read<CallDropdowndata>()
                                    .add(calldropdownrequrst.set12_2));
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
                            width: 450,
                            height: 20,
                            // color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("InstrumentId")),
                        ),
                        Container(
                          width: 400,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                            isEnabled: false,
                            isContr: undercontroltap12,
                            fnContr: (input) {
                              undercontroltap12 = input;
                            },
                            sValue: EditDataTable12.field05,
                            returnfunc: (String s) {
                              EditDataTable12buffer.field05 = s;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("InsrumentName")),
                        ),
                        // Container(
                        //   width: 400,
                        //   height: 40,
                        //   // color: Colors.red,
                        //   child: ComInputText(
                        //     isContr: undercontroltap12,
                        //     fnContr: (input) {
                        //       undercontroltap12 = input;
                        //     },
                        //     sValue: EditDataTable12.field06,
                        //     returnfunc: (String s) {
                        //       EditDataTable12buffer.field06 = s;
                        //     },
                        //   ),
                        // ),
                        AdvanceDropDown(
                          width: 400,
                          height: 40,
                          value: InsrumentName12,
                          onChangeinside: (newValue) {
                            InsrumentName12 = newValue!;
                            EditDataTable12buffer.field06 = newValue;
                            undercontroltap12 = true;
                            _onLoading(
                                contextinput,
                                contextinput
                                    .read<CallDropdowndata>()
                                    .add(calldropdownrequrst.set12_3));
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list3,
                        ),
                        SizedBox(
                          width: 400,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("ItemId")),
                        ),
                        Container(
                          width: 400,
                          height: 40,
                          // color: Colors.red,
                          child: ComInputText(
                            isEnabled: false,
                            isContr: undercontroltap12,
                            fnContr: (input) {
                              undercontroltap12 = input;
                            },
                            sValue: EditDataTable12.field07,
                            returnfunc: (String s) {
                              EditDataTable12buffer.field07 = s;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 15,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("ItemName")),
                        ),
                        // Container(
                        //   width: 400,
                        //   height: 40,
                        //   // color: Colors.red,
                        //   child: ComInputText(
                        //     isContr: undercontroltap12,
                        //     fnContr: (input) {
                        //       undercontroltap12 = input;
                        //     },
                        //     sValue: EditDataTable12.field08,
                        //     returnfunc: (String s) {
                        //       EditDataTable12buffer.field08 = s;
                        //     },
                        //   ),
                        // ),
                        AdvanceDropDown(
                          width: 400,
                          height: 40,
                          value: ItemName12,
                          onChangeinside: (newValue) {
                            ItemName12 = newValue!;
                            EditDataTable12buffer.field08 = newValue;
                            undercontroltap12 = true;
                            _onLoading(
                                contextinput,
                                contextinput
                                    .read<CallDropdowndata>()
                                    .add(calldropdownrequrst.set12_4));
                            BlocProvider.of<BlocPageRebuild>(contextinput)
                                .rebuildPage();
                          },
                          listdropdown: _list4,
                        ),
                        SizedBox(
                          height: 55,
                        )
                      ],
                    )
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
                              // EditDataTable12buffer = EditDataTable12;
                              contextinput.read<FetchDataTable12Bloc>().add(
                                  DataSequncePage12
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
                              undercontroltap12 = true;
                              EditDataTable12 = MainStrucTableTap12(
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
                            nWidth: 134),
                        SizedBox(
                          width: 10,
                        ),
                        ComBtnBlackBorder(
                            sLabel: "Insert",
                            func: () {
                              contextinput
                                  .read<FetchDataTable12Bloc>()
                                  .add(DataSequncePage12.insert);
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
