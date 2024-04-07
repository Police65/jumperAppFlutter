import '/flutter_flow/flutter_flow_util.dart';
import 'team_member_details_widget.dart' show TeamMemberDetailsWidget;
import 'package:flutter/material.dart';

class TeamMemberDetailsModel extends FlutterFlowModel<TeamMemberDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
