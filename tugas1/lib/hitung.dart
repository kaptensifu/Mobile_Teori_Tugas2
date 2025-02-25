import 'package:flutter/material.dart';

class HitungPage extends StatefulWidget {
  const HitungPage({Key? key}) : super(key: key);

  @override
  _HitungPageState createState() => _HitungPageState();
}

class _HitungPageState extends State<HitungPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _digitController = TextEditingController();

  String _result = '';
  String _digitInfo = '';

  void _tambah() {
    final num1 = int.tryParse(_num1Controller.text) ?? 0;
    final num2 = int.tryParse(_num2Controller.text) ?? 0;
    setState(() {
      _result = 'Hasil Penjumlahan: ${num1 + num2}';
    });
  }

  void _kurang() {
    final num1 = int.tryParse(_num1Controller.text) ?? 0;
    final num2 = int.tryParse(_num2Controller.text) ?? 0;
    setState(() {
      _result = 'Hasil Pengurangan: ${num1 - num2}';
    });
  }

  void _cekDigit() {
    final input = _digitController.text;
    if (input.isNotEmpty && int.tryParse(input) != null) {
      final angka = int.parse(input);
      final panjang = input.length;
      final jenis = angka % 2 == 0 ? 'Genap' : 'Ganjil';
      setState(() {
        _digitInfo = 'Digit: $panjang, Angka tersebut adalah $jenis';
      });
    } else {
      setState(() {
        _digitInfo = 'Masukkan angka yang valid!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent, title: Center(child: const Text('Fitur'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              decoration: const InputDecoration(labelText: 'Masukkan Angka Pertama'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration: const InputDecoration(labelText: 'Masukkan Angka Kedua'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _tambah,
                  child: const Text('Tambah'),
                ),
                ElevatedButton(
                  onPressed: _kurang,
                  child: const Text('Kurang'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),

            // Input untuk cek digit dan ganjil/genap
            TextField(
              controller: _digitController,
              decoration: const InputDecoration(labelText: 'Masukkan Angka untuk Cek Digit & Ganjil/Genap'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _cekDigit,
              child: const Text('Cek Digit & Ganjil/Genap'),
            ),
            const SizedBox(height: 20),
            Text(_digitInfo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
