import '/flutter_flow/flutter_flow_util.dart';
import 'modal_project_widget.dart' show ModalProjectWidget;
import 'package:flutter/material.dart';

class ModalProjectModel extends FlutterFlowModel<ModalProjectWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
