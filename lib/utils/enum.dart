enum ActivityType {

  kampusMengajar("Kampus Mengajar", 0),
  pertukaranMahasiswa("Pertukaran Mahasiswa", 1),
  magangMerdeka("Magang Merdeka", 2),
  studiIndepenen("Studi Independen", 3),
  wirausahaMerdeka("Wirausaha Merdeka", 4),
  pertukaranMahasiswaInternasional("Pertukaran Mahasiswa", 5);

  final String name;
  final int type;

  const ActivityType(this.name, this.type);

}

enum ActivityStatus {

  seleksiAdministratif("Seleksi Administratif", 0),
  lolosAdministratif("Lolos Administratif", 1),
  tidakMemenuhi("Tidak Memenuhi", 2),
  diterima("Diterima", 3),
  ditolak("Ditolak", 4),
  berakhir("Berakhir", 5);

  final String name;
  final int status;

  const ActivityStatus(this.name, this.status);

}

enum DocumentStatus {
  sedangDiproses("Sedang Diproses", 0),
  diterima("Diterima", 1);

  final String name;
  final int status;

  const DocumentStatus(this.name, this.status);

}