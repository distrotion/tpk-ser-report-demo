import 'dart:async';
import 'dart:convert';

//----------------------------------------------------------------
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pick_edit_datatable/bloc/global.dart';
import 'package:pick_edit_datatable/tabletap/tabletap1/datatap1/datatap1.dart';
import 'package:pick_edit_datatable/tabletap/tabletap1/modelintable.dart';

import 'package:pick_edit_datatable/tabletap/tabletap2/datatap2/datatap2.dart';
import 'package:pick_edit_datatable/tabletap/tabletap2/modelintable.dart';

import 'datasequnce_event.dart';
import 'datatest.dart';
//----------------------------------------------------------------

// String server = "http://172.20.30.46:9200/";
String server = "http://127.0.0.1:9200/";

//------------------------------------------------------- First

class FetchDataTable1Bloc_RP
    extends Bloc<DataSequncePage1_RP, List<MainStrucTableTap1_RP>> {
  FetchDataTable1Bloc_RP() : super([]);

  @override
  Stream<List<MainStrucTableTap1_RP>> mapEventToState(
      DataSequncePage1_RP event) async* {
    if (event == DataSequncePage1_RP.select) {
      yield* selectData_fn_RP(state);
    }

    // else if (event == DataSequncePage1.update) {
    //   yield* updateData_fn(state);
    // } else if (event == DataSequncePage1.delete) {
    //   yield* deleteData_fn(state);
    // } else if (event == DataSequncePage1.insert) {
    //   yield* InsertData_fn(state);
    // }
  }
}

