<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html lang="en">
    <head>
<?php 
include "dataset.php";
?>
        <title>Vigenesia</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
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
          <a class="nav-link" href="./about-us/" style="color: #fff;">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./artikel/" style="color: #fff;">Artikel</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./covid19/" style="color: #fff;">Data Covid19</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./api/" style="color: #fff;">API</a>
        </li>
      </ul>
      <!-- <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
    </div>
  </div>
</nav>
<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="./site/assets/img/3.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption">
        <h5><?php echo $kelompok ?></h5>
        <p>Hai ! Selamat datang di Halaman kami.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="./site/assets/img/1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption">
        <h5>Jangan Lupa kunjungi ya</h5>
        <p>Tentang Projek pengembangan Vigenesia.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="./site/assets/img/2.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption">
        <h5>Kolaborasi Vigenesia</h5>
        <p>Yuk jadi pengembang Vigenesia kunjungi Github ku ya !.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">Selamat Datang di Halaman kami.</h2>
        <p class="lead">Pengembangan nya apa saja sih ?</p>
        <li>Design Halaman Register</li>
        <li>Design Halaman Login</li>
        <li>Design Home</li>
        <li>Menambahkan beberapa Asset pada project</li>
        <li>Menambahkan Package pada Vigenesia</li>
        <li>Membuat Navbar</li>
        <li>Membuat Halaman Page</li>
        <li>Membuat Halaman Profile</li>
        <li>Membuat Halaman Motivasi</li>
        <li>Membuat Halaman API VIGENESIA</li>
        <li>Fix Bug: Build.gradle</li>
        
      </div>
      <div class="col-md-5">
      <img src="./site/assets/img/2.jpg" class="d-block w-100" alt="...">

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading"><?php echo $kelompok ?></h2>
        <p class="lead"><?php echo $subkelompok ?></p>
      </div>
      <div class="col-md-5 order-md-1">
      <img src="./site/assets/img/post1.png" class="d-block w-100" alt="...">
      <br>
      <!-- <div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    Home
  </a>
  <a href="#" class="list-group-item list-group-item-action">Motivasi</a>
  <a href="./about-us/" class="list-group-item list-group-item-action">About us</a>
  <a href="./artikel/" class="list-group-item list-group-item-action">Artikel</a>
  <a href="./covid19/" class="list-group-item list-group-item-action">Data Covid19</a> -->
  <!-- ini embled covid
  <iframe src="https://ourworldindata.org/grapher/total-cases-covid-19?tab=map" width="100%" height="600px"></iframe> -->
    <!-- <a href="./report-apk/" class="list-group-item list-group-item-action">Report Apk</a>
</div> -->
      </div>
    </div>
    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->

<!-- FOOTER -->
<footer class="container">
    <p class="float-end"><a href="#">Back to top</a></p>
    <p>&copy; Vigenesia Ubsi Margonda, Kelompok 8 kelas 15.5A.01.></a></p>
  </footer>

    </body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script> -->
</html>