import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gluten_free_model.dart';
export 'gluten_free_model.dart';

class GlutenFreeWidget extends StatefulWidget {
  const GlutenFreeWidget({super.key});

  @override
  State<GlutenFreeWidget> createState() => _GlutenFreeWidgetState();
}

class _GlutenFreeWidgetState extends State<GlutenFreeWidget> {
  late GlutenFreeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlutenFreeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: ToggleIcon(
        onPressed: () async {
          setState(() => _model.glutenFree = !_model.glutenFree!);
        },
        value: _model.glutenFree!,
        onIcon: Icon(
          Icons.circle,
          color: FlutterFlowTheme.of(context).primary,
          size: 25.0,
        ),
        offIcon: Icon(
          Icons.circle_outlined,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 25.0,
        ),
      ),
    );
  }
}
