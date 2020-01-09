@extends('layouts.app')

@section('content')
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" />
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
              @if ($errors->any())
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
            @endif
             <form method="POST" action="{{ url('/blog') }}" >
                @csrf
                <div class="card">
                    <div class="card-header text-center">Add Your Blog</div>

                    <div class="card-body">
                    
                      <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control @error('title') is-invalid @enderror"   id="title" name="title" aria-describedby="titleHelp" placeholder="Enter Title">
                        <small id="titleHelp" class="form-text text-muted">Please Enter Your Blog Title.</small>
                        @error('title')
                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                        @enderror
                      </div>
                      <div class="row" >
                            <div class="col-sm-4" > 
                                <div class="form-group">
                                    <label for="category">Category</label>
                                    <select class="form-control js-example-basic-single @error('category') is-invalid @enderror" id="category" name="category" >
                                        <option value="NA">NA</option>
                                    </select>
                                    @error('category')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                  </div>
                              </div>
                            <div class="col-sm-4" >
                                  <div class="form-group">
                                    <label for="photo">Photo</label>
                                    <input type="file" class="form-control  @error('photo') is-invalid @enderror" id="photo" name="photo" >
                                     @error('photo')
                                     <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror                           
                                  </div>
                            </div>
                            <div class="col-sm-4" >
                                <div class="form-group">
                                    <label for="file">Upload Post Related File</label>
                                    <input type="file" class="form-control" id="file" name="file" >                           
                                  </div>
                            </div>
                      </div>
                     
                      <div class="form-group">
                        <label for="keywords">Keywords</label>
                        <textarea  class="form-control @error('keywords') is-invalid @enderror" id="keywords" name="keywords" aria-describedby="keywordsHelp" placeholder="Enter Keyword"></textarea>
                        <small id="keywordsHelp" class="form-text text-muted">Please Enter Keyword Related to Blog Title.</small>
                        @error('keywords')
                                        <<span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror   
                      </div>
                     <div class="form-group">
                        <label for="description">Description</label>
                        <textarea  class="form-control @error('description') is-invalid @enderror " id="description" name="description" aria-describedby="descriptionHelp" placeholder="Enter Your Blog Description"></textarea>
                        <small id="descriptionHelp" class="form-text text-muted">Please Enter Your Blog Description.</small>
                         @error('description')
                         <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror   
                    </div>
                     <div class="form-group">
                        <label for="post">Post</label>
                        <textarea  class="form-control @error('post') is-invalid @enderror " id="post" name="post" aria-describedby="postHelp" placeholder="Enter Your Post">{!! old('post', $post ?? '') !!}</textarea>
                        <small id="postHelp" class="form-text text-muted">Please Enter Your Blog Post.</small>
                         @error('post')
                         <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror   
                    </div>

                      
                    </div>
                    <div class="card-footer text-center">  <button type="submit" class="btn btn-primary">Submit</button></div>
                </div>
             </form>
        </div>
    </div>
</div>

@endsection
@section('script')
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
<script>
  var options = {
    filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
    filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=',
    filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
    filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token='
  };
  CKEDITOR.replace('post', options);
</script>
@endsection
