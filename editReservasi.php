<?php
    require "config.php";

    $id = $_GET["kode_reservasi"];

    // ambil data reservasi berdasarkan kode_reservasi
    $queryAmbilDataReservasi = "SELECT * FROM data_reservasi WHERE kode_reservasi = '$id'";
    $objectAmbilDataReservasi = mysqli_query($conn, $queryAmbilDataReservasi);
    $reservasi = mysqli_fetch_assoc($objectAmbilDataReservasi);
       

    if( isset($_POST["submit"]) ) {
        $namaBaru = $_POST["namaBaru"];
        $queryInsertNama = "UPDATE data_reservasi SET nama = '$namaBaru' WHERE kode_reservasi = '$id'";
        
        // update data_menu
        mysqli_query($conn, $queryInsertNama);
        
        // header("Location: dataPeminjaman.php");
        echo    "<script>
                alert('Data Berhasil DiUbah');
                document.location.href = 'index.php';
            </script>";
            
    }

    

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Edit Reservasi</title>
</head>
<body>
    <header id="header">
        <div class="container">
            <center>
                <h1>Kafe kijangcitys</h1>
                <a href="index.php">Griya</a>
                <br><br>
                <a href="index.php">Back</a>
                <br><br>
            </center>
        </div>
    </header>
    <section id="content">
        <div class="container">
            <center>
                <form action="" method="post">
                    <label for="namaBaru">Edit Nama : </label>
                    <input type="text" name="namaBaru" id="namaBaru" required autocomplete="off" value="<?= $reservasi["nama"]; ?>">
                    <button type="submit" name="submit">Submit!</button>
                </form>
                
            </center>
        </div>
    </section>
</body>
</html>