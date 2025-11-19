
# Wonderwall Kicks - Flutter Project

# Link Repository

Berikut merupakan link repository dari projek Wonderwall Kicks:

[https://github.com/andimaaura/wonderwall-kicks]


# TUGAS 7

1) Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.


Wdiget tree merupakan struktur ierarki yang memberikan gambaran susunan seluruh widget pada proyek Flutter. Setiap elemen UI, seperti text, tombol, maupun gambar merupakan bagian dari pohon ini. Pada hubungan parent-child, widgent parent berfungsi mengatur posisi serta perilaku widget child. Misal, pada kode yang telah di buat, Column menjadi parent yang mengatur posisi Text, Row, dan GridView secara vertikal, sedangkan child menyesuaikan diri dengan tata letak yang telah ditentukan parent

2) Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.


Widget utama yang digunakan ialah:
    a. MaterialApp sebagai root aplikasi yang dapat mengatur tema, warna, dan navigasi
    b. Scaffold yang menjadi kerangka utama halaman, yang memiliki struktur dasar seperti AppBar dan body
    c. AppBar yang menujukkan elemen judul halaman
    d. Column dan Row yang menyusun elemen secara vertikal horizontal
    e. Text untuk menampilkan teks yang diperlukan
    f. Card dan Container untuk menampilkan informasi didalam kotak dengan ukuran tertentu
    g. GridView.count yang dapat memunculkan menu utama dalam bentuk grid
    h. Icon untuk menampilkan ikon pada tiap tombol menu
    i. InkWell pada Itemcard yang digunakan untuk membuat menu dapat ditekan dan menampilkan snackbar
    j. Padding dan SizedBox untuk mengatur jarak tiap eleemen


3) Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root


MaterialApp berfungsi sebagai root utama aplikasi Flutter dengan basis Material Design. Widget ini akan mengatur tema global, warna, judul, serta halaman mana yang dijadikan home. MaterialApp akan digunakan ketika kita menggunakan widget Scaffold Bar dan lain lain, karena keduanya bergantung pada konteks Material yang terdapat pada MaterialApp


4) Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?


Stateless Widget sendiri merupakan widget yang tampilannya tidak berubah selama aplikasi berjalan, seperti MyApp dan MyHomePage karena hanya menampilkan informasi yang tidak berubah atau statis. Sedangkan StatefulWidget digunakan ketika tampilan pada web perlu berubah ketika ada interaksi atau perubahan data



5)  Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?


BuildContext sendiri merupakan objek yang menyimpan informasi penting mengenai posisi widget didalam widget tree. Ini penting untuk mengakses data dari widget parent seperti tema, ukuran layar, maupun scaffold. Pada metode build, BuildContext digunakan agar widget bisa menyesuaikan tampilan sesuai konteks


6)  Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".


Hot reload memungkinkan developer untuk memperbarui code dan langsung melihat hasilnya tanpa kehilangan state aplikasi yang sedang berjalan, fitur ini mempercepat proses pengembangan karena tidak perlu menjalankan ulang seluruh aplikasi. Sementara itu, hot restart akan memuat ulang dari awal dan menghapus semua state yang tersimpan.





# TUGAS 8

1)  Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

navigator.push() digunakan untuk memberikan halaman baru di atas halaman sebelumnya, sehinga pengguna bisa memencet tombol back untuk kembali ke halaman sebelumnya. Sedangkan Navigator.pushReplacement() akan mengganti haaman saat ini dengan halaman baru, sehingga pengguna tidak akan bisa kembali ke halaman sebelumnya. Pada Wonderwall Kicks, Navigator.push() bisa digunakan untuk navigasi melihat detail produk dari halaman daftar barang. Sedangkan Navigator.pushReplacement() dapat digunakan untuk fitur login/logout

2)  Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?


Scaffold digunakan sebagai dasar kerangka utama tiap haaman karena menyediakan struktur dasar seperti AppBar, Drawer, dan Body. AppBar menampilkan judul halaman atau logo Football Shop, sedangkan Drawer berisi menu navigasi sepperti "Home", "Add Product", dan "Logout"


3)  Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Widget seperti Padding digunakan untuk memberi jarak antar elemen form agar tampilan nya rapi dan tidak terlalu rapat, kemudian SingleChildScrollView digunakan agar form bisa di scroll, terutama ketika layar kecil/keyboard muncul. Sedangkan ListView cocok untuk menampilkan banya elemen berulang seperti daftar produk. Contoh pada wonderwall kicks, pada halaman Add Product, form diletakan pada SingleChildScrollView dengan Padding di setiap TextFormField agar rapi dan tetap bisa di scroll

4)  Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Warna tema diatur melalui ThemeData pada widget MaterialApp, misal dengan menentukan primaryColor, colorScheme, dan scaffoldBackgrounColor. Dengan begitu, seluruh tampilan AppBar, tombol, dan ikon akan mengikuti identitas yang konsisten diseluruh halaman aplikasi

# TUGAS 9

1) Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Membuat model Dart saat mengambil atau mengirim data JSON sangat penting karena model memberikan struktur yang jelas untuk data yang akan diproses. Dengan model, setiap field memiliki tipe yang ditentukan, sehingga meminimalisir kesalahan tipe data, mendukung null-safety, dan mempermudah debugging. Jika kita langsung memetakan JSON ke `Map<String, dynamic>`, kita kehilangan validasi tipe otomatis dan keamanan null-safety, sehingga kesalahan runtime lebih mudah terjadi saat field yang diharapkan tidak ada atau bertipe berbeda. Selain itu, maintainability kode menjadi lebih rendah karena setiap kali data berubah, kita harus mencari semua pemanggilan Map secara manual, sementara dengan model, perubahan cukup dilakukan pada kelas model saja.

2) Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Package `http` digunakan untuk melakukan request HTTP standar seperti GET, POST, PUT, DELETE dari Flutter ke server Django. Package ini cocok untuk komunikasi sederhana tanpa memerlukan pengelolaan sesi atau cookie yang kompleks. Sementara `CookieRequest` adalah wrapper yang menambahkan kemampuan manajemen cookie secara otomatis, termasuk menyimpan dan mengirim cookie yang diperlukan untuk autentikasi berbasis session di Django. Perbedaannya terletak pada pengelolaan state; `http` hanya melakukan request stateless, sedangkan `CookieRequest` bisa mempertahankan sesi sehingga login atau autentikasi yang berbasis cookie dapat berjalan mulus.

3) Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance `CookieRequest` perlu dibagikan ke semua komponen agar sesi login atau autentikasi dapat diakses di seluruh bagian aplikasi tanpa harus melakukan login ulang atau kehilangan cookie. Jika setiap komponen membuat instance baru, cookie yang tersimpan tidak akan konsisten antar komponen, sehingga data pengguna atau status login bisa hilang ketika berpindah halaman. Dengan membagikan instance yang sama melalui state management (misal Provider), semua widget bisa mengakses status autentikasi dan melakukan request yang membutuhkan sesi dengan aman.

4) Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Untuk Flutter berkomunikasi dengan Django, kita perlu beberapa konfigurasi: pertama, menambahkan `10.0.2.2` pada `ALLOWED_HOSTS` karena emulator Android menggunakan alamat ini untuk mengakses localhost pada host machine. Kedua, mengaktifkan CORS (Cross-Origin Resource Sharing) agar request dari domain berbeda (misal emulator) diterima oleh Django. Ketiga, pengaturan `SameSite` dan cookie perlu disesuaikan agar cookie session dapat dikirim dan diterima antar domain, terutama untuk autentikasi berbasis session. Terakhir, menambahkan izin akses internet di Android (`INTERNET` permission) agar aplikasi dapat melakukan request HTTP. Jika konfigurasi ini tidak dilakukan, request dari Flutter bisa ditolak oleh server, cookie tidak dikirim, atau aplikasi tidak dapat mengakses server sama sekali, sehingga fitur seperti login, register, dan pengambilan data JSON akan gagal.

5) Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Mekanisme pengiriman data dimulai dari input pengguna di widget Flutter, misalnya form text field. Data input kemudian dikumpulkan dan diubah menjadi JSON menggunakan model Dart (misal `toJson()`). Selanjutnya, data dikirim ke server Django menggunakan request HTTP atau `CookieRequest`. Django memproses data, menyimpannya ke database, lalu merespons dengan JSON hasil pemrosesan. Flutter menerima JSON tersebut, kemudian mem-parsing kembali ke dalam model Dart menggunakan `fromJson()`. Setelah itu, widget Flutter dapat mengakses field model untuk menampilkan data ke pengguna sesuai UI yang dirancang.

6) Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Mekanisme autentikasi dimulai dari pengguna memasukkan data akun pada form register atau login di Flutter. Data ini dikonversi menjadi JSON dan dikirim ke Django melalui `CookieRequest`. Django memvalidasi data; untuk register, Django menyimpan akun baru di database, sedangkan untuk login, Django memeriksa kredensial dan membuat session jika valid. Server kemudian mengirim cookie session kembali ke Flutter melalui response. `CookieRequest` menyimpan cookie ini agar bisa digunakan di request berikutnya. Setelah login berhasil, Flutter memeriksa status autentikasi melalui instance `CookieRequest` dan menampilkan menu atau halaman khusus pengguna yang sudah login. Logout dilakukan dengan request ke endpoint logout Django, cookie session dihapus, dan Flutter mengubah UI kembali ke tampilan sebelum login.

7) Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

Implementasi dimulai dengan membuat model Dart untuk setiap entitas data yang akan dikirim atau diterima, sehingga semua request dan response terstruktur dan aman tipe. Selanjutnya, membuat instance `CookieRequest` dan membagikannya menggunakan Provider agar semua widget dapat mengakses autentikasi. Kemudian, menyiapkan endpoint Django dengan konfigurasi CORS, `ALLOWED_HOSTS`, dan pengaturan cookie agar Flutter bisa melakukan request dengan aman. Setelah itu, membuat form input di Flutter dan menghubungkannya ke model untuk konversi JSON, kemudian melakukan request ke server. Response dari server diparsing kembali ke model Dart dan ditampilkan pada UI. Terakhir, mekanisme login, register, dan logout diuji dengan memastikan cookie session tersimpan, status autentikasi valid, dan tampilan menu menyesuaikan status login, sehingga seluruh alur end-to-end berjalan dengan lancar.
