

<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>API Vigenesia UP</title>
	
    <style>
        ::selection {
            background-color: #E13300;
            color: white;
        }

        ::-moz-selection {
            background-color: #E13300;
            color: white;
        }

        body {
            background-color: #FFF;
            margin: 40px;
            font: 16px/20px normal Helvetica, Arial, sans-serif;
            color: #4F5155;
            word-wrap: break-word;
        }

        a {
            color: #039;
            background-color: transparent;
            font-weight: normal;
        }

        h1 {
            color: #444;
            background-color: transparent;
            border-bottom: 1px solid #D0D0D0;
            font-size: 24px;
            font-weight: normal;
            margin: 0 0 14px 0;
            padding: 14px 15px 10px 15px;
        }

        code {
            font-family: Consolas, Monaco, Courier New, Courier, monospace;
            font-size: 16px;
            background-color: #f9f9f9;
            border: 1px solid #D0D0D0;
            color: #002166;
            display: block;
            margin: 14px 0 14px 0;
            padding: 12px 10px 12px 10px;
        }

        #body {
            margin: 0 15px 0 15px;
        }

        p.footer {
            text-align: right;
            font-size: 16px;
            border-top: 1px solid #D0D0D0;
            line-height: 32px;
            padding: 0 10px 0 10px;
            margin: 20px 0 0 0;
        }

        #container {
            margin: 10px;
            border: 1px solid #D0D0D0;
            box-shadow: 0 0 8px #D0D0D0;
        }
    </style>
    <link rel="icon" type="image/png" href="http://www.vigenesia.org/imgindonesia.png">
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
          <a class="nav-link active" aria-current="page" href=".." style="color: #fff;">Home</a>
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
    <div id="container">
        <h1>API Vigenesia UP</h1>

        <div id="body">

            <h2><a href="http://www.vigenesia.org/">Home</a></h2>

            <p>
                Selamat Datang DI Rest API Servis Data Dari Aplikasi Vigenesia (Visi Generasi Indonesia) By Fauko Missalam UBSI  <br>
                PAKAI SERVER LOCAL DAHULU
            <!--</p> <li><a href="http://www.vigenesia.org/Home">HOME SEO </a> </li>-->
            <br>
            <ol>
                <p>
                    DI Bawah Link API Authentifikasi
                </p>
                <li><a href="http://www.vigenesia.org/api/user">GET DATA USER</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/api/PUTprofile">PUT UNTUK PROFILE</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/api/registrasi">POST UNTUK PENDAFTARAN MEMBER</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/api/login">POST UNTUK LOGIN</a> - defaulting to JSON</li>

            </ol>
            <ol>
                <p>
                    DI Bawah Link API Motivasi
                </p>
                <li><a href="http://www.vigenesia.org/api/dev/POSTmotivasi">POST UNTUK MOTIVASI</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/api/dev/PUTmotivasi">PUT UNTUK UPDATE MOTIVASI</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/api/Get_motivasi">GET UNTUK MOTIVASI</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/api/dev/DELETEmotivasi">DELETE UNTUK MOTIVASI</a> - defaulting to JSON</li>
            </ol>Tinggal salin link setiap fungsi yang berada di atas masukan ke frontend <br>
<br>
            Salam Generasi Indonesia :)

        </div>

        <p class="footer">Page rendered in <strong>0.0032</strong> seconds. CodeIgniter Version <strong>3.1.2</strong></p>
    </div>

    <script src="https://code.jquery.com/jquery-1.12.0.js"></script>

    <script>
        // Create an 'App' namespace
        var App = App || {};

        // Basic rest module using an IIFE as a way of enclosing private variables
        App.rest = (function restModule(window) {
            // Fields
            var _alert = window.alert;
            var _JSON = window.JSON;

            // Cache the jQuery selector
            var _$ajax = null;

            // Cache the jQuery object
            var $ = null;

            // Methods (private)

            /**
             * Called on Ajax done
             *
             * @return {undefined}
             */
            function _ajaxDone(data) {
                // The 'data' parameter is an array of objects that can be iterated over
                _alert(_JSON.stringify(data, null, 2));
            }

            /**
             * Called on Ajax fail
             *
             * @return {undefined}
             */
            function _ajaxFail() {
                _alert('Oh no! A problem with the Ajax request!');
            }

            /**
             * On Ajax request
             *
             * @param {jQuery} $element Current element selected
             * @return {undefined}
             */
            function _ajaxEvent($element) {
                $.ajax({
                        // URL from the link that was 'clicked' on
                        url: $element.attr('href')
                    })
                    .done(_ajaxDone)
                    .fail(_ajaxFail);
            }

            /**
             * Bind events
             *
             * @return {undefined}
             */
            function _bindEvents() {
                // Namespace the 'click' event
                _$ajax.on('click.app.rest.module', function(event) {
                    event.preventDefault();

                    // Pass this to the Ajax event function
                    _ajaxEvent($(this));
                });
            }

            /**
             * Cache the DOM node(s)
             *
             * @return {undefined}
             */
            function _cacheDom() {
                _$ajax = $('#ajax');
            }

            // Public API
            return {
                /**
                 * Initialise the following module
                 *
                 * @param {object} jQuery Reference to jQuery
                 * @return {undefined}
                 */
                init: function init(jQuery) {
                    $ = jQuery;

                    // Cache the DOM and bind event(s)
                    _cacheDom();
                    _bindEvents();
                }
            };
        }(window));

        // DOM ready event
        $(function domReady($) {
            // Initialise the App module
            App.rest.init($);
        });
    </script>

</body>

</html>


<!-- <li><a href="http://www.vigenesia.org/role/example/users">Data Role Akun</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/menu/example/users">Data Menu</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/kategori/example/users">Data Kategori Menu</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/booking/example/users">Data Booking</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/booking_detail/example/users">Data Booking Detail</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/pesan/example/users">Data Pesan</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/detail_pesan/example/users">Data Detail Pesan</a> - defaulting to JSON</li>
                <li><a href="http://www.vigenesia.org/temp/example/users">Data Temp Pesanan</a> - defaulting to JSON</li> -->