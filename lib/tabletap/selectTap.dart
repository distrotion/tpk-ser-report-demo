import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_edit_datatable/tabletap/tabletap1/tablestruc1.dart';
import 'package:pick_edit_datatable/widget/ComBtnBlackBorder.dart';
import '../bloc/BlocPageRebuild.dart';
import 'tabletap2/tablestruc2.dart';

int selectedTap_RP = 1;

class TapMainBody_RP extends StatelessWidget {
  const TapMainBody_RP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            constraints: BoxConstraints(maxWidth: 1250, minHeight: 400),
            // color: Colors.blue,
            // width: double.infinity,
            // height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // color: Colors.red,
                    height: 80,
                    constraints: BoxConstraints(maxWidth: 1250, maxHeight: 80),
                    child: alltap(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: PageSelectFunc(selectedTap_RP),
                  )
                ],
              ),
            )));
  }
}

class alltap extends StatelessWidget {
  const alltap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wi = 200;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  ComBtnBlackBorder(
                      sLabel: "Report",
                      cBg: selectedTap_RP == 1
                          ? Colors.black
                          : Colors.transparent,
                      cText: selectedTap_RP == 1 ? Colors.white : null,
                      func: () {
                        selectedTap_RP = 1;
                        BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      },
                      nWidth: wi),
                  ComBtnBlackBorder(
                      sLabel: "Report Setup",
                      cBg: selectedTap_RP == 2
                          ? Colors.black
                          : Colors.transparent,
                      cText: selectedTap_RP == 2 ? Colors.white : null,
                      func: () {
                        selectedTap_RP = 2;
                        BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
                      },
                      nWidth: wi),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget PageSelectFunc(int page) {
  Widget Pageoutput = TableTap1Struc();

  if (page == 1) {
    Pageoutput = TableTap1Struc();
  } else if (page == 2) {
    Pageoutput = TableTap2Struc();
  }

  return Pageoutput;
}
