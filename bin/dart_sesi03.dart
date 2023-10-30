//import 'package:dart_sesi03/dart_sesi03.dart' as dart_sesi03;
import 'package:dart_sesi03/employee.dart';
import 'package:dart_sesi03/dummy_data.dart';

void main(List<String> arguments) {
  List<Employee> dataEmployee = genData(dummyData());

  dataEmployee[0].presensi(DateTime.parse('2023-10-15 09:58:30'));
  dataEmployee[1].presensi(DateTime.parse('2023-10-15 08:58:30'));
  dataEmployee[2].presensi(DateTime.parse('2023-10-15 09:01:30'));

  dataEmployee[0].gaji = 1500000;
  dataEmployee[1].gaji = 500000;
  dataEmployee[2].gaji = 4500000;

  dataEmployee[1].address = "Bandung TImur, Jawa Barat Indonesia";
  dataEmployee[1].address = "jl. Sukamenak no. 111b kab. Bandung";

  for (var staff in dataEmployee) {
    print(staff.deskripsi());
  }
}

List<Employee> genData(var listData) {
  List<Employee> data = [];
  for (var dataPegawai in listData) {
    Employee employee;
    if (dataPegawai.containsKey('jabatan')) {
      employee = Pejabat(
          dataPegawai['nip'], dataPegawai['name'], dataPegawai['jabatan']);
    } else {
      employee = StafBiasa(dataPegawai['nip'], dataPegawai['name']);
    }

    if (dataPegawai.containsKey('tahun_masuk')) {
      employee.tahunMasuk = dataPegawai['tahun_masuk'];
    }
    data.add(employee);
  }
  return data;
}
