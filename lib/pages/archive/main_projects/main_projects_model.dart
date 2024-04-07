import '/components/u_i_components/drawer_nav/drawer_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_projects_widget.dart' show MainProjectsWidget;
import 'package:flutter/material.dart';

class MainProjectsModel extends FlutterFlowModel<MainProjectsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerNav component.
  late DrawerNavModel drawerNavModel;

  @override
  void initState(BuildContext context) {
    drawerNavModel = createModel(context, () => DrawerNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerNavModel.dispose();
  }
}
