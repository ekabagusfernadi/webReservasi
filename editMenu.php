<?php
    require "config.php";

    $id = $_GET["id_menu"];

    // ambil data menu berdasarkan id_menu
    $queryAmbilDataMenu = "SELECT * FROM data_menu WHERE id_menu = '$id'";
    $objectAmbilDataMenu = mysqli_query($conn, $queryAmbilDataMenu);
    $menu = mysqli_fetch_assoc($objectAmbilDataMenu);
       

    if( isset($_POST["submit"]) ) {
        $menuBaru = $_POST["menuBaru"];
        $hargaBaru = $_POST["hargaBaru"];
        $queryInsertMenu = "UPDATE data_menu SET nama_menu = '$menuBaru', harga = '$hargaBaru' WHERE id_menu = '$id'";
        
        // update data_menu
        mysqli_query($conn, $queryInsertMenu);


        
        // header("Location: dataPeminjaman.php");
        echo    "<script>
                alert('Data Berhasil DiUbah');
                document.location.href = 'tambahMenu.php';
            </script>";
            
    }

    

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Edit Menu</title>
</head>
<body>
    <header id="header">
        <div class="container">
            <center>
                <h1>Kafe kijangcitys</h1>
                <a href="index.php">Griya</a>
                <br><br>
                <a href="tambahMenu.php">Back</a>
                <br><br>
            </center>
        </div>
    </header>
    <section id="content">
        <div class="container">
            <center>
                <form action="" method="post">
                    <label for="menuBaru">Edit Nama Menu : </label>
                    <input type="text" name="menuBaru" id="menuBaru" required autocomplete="off" value="<?= $menu['nama_menu']; ?>">
                    &emsp;
                    <label for="hargaBaru">Edit Harga : </label>
                    <input type="number" id="hargaBaru" min="1000" max="100000" name="hargaBaru" placeholder="Rp." required value="<?= $menu['harga']; ?>">
                    <button type="submit" name="submit">Submit!</button>
                </form>
                
            </center>
        </div>
    </section>
</body>
</html>