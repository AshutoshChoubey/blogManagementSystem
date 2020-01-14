@extends('welcome')

@section('head')
    <meta name="keywords" content="{{ $keywords }}" />
    <meta name="date" content="{{ $created_at }}" scheme="YYYY-MM-DD">
    <meta name="description" content="{{ $description }}" />
    <meta name="subject" content="{{ $description }}">
    <meta name="author" content="{{ $author }}">
    <meta name="url" content="{{ $_SERVER['SERVER_NAME'] }}">
    <meta name="identifier-URL" content="{{ Request::url() }}">
    <meta name="coverage" content="Worldwide">
    <meta name="distribution" content="Global">
    <meta name="og:title" content="{{ $title }}" />
    <meta name="og:url" content="{{ $_SERVER['SERVER_NAME'] }}" />
    @if(isset($photo))
    <meta name="og:image" content="{{ asset('uploads/blogPhoto') }}/{{ $photo }}" />
    @endif
    <!-- logo -->
    <meta name="og:site_name" content="World Gyan" />
    <meta name="og:description" content="{{ $description }}"
    />
    <meta property="og:type" content="article" />
@endsection
@section('content')
<div class="row">
    <div class="col-sm-2">&nbsp;</div>
    <div class="col-sm-8">
        <div class="card">
            <div class="card-header"><h3>{{ $title }}</h3></div>
            <div class="card-body">
           
                @if(isset($photo))
                <?php $image_url = str_replace(' ', '%20', $photo); ?>
                <img src="{{asset('uploads/blogPhoto')}}/{{ $image_url }}" alt="{{ $title }}" class="img-thumbnail">
                @endif
                {!! $post !!}
            </div>
            <div class="card-footer" >
                @if(isset($file))
                   <a href="{{ asset('uploads/blogFile') }}/{{ $file }}" download>Download The Related File</a>
                @endif
            </div>
        </div>
        <div></div>
    </div>
    <div class="col-sm-2">&nbsp;</div>
</div>
@endsection
@section('foot')
@endsection