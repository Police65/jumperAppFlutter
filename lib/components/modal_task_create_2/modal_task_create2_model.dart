import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'modal_task_create2_widget.dart' show ModalTaskCreate2Widget;
import 'package:flutter/material.dart';

class ModalTaskCreate2Model extends FlutterFlowModel<ModalTaskCreate2Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameController;
  String? Function(BuildContext, String?)? taskNameControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for statusSelect widget.
  String? statusSelectValue;
  FormFieldController<String>? statusSelectValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AllTasksRecord? taskCreated;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotesRecord? taskActivity;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskNameFocusNode?.dispose();
    taskNameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }
}
