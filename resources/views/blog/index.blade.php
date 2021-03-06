@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            @include('admin.sidebar')

            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">Blog</div>
                    <div class="card-body">
                        <a href="{{ url('/blog/create') }}" class="btn btn-success btn-sm" title="Add New blog">
                            <i class="fa fa-plus" aria-hidden="true"></i> Add New
                        </a>

                        <form method="GET" action="{{ url('/blog') }}" accept-charset="UTF-8" class="form-inline my-2 my-lg-0 float-right" role="search">
                            <div class="input-group">
                                <input type="text" class="form-control" name="search" placeholder="Search..." value="{{ request('search') }}">
                                <span class="input-group-append">
                                    <button class="btn btn-secondary" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>

                        <br/>
                        <br/>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th><th>Photo</th><th>Title</th><th>Keywords</th><th>Category</th><th>Descripition</th><th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                @foreach($blog as $item)
                                    <tr>
                                    <?php $image_url = str_replace(' ', '%20', $item->photo); ?>
                                        <td>{{ $loop->iteration }}</td>
                                        <td><img src="{{ asset('uploads/blogPhoto') }}/{{ $image_url }}" alt="{{ $item->title }}" class="img-thumbnail"></td>
                                        <td>{{ $item->title }}</td><td>{{str_limit($item->keywords, 50) }}</td><td>{{ $item->categoryname }}</td>
                                        <td>{{str_limit($item->description, 50) }}</td>
                                        <td>
                                            <a href="{{ url('/' . $item->slug) }}" title="View blog"><button class="btn btn-info btn-sm"><i class="fa fa-eye" aria-hidden="true"></i> View</button></a>
                                            <a href="{{ url('/blog/' . $item->id . '/edit') }}" title="Edit blog"><button class="btn btn-primary btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</button></a>
                                            <form method="POST" action="{{ url('/blog' . '/' . $item->id) }}" accept-charset="UTF-8" style="display:inline">
                                                {{ method_field('DELETE') }}
                                                {{ csrf_field() }}
                                                <button type="submit" class="btn btn-danger btn-sm" title="Delete blog" onclick="return confirm(&quot;Confirm delete?&quot;)"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</button>
                                            </form>
                                            <form method="POST" action="{{ url('/blogPublished' . '/' . $item->id) }}" accept-charset="UTF-8" style="display:inline">
                                                {{ method_field('PUT') }}
                                                {{ csrf_field() }}
                                                <input  hidden="true" class="" name="published" type="hidden" value="{{$item->published}}">
                                                <button onclick="return confirm(&quot;Are you sure to update your post publication?&quot;)" type="submit" class="btn btn-primary"  ><i class="fa {{ $item->published!=1? 'fa-lock' : 'fa-user' }}" aria-hidden="true"></i>{{ $item->published!=1? "private" : "public" }}</button>
                                            </form>
                                           
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                            <div class="pagination-wrapper"> {!! $blog->appends(['search' => Request::get('search')])->render() !!} </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