Stream<List<MainStrucTableTap1_RP>> selectData_fn_RP(
    List<MainStrucTableTap1_RP> state) async* {
  print("SELECT FUNCTION BLOC");
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "report_list"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap1_RP> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap1_RP(
      number: data_input[i]['PO'].toString(),
      field01: data_input[i]['CP'].toString(),
      field02: data_input[i]['data01'].toString(),
      field03: data_input[i]['data02'].toString(),
      field04: data_input[i]['data03'].toString(),
      field05: data_input[i]['data04'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

// Stream<List<MainStrucTableTap1>> updateData_fn(
//     List<MainStrucTableTap1> state) async* {
//   print("UPDATE FUNCTION BLOC");

//   var input_init = {
//     "Id": EditDataTable1buffer.number,
//     "Username": EditDataTable1buffer.field01,
//     "Password": EditDataTable1buffer.field02,
//     "Name": EditDataTable1buffer.field03,
//     "Section": EditDataTable1buffer.field04,
//     "RoleId": EditDataTable1buffer.field05
//   };

//   final response_init =
//       await http.post(Uri.parse(server + "report_list"), body: input_init);
//   //-------------------------------------------------------------------------
//   print("SELECT FUNCTION BLOC");
//   String input = "hi data";
//   final response =
//       await http.post(Uri.parse(server + "report_list"), body: input);

//   var data_input = [];
//   if (response.statusCode == 200) {
//     var databuff = jsonDecode(response.body);
//     data_input = databuff[0]['output'];
//     print(data_input);
//   } else {
//     print("where is my server");
//   }

//   List<MainStrucTableTap1> stateoutput = [];
//   for (var i = 0; i < data_input.length; i++) {
//     stateoutput.add(MainStrucTableTap1(
//       number: data_input[i]['PO'].toString(),
//       field01: data_input[i]['CP'].toString(),
//       field02: data_input[i]['data01'].toString(),
//       field03: data_input[i]['data02'].toString(),
//       field04: data_input[i]['data03'].toString(),
//       field05: data_input[i]['data04'].toString(),
//       field06: "",
//       field07: "",
//       field08: "",
//       field09: "",
//       field10: "",
//     ));
//   }

//   state = stateoutput;

//   yield state;
// }

// Stream<List<MainStrucTableTap1>> deleteData_fn(
//     List<MainStrucTableTap1> state) async* {
//   print("DELETE FUNCTION BLOC");
//   var input_init = {
//     "Id": DeleteDataTable1buffer.number,
//     "Username": DeleteDataTable1buffer.field01,
//     "Password": DeleteDataTable1buffer.field02,
//     "Name": DeleteDataTable1buffer.field03,
//     "Section": DeleteDataTable1buffer.field04,
//     "RoleId": DeleteDataTable1buffer.field05
//   };

//   final response_init =
//       await http.post(Uri.parse(server + "report_list"), body: input_init);
//   //-------------------------------------------------------------------------
//   String input = "hi data";
//   print("SELECT FUNCTION BLOC");
//   final response =
//       await http.post(Uri.parse(server + "report_list"), body: input);

//   var data_input = [];
//   if (response.statusCode == 200) {
//     var databuff = jsonDecode(response.body);
//     data_input = databuff[0]['output'];
//     // print(data_input);
//   } else {
//     print("where is my server");
//   }

//   List<MainStrucTableTap1> stateoutput = [];
//   for (var i = 0; i < data_input.length; i++) {
//     stateoutput.add(MainStrucTableTap1(
//       number: data_input[i]['PO'].toString(),
//       field01: data_input[i]['CP'].toString(),
//       field02: data_input[i]['data01'].toString(),
//       field03: data_input[i]['data02'].toString(),
//       field04: data_input[i]['data03'].toString(),
//       field05: data_input[i]['data04'].toString(),
//       field06: "",
//       field07: "",
//       field08: "",
//       field09: "",
//       field10: "",
//     ));
//   }

//   state = stateoutput;

//   yield state;
// }

// Stream<List<MainStrucTableTap1>> InsertData_fn(
//     List<MainStrucTableTap1> state) async* {
//   print("INSERT FUNCTION BLOC");
//   var input_init = {
//     "Id": "insert",
//     "Username": EditDataTable1buffer.field01,
//     "Password": EditDataTable1buffer.field02,
//     "Name": EditDataTable1buffer.field03,
//     "Section": EditDataTable1buffer.field04,
//     "RoleId": EditDataTable1buffer.field05
//   };

//   final response_init =
//       await http.post(Uri.parse(server + "report_list"), body: input_init);
//   //-------------------------------------------------------------------------
//   String input = "hi data";
//   print("SELECT FUNCTION BLOC");
//   final response =
//       await http.post(Uri.parse(server + "report_list"), body: input);

//   var data_input = [];
//   if (response.statusCode == 200) {
//     var databuff = jsonDecode(response.body);
//     data_input = databuff[0]['output'];
//     // print(data_input);
//   } else {
//     print("where is my server");
//   }

//   List<MainStrucTableTap1> stateoutput = [];
//   for (var i = 0; i < data_input.length; i++) {
//     stateoutput.add(MainStrucTableTap1(
//       number: data_input[i]['PO'].toString(),
//       field01: data_input[i]['CP'].toString(),
//       field02: data_input[i]['data01'].toString(),
//       field03: data_input[i]['data02'].toString(),
//       field04: data_input[i]['data03'].toString(),
//       field05: data_input[i]['data04'].toString(),
//       field06: "",
//       field07: "",
//       field08: "",
//       field09: "",
//       field10: "",
//     ));
//   }

//   state = stateoutput;

//   yield state;
// }

//------------------------------------------------------------------------------

class FetchDataTable2Bloc
    extends Bloc<DataSequncePage2_RP, List<MainStrucTableTap2_RP>> {
  FetchDataTable2Bloc() : super([]);

  @override
  Stream<List<MainStrucTableTap2_RP>> mapEventToState(
      DataSequncePage2_RP event) async* {
    if (event == DataSequncePage2_RP.select) {
      yield* selectData2_fn_RP(state);
    } else if (event == DataSequncePage2_RP.update) {
      yield* updateData2_fn_RP(state);
    } else if (event == DataSequncePage2_RP.delete) {
      yield* deleteData2_fn_RP(state);
    } else if (event == DataSequncePage2_RP.insert) {
      yield* InsertData2_fn_RP(state);
    }
  }
}

Stream<List<MainStrucTableTap2_RP>> selectData2_fn_RP(
    List<MainStrucTableTap2_RP> state) async* {
  print("SELECT FUNCTION BLOC 2");
  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "report_setup_list"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_RP> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_RP(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['CP'].toString(),
      field02: data_input[i]['Customer'].toString(),
      field03: data_input[i]['Materail'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['ReportType'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap2_RP>> updateData2_fn_RP(
    List<MainStrucTableTap2_RP> state) async* {
  print("UPDATE FUNCTION BLOC 2");

  var input_init = {
    "NO": EditDataTable2buffer_RP.number,
    "CP": EditDataTable2buffer_RP.field01,
    "Customer": EditDataTable2buffer_RP.field02,
    "Materail": EditDataTable2buffer_RP.field03,
    "Branch": EditDataTable2buffer_RP.field04,
    "ReportType": EditDataTable2buffer_RP.field05
  };

  final response_init = await http.post(Uri.parse(server + "report_setup_edit"),
      body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "report_setup_list"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_RP> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_RP(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['CP'].toString(),
      field02: data_input[i]['Customer'].toString(),
      field03: data_input[i]['Materail'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['ReportType'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

Stream<List<MainStrucTableTap2_RP>> deleteData2_fn_RP(
    List<MainStrucTableTap2_RP> state) async* {
  print("DELETE FUNCTION BLOC 2");
  var input_init = {
    "NO": EditDataTable2buffer_RP.number,
    "CP": EditDataTable2buffer_RP.field01,
    "Customer": EditDataTable2buffer_RP.field02,
    "Materail": EditDataTable2buffer_RP.field03,
    "Branch": EditDataTable2buffer_RP.field04,
    "ReportType": EditDataTable2buffer_RP.field05
  };

  final response_init = await http
      .post(Uri.parse(server + "report_setup_delete"), body: input_init);
  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "report_setup_list"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_RP> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_RP(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['CP'].toString(),
      field02: data_input[i]['Customer'].toString(),
      field03: data_input[i]['Materail'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['ReportType'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;

  yield state;
}

Stream<List<MainStrucTableTap2_RP>> InsertData2_fn_RP(
    List<MainStrucTableTap2_RP> state) async* {
  print("INSERT FUNCTION BLOC 2");
  var input_init = {
    "NO": EditDataTable2buffer_RP.number,
    "CP": EditDataTable2buffer_RP.field01,
    "Customer": EditDataTable2buffer_RP.field02,
    "Materail": EditDataTable2buffer_RP.field03,
    "Branch": EditDataTable2buffer_RP.field04,
    "ReportType": EditDataTable2buffer_RP.field05
  };

  final response_init =
      await http.post(Uri.parse(server + "report_setup_new"), body: input_init);

  //------------------------------------------------------------------------------

  String input = "hi data";
  final response =
      await http.post(Uri.parse(server + "report_setup_list"), body: input);

  var data_input = [];
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    print("where is my server");
  }

  List<MainStrucTableTap2_RP> stateoutput = [];
  for (var i = 0; i < data_input.length; i++) {
    stateoutput.add(MainStrucTableTap2_RP(
      number: data_input[i]['NO'].toString(),
      field01: data_input[i]['CP'].toString(),
      field02: data_input[i]['Customer'].toString(),
      field03: data_input[i]['Materail'].toString(),
      field04: data_input[i]['Branch'].toString(),
      field05: data_input[i]['ReportType'].toString(),
      field06: "",
      field07: "",
      field08: "",
      field09: "",
      field10: "",
    ));
  }

  state = stateoutput;
  yield state;
}

//------------------------------------------------------------------------------ dropdowndata

class DropDownData {
  List<String> list01 = [""];
  List<String> list02 = [""];
  List<String> list03 = [""];
  List<String> list04 = [""];
  List<String> list05 = [""];
  List<String> list06 = [""];
  List<String> list07 = [""];
  List<String> list08 = [""];
  List<String> list09 = [""];
  List<String> list10 = [""];

  DropDownData({
    required this.list01,
    required this.list02,
    required this.list03,
    required this.list04,
    required this.list05,
    required this.list06,
    required this.list07,
    required this.list08,
    required this.list09,
    required this.list10,
  });
}

DropDownData zeroDropDownData = DropDownData(
  list01: [],
  list02: [],
  list03: [],
  list04: [],
  list05: [],
  list06: [],
  list07: [],
  list08: [],
  list09: [],
  list10: [],
);

class Dropdowndata extends Bloc<dropdownrequrst, DropDownData> {
  Dropdowndata() : super(zeroDropDownData);

  @override
  Stream<DropDownData> mapEventToState(dropdownrequrst event) async* {
    if (event == dropdownrequrst.set04) {
      yield* set_04(state);
    } else if (event == dropdownrequrst.set06) {
      yield* set_06(state);
    } else if (event == dropdownrequrst.set07) {
      yield* set_07(state);
    } else if (event == dropdownrequrst.set10) {
      yield* set_10(state);
    } else if (event == dropdownrequrst.set11) {
      yield* set_11(state);
    } else if (event == dropdownrequrst.set12) {
      yield* set_12(state);
    }
  }
}

Stream<DropDownData> set_04(DropDownData state) async* {
  final response =
      await http.post(Uri.parse(server + "set_04"), body: {"Qurey": ""});

  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      // print(data_input['list01'][i].toString());
      state.list01.add(data_input['list01'][i].toString());
    }

    print(state.list01);

    for (var i = 0; i < data_input['list02'].length; i++) {
      // print(data_input['list02'][i].toString());
      state.list02.add(data_input['list02'][i].toString());
    }

    for (var i = 0; i < data_input['list03'].length; i++) {
      // print(data_input['list03'][i].toString());
      state.list03.add(data_input['list03'][i].toString());
    }

    for (var i = 0; i < data_input['list04'].length; i++) {
      // print(data_input['list04'][i].toString());
      state.list04.add(data_input['list04'][i].toString());
    }

    for (var i = 0; i < data_input['list05'].length; i++) {
      // print(data_input['list05'][i].toString());
      state.list05.add(data_input['list05'][i].toString());
    }

    for (var i = 0; i < data_input['list06'].length; i++) {
      // print(data_input['list06'][i].toString());
      state.list06.add(data_input['list06'][i].toString());
    }

    for (var i = 0; i < data_input['list07'].length; i++) {
      // print(data_input['list07'][i].toString());
      state.list07.add(data_input['list07'][i].toString());
    }

    // TB4data.tb401 = state.list01;
    // TB4data.tb402 = state.list02;
    // TB4data.tb403 = state.list03;
    // TB4data.tb404 = state.list04;
    // TB4data.tb405 = state.list05;
    // TB4data.tb406 = state.list06;
    // TB4data.tb407 = state.list07;

    state.list08 = [""];
    state.list09 = [""];
    state.list10 = [""];
  } else {
    state.list01 = [""];
    state.list02 = [""];
    state.list03 = [""];
    state.list04 = [""];
    state.list05 = [""];
    state.list06 = [""];
    state.list07 = [""];
    state.list08 = [""];
    state.list09 = [""];
    state.list10 = [""];
  }

  // print(state.list01);
  // print(state.list02);
  // print(state.list03);

  yield state;
}

Stream<DropDownData> set_06(DropDownData state) async* {
  final response =
      await http.post(Uri.parse(server + "set_06"), body: {"Qurey": ""});

  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i].toString());
    }

    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

Stream<DropDownData> set_07(DropDownData state) async* {
  final response =
      await http.post(Uri.parse(server + "set_07"), body: {"Qurey": ""});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i]);
    }

    for (var i = 0; i < data_input['list02'].length; i++) {
      state.list02.add(data_input['list02'][i]);
    }

    for (var i = 0; i < data_input['list03'].length; i++) {
      state.list03.add(data_input['list03'][i]);
    }
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

Stream<DropDownData> set_10(DropDownData state) async* {
  final response =
      await http.post(Uri.parse(server + "set_10"), body: {"Qurey": ""});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();

    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i]);
    }

    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

Stream<DropDownData> set_11(DropDownData state) async* {
  final response =
      await http.post(Uri.parse(server + "set_11"), body: {"Qurey": ""});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    // print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();
    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i]);
    }

    for (var i = 0; i < data_input['list02'].length; i++) {
      state.list02.add(data_input['list02'][i]);
    }

    for (var i = 0; i < data_input['list03'].length; i++) {
      state.list03.add(data_input['list03'][i]);
    }
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

Stream<DropDownData> set_12(DropDownData state) async* {
  final response =
      await http.post(Uri.parse(server + "set_12"), body: {"Qurey": ""});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
  } else {
    data_input = '';
    print("where is my server");
  }

  if (data_input != '') {
    state.list01.clear();
    state.list02.clear();
    state.list03.clear();
    state.list04.clear();
    state.list05.clear();
    state.list06.clear();
    state.list07.clear();
    state.list08.clear();
    state.list09.clear();
    state.list10.clear();
    for (var i = 0; i < data_input['list01'].length; i++) {
      state.list01.add(data_input['list01'][i]);
    }

    for (var i = 0; i < data_input['list02'].length; i++) {
      state.list02.add(data_input['list02'][i]);
    }
    for (var i = 0; i < data_input['list03'].length; i++) {
      state.list03.add(data_input['list03'][i]);
    }
    for (var i = 0; i < data_input['list04'].length; i++) {
      state.list04.add(data_input['list04'][i]);
    }

    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  } else {
    state.list01 = [];
    state.list02 = [];
    state.list03 = [];
    state.list04 = [];
    state.list05 = [];
    state.list06 = [];
    state.list07 = [];
    state.list08 = [];
    state.list09 = [];
    state.list10 = [];
  }
  yield state;
}

//--------------------------------

class CallDropDownDataS {
  String data01 = '';
  String data02 = '';
  String data03 = '';
  String data04 = '';
  String data05 = '';
  String data06 = '';
  String data07 = '';
  String data08 = '';
  String data09 = '';
  String data10 = '';

  CallDropDownDataS({
    required this.data01,
    required this.data02,
    required this.data03,
    required this.data04,
    required this.data05,
    required this.data06,
    required this.data07,
    required this.data08,
    required this.data09,
    required this.data10,
  });
}

CallDropDownDataS ZeCallDropdowndata = CallDropDownDataS(
    data01: '',
    data02: '',
    data03: '',
    data04: '',
    data05: '',
    data06: '',
    data07: '',
    data08: '',
    data09: '',
    data10: '');

class CallDropdowndata extends Bloc<calldropdownrequrst, CallDropDownDataS> {
  CallDropdowndata() : super(ZeCallDropdowndata);

  @override
  Stream<CallDropDownDataS> mapEventToState(calldropdownrequrst event) async* {
    if (event == calldropdownrequrst.set04_1) {
      yield* set_04_1(state);
    } else if (event == calldropdownrequrst.set06_1) {
      yield* set_06_1(state);
    } else if (event == calldropdownrequrst.set07_1) {
      yield* set_07_1(state);
    } else if (event == calldropdownrequrst.set07_2) {
      yield* set_07_2(state);
    } else if (event == calldropdownrequrst.set10_1) {
      yield* set_10_1(state);
    } else if (event == calldropdownrequrst.set11_1) {
      yield* set_11_1(state);
    } else if (event == calldropdownrequrst.set12_1) {
      yield* set_12_1(state);
    } else if (event == calldropdownrequrst.set12_2) {
      yield* set_12_2(state);
    } else if (event == calldropdownrequrst.set12_3) {
      yield* set_12_3(state);
    } else if (event == calldropdownrequrst.set12_4) {
      yield* set_12_4(state);
    }
  }
}

Stream<CallDropDownDataS> set_04_1(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_04_1call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable4.field01 = data_input['data01'];
    // EditDataTable4.field03 = data_input['data02'];
    // EditDataTable4.field04 = data_input['data03'];
    // EditDataTable4.field05 = data_input['data04'];
    // EditDataTable4buffer.field01 = data_input['data01'];
    // EditDataTable4buffer.field03 = data_input['data02'];
    // EditDataTable4buffer.field04 = data_input['data03'];
    // EditDataTable4buffer.field05 = data_input['data04'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_06_1(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_06_1call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable6.field01 = data_input['data02'];
    // EditDataTable6buffer.field01 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_07_1(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_07_1call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable7.field01 = data_input['data02'];
    // EditDataTable7buffer.field01 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_07_2(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_07_2call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable7.field03 = data_input['data04'];
    // EditDataTable7buffer.field03 = data_input['data04'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_10_1(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_10_1call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable10.field01 = data_input['data02'];
    // EditDataTable10buffer.field01 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_11_1(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_11_1call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable11.field01 = data_input['data02'];
    // EditDataTable11buffer.field01 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_12_1(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_12_1call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable12.field01 = data_input['data02'];
    // EditDataTable12buffer.field01 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_12_2(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_12_2call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable12.field03 = data_input['data04'];
    // EditDataTable12buffer.field03 = data_input['data04'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_12_3(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_12_3call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable12.field05 = data_input['data02'];
    // EditDataTable12buffer.field05 = data_input['data02'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}

Stream<CallDropDownDataS> set_12_4(CallDropDownDataS state) async* {
  final response =
      await http.post(Uri.parse(server + "set_12_4call"), body: {"Qurey": ''});
  var data_input;
  if (response.statusCode == 200) {
    var databuff = jsonDecode(response.body);
    data_input = databuff[0]['output'];
    print(data_input);
    // EditDataTable12.field07 = data_input['data04'];
    // EditDataTable12buffer.field07 = data_input['data04'];
  } else {
    data_input = '';
    print("where is my server");
  }

  yield state;
}
