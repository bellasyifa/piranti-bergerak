import 'package:intl/intl.dart';

const umr = 3800000;

var numFormat = NumberFormat("#,000");
var dateFormat = DateFormat("yyyy-MM-dd");

abstract class Employee {
  int nip;
  String name;
  String? address;
  int tahunMasuk;
  int _gaji = umr;

  Employee(this.nip, this.name, {this.tahunMasuk = 2010});

  void presensi(DateTime jamMasuk) {
    if (jamMasuk.hour > 8) {
      print("$name pada ${dateFormat.format(jamMasuk)} Datang terlambat");
    } else {
      print("$name pada ${dateFormat.format(jamMasuk)} datang tepat waktu");
    }
  }

  String deskripsi() {
    String teks = """==================
    NIP: $nip
    Nama: $name
    Gaji: ${numFormat.format(gaji)}
    """;
    if (address != null) {
      teks += "\n Alamat: $address";
    }
    return teks;
  }

  int get tunjangan => ((2023 - tahunMasuk) < 5) ? 500000 : 1000000;

  int get gaji => (_gaji + tunjangan);

  set gaji(int gaji) {
    if (gaji < umr) {
      _gaji = umr;
      print("Gaji $name, tidak boleh di bawah umr");
    } else {
      _gaji = gaji;
    }
  }
}

enum TipeJabatan { kabag, manajer, direktur }

class Pejabat extends Employee {
  TipeJabatan jabatan;

  Pejabat(super.nip, super.name, this.jabatan);

  @override
  void presensi(DateTime jamMasuk) {
    if (jamMasuk.hour > 9) {
      print("$name Datang terlambat");
    } else {
      print("$name datang tepat waktu");
    }
  }

  @override
  int get tunjangan {
    if (jabatan == TipeJabatan.manajer) {
      return 1500000;
    } else if (jabatan == TipeJabatan.manajer) {
      return 2500000;
    } else {
      return 5000000;
    }
  }

  @override
  String deskripsi() {
    String teks = super.deskripsi();
    teks += "\n Jabatan:${jabatan.name}";
    return teks;
  }
}

class StafBiasa extends Employee {
  StafBiasa(super.nip, super.name, {tahunMasuk = 2015});

  @override
  void presensi(DateTime jamMasuk) {
    if (jamMasuk.hour > 8) {
      print("$name Datang terlambat");
    } else {
      print("$name datang tepat waktu");
    }
  }

  @override
  int get tunjangan => ((2023 - tahunMasuk) < 5) ? 500000 : 1000000;
}
