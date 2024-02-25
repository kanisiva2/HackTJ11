import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vegan_model.dart';
export 'vegan_model.dart';

class VeganWidget extends StatefulWidget {
  const VeganWidget({super.key});

  @override
  State<VeganWidget> createState() => _VeganWidgetState();
}

class _VeganWidgetState extends State<VeganWidget> {
  late VeganModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VeganModel());
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
          setState(() => _model.vegan = !_model.vegan!);
        },
        value: _model.vegan!,
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
