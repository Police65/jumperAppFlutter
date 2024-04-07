import '/flutter_flow/flutter_flow_util.dart';
import 'create_project_widget.dart' show CreateProjectWidget;
import 'package:flutter/material.dart';

class CreateProjectModel extends FlutterFlowModel<CreateProjectWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameController;
  String? Function(BuildContext, String?)? taskNameControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    taskNameFocusNode?.dispose();
    taskNameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }
}
