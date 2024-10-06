import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'UiControlsScreen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UIControlsView(),
    );
  }
}

enum TransportMode {
  car,
  moto,
  bicycle,
  airplane,
  submarine,
}

class _UIControlsView extends StatefulWidget {
  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloperMode = false;
  bool wantsLaunch = false;
  bool wantsDinner = false;
  bool wantsBreakfast = false;
  TransportMode selectedTransportMode = TransportMode.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Enable or disable developer mode'),
          value: isDeveloperMode,
          onChanged: (_) {
            isDeveloperMode = !isDeveloperMode;
            setState(() {});
          },
        ),
        ExpansionTile(
          title: const Text('Transport mode'),
          subtitle: _EnumTextWidget(transportMode: selectedTransportMode),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Travel by car'),
              value: TransportMode.car,
              groupValue: selectedTransportMode,
              onChanged: (value) =>
                  setState(() => selectedTransportMode = TransportMode.car),
            ),
            RadioListTile(
              title: const Text('Moto'),
              subtitle: const Text('Travel by moto'),
              value: TransportMode.moto,
              groupValue: selectedTransportMode,
              onChanged: (value) =>
                  setState(() => selectedTransportMode = TransportMode.moto),
            ),
            RadioListTile(
              title: const Text('Bicycle'),
              subtitle: const Text('Travel by bicycle'),
              value: TransportMode.bicycle,
              groupValue: selectedTransportMode,
              onChanged: (value) =>
                  setState(() => selectedTransportMode = TransportMode.bicycle),
            ),
            RadioListTile(
              title: const Text('Airplane'),
              subtitle: const Text('Travel by airplane'),
              value: TransportMode.airplane,
              groupValue: selectedTransportMode,
              onChanged: (value) => setState(
                  () => selectedTransportMode = TransportMode.airplane),
            ),
            RadioListTile(
              title: const Text('Submarine'),
              subtitle: const Text('Travel by submarine'),
              value: TransportMode.submarine,
              groupValue: selectedTransportMode,
              onChanged: (value) => setState(
                  () => selectedTransportMode = TransportMode.submarine),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Wants breakfast'),
          value: wantsBreakfast,
          onChanged: (_) => setState(() => wantsBreakfast = !wantsBreakfast),
        ),
        CheckboxListTile(
          title: const Text('Wants launch'),
          value: wantsLaunch,
          onChanged: (_) => setState(() => wantsLaunch = !wantsLaunch),
        ),
        CheckboxListTile(
          title: const Text('Wants dinner'),
          value: wantsDinner,
          onChanged: (_) => setState(() => wantsDinner = !wantsDinner),
        ),
      ],
    );
  }
}

class _EnumTextWidget extends StatelessWidget {
  final TransportMode transportMode;

  const _EnumTextWidget({required this.transportMode});

  @override
  Widget build(BuildContext context) {
    String transportModeName = transportMode.toString().split('.').last;

    return Text(_capitalize(transportModeName));
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }
}
