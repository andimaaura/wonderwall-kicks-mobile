
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