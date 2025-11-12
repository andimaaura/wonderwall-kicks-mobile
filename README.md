
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

