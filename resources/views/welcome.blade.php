<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ isset($title) ? $title:'' }}</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            img {
            height: auto;
            width: 100%;
            }
            /* html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh; 
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            } */
            .small-img{
                width: auto;height: auto;margin-right : auto;margin-left : auto;min-width : 200px;max-width : 350px;
            }
            /* .blog-img{
                width: auto;height: auto;margin-right : auto;margin-left : auto;min-width : 600px;max-width : 900px;
            } */
        </style>
        @yield('head')
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background: linear-gradient(#e6e2df,#ffffff,#e6e4e2 );">
        <a class="navbar-brand" href="" style="color: black;"><span style="font-family: Vivaldi; font-size:larger; font-weight: bold;">Laravel</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                    @auth
                    <li class="nav-item ">
                        <a class="nav-link" href="{{ url('/home') }}">Home</a>
                    </li>
                        @if(Auth::user()->user_type ==1 )
                        <li class="nav-item ">
                        <a class="nav-link" href="{{ url('/blog') }}">Blog</a>
                        </li>
                        @endif
                    @else
                    <li class="nav-item ">
                        <a class="nav-link" href="{{ route('login') }}">Login</a>
                    </li>
                        @if (Route::has('register'))
                        <li class="nav-item ">
                            <a  class="nav-link" href="{{ route('register') }}">Register</a>
                        </li>
                        @endif
                    @endauth
            </ul>
        </div>
    </nav>
            <div class="content">
            @yield('content')
            </div>
        <!-- </div> -->
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    @yield('foot')
</html>
