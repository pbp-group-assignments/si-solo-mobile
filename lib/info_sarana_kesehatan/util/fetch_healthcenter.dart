import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/info_sarana_kesehatan/model/healthcenter.dart';

Future<List<HealthCenter>> fetchHealthCenter() async {
	var url = Uri.parse('https://si-solo.up.railway.app/info-sarana-kesehatan/json/healthcenter');
	var response = await http.get(
		url,
		headers: {
			"Access-Control-Allow-Origin": "*",
			"Content-Type": "application/json",
		},
	);

	// melakukan decode response menjadi bentuk json
	var data = jsonDecode(utf8.decode(response.bodyBytes));

	// melakukan konversi data json menjadi object HealthCenter
	List<HealthCenter> listHealthCenter = [];
	for (var d in data) {
		if (d != null) {
			listHealthCenter.add(HealthCenter.fromJson(d));
		}
	}

	return listHealthCenter;
}