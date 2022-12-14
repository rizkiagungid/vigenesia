<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html lang="en">
    <head>
        <title>Artikel</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
    <?php
        include "../dataset.php";
        ?>

               <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
  <div class="container">
    <a class="navbar-brand" href="#" style="color: #fff;">
        Vigenesia
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#" style="color: #fff;">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../about-us/" style="color: #fff;">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../artikel/" style="color: #fff;">Artikel</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../covid19/" style="color: #fff;">Data Covid19</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../api/" style="color: #fff;">API</a>
        </li>
      </ul>
      <!-- <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
    </div>
  </div>
</nav>

<div class="card" style="width: auto; margin: 40px 10px; border: none;">
  <img src="https://firebasestorage.googleapis.com/v0/b/hospice-medical.appspot.com/o/images%2Faboutus.png?alt=media&token=447de6ed-24e9-4c67-b49b-feb5f5130f8a" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Tentang Kami</h5>
    <p class="card-text">
    Selamat Datang Di Pengembangan Rest API Servis Data Dari Aplikasi Vigenesia (Visi Generasi Indonesia)
    </p>
    <br>
   List Anggota Kelompok :
   <br>
    - <?php   echo $nama1; ?>
    <br>
    - <?php   echo $nama2; ?>
      <br>
    - <?php echo $nama3; ?>
    <br>
    - <?php  echo $nama4; ?>
    <br>
    - <?php  echo $nama5; ?>
   
  </div>
</div>
</body>
</html>