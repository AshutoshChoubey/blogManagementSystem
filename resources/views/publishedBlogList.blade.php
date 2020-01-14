@extends('welcome')

@section('head')
    
@endsection
@section('content')
<div class="row">
    <div class="col-sm-2">&nbsp;</div>
    <div class="col-sm-8  text-center">
        <div class="card">
        @foreach($bloglists as $blog)
            <div class="card-header"><h3>{{$blog->title}}
            <a href="{{ url('' . $blog->slug) }}"  target="_blank">
            <img style="height: 20px;width:20px" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4Igp3aWR0aD0iMTYiIGhlaWdodD0iMTYiCnZpZXdCb3g9IjAgMCA1MCA1MCIKc3R5bGU9IiBmaWxsOiMwMDAwMDA7Ij48cGF0aCBkPSJNIDMzLjQwNjI1IDAgQyAzMi44NTU0NjkgMC4wNTA3ODEzIDMyLjQ0OTIxOSAwLjU0Mjk2OSAzMi41IDEuMDkzNzUgQyAzMi41NTA3ODEgMS42NDQ1MzEgMzMuMDQyOTY5IDIuMDUwNzgxIDMzLjU5Mzc1IDIgTCA0Ni41NjI1IDIgTCAyNS42ODc1IDIyLjkwNjI1IEMgMjUuMzkwNjI1IDIzLjE0ODQzOCAyNS4yNTM5MDYgMjMuNTM1MTU2IDI1LjMzOTg0NCAyMy45MTAxNTYgQyAyNS40MjU3ODEgMjQuMjgxMjUgMjUuNzE4NzUgMjQuNTc0MjE5IDI2LjA4OTg0NCAyNC42NjAxNTYgQyAyNi40NjQ4NDQgMjQuNzQ2MDk0IDI2Ljg1MTU2MyAyNC42MDkzNzUgMjcuMDkzNzUgMjQuMzEyNSBMIDQ4IDMuNDM3NSBMIDQ4IDE2LjQwNjI1IEMgNDcuOTk2MDk0IDE2Ljc2NTYyNSA0OC4xODM1OTQgMTcuMTAxNTYzIDQ4LjQ5NjA5NCAxNy4yODUxNTYgQyA0OC44MDg1OTQgMTcuNDY0ODQ0IDQ5LjE5MTQwNiAxNy40NjQ4NDQgNDkuNTAzOTA2IDE3LjI4NTE1NiBDIDQ5LjgxNjQwNiAxNy4xMDE1NjMgNTAuMDAzOTA2IDE2Ljc2NTYyNSA1MCAxNi40MDYyNSBMIDUwIDAgTCAzMy41OTM3NSAwIEMgMzMuNTYyNSAwIDMzLjUzMTI1IDAgMzMuNSAwIEMgMzMuNDY4NzUgMCAzMy40Mzc1IDAgMzMuNDA2MjUgMCBaIE0gMiAxMCBDIDEuNDc2NTYzIDEwIDAuOTQxNDA2IDEwLjE4MzU5NCAwLjU2MjUgMTAuNTYyNSBDIDAuMTgzNTk0IDEwLjk0MTQwNiAwIDExLjQ3NjU2MyAwIDEyIEwgMCA0OCBDIDAgNDguNTIzNDM4IDAuMTgzNTk0IDQ5LjA1ODU5NCAwLjU2MjUgNDkuNDM3NSBDIDAuOTQxNDA2IDQ5LjgxNjQwNiAxLjQ3NjU2MyA1MCAyIDUwIEwgMzggNTAgQyAzOC41MjM0MzggNTAgMzkuMDU4NTk0IDQ5LjgxNjQwNiAzOS40Mzc1IDQ5LjQzNzUgQyAzOS44MTY0MDYgNDkuMDU4NTk0IDQwIDQ4LjUyMzQzOCA0MCA0OCBMIDQwIDE4IEMgNDAuMDAzOTA2IDE3LjY0MDYyNSAzOS44MTY0MDYgMTcuMzA0Njg4IDM5LjUwMzkwNiAxNy4xMjEwOTQgQyAzOS4xOTE0MDYgMTYuOTQxNDA2IDM4LjgwODU5NCAxNi45NDE0MDYgMzguNDk2MDk0IDE3LjEyMTA5NCBDIDM4LjE4MzU5NCAxNy4zMDQ2ODggMzcuOTk2MDk0IDE3LjY0MDYyNSAzOCAxOCBMIDM4IDQ4IEwgMiA0OCBMIDIgMTIgTCAzMiAxMiBDIDMyLjM1OTM3NSAxMi4wMDM5MDYgMzIuNjk1MzEzIDExLjgxNjQwNiAzMi44Nzg5MDYgMTEuNTAzOTA2IEMgMzMuMDU4NTk0IDExLjE5MTQwNiAzMy4wNTg1OTQgMTAuODA4NTk0IDMyLjg3ODkwNiAxMC40OTYwOTQgQyAzMi42OTUzMTMgMTAuMTgzNTk0IDMyLjM1OTM3NSA5Ljk5NjA5NCAzMiAxMCBaIj48L3BhdGg+PC9zdmc+">
            </a></h3>
            <small><b>Updated Date:-</b>{{$blog->updated_at}}&nbsp;&nbsp;<b>Author:</b>{{$blog->author}}</small>
        </div>
            <div class="card-body">   
            @if(isset($blog->photo))
                <?php $image_url = str_replace(' ', '%20', $blog->photo); ?>
                <img  src="{{asset('uploads/blogPhoto')}}/{{ $image_url }}" alt="{{ $blog->title }}" class="img-thumbnail float-left small-img">
            @endif 
            {{str_limit($blog->description, 500) }} <a href="{{ url('' . $blog->slug) }}" >Read full blog</a>
            </div>
            <!-- <div class="card-footer" ></div> -->
            @endforeach
            
        </div>
        {!! $bloglists->appends(['search' => Request::get('search')])->render() !!} 
    </div>
    <div class="col-sm-2">&nbsp;</div>
</div>
@endsection
@section('foot')
@endsection