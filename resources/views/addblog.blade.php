@extends('layouts.app')

@section('content')
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" />
<div class="container">
    <div class="row justify-content-center">
      <!-- <div class="col-sm-4"> -->
      @include('admin.sidebar')
      <!-- </div> -->
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
            @if(session()->has('message.level'))
              <div class="alert alert-{{ session('message.level') }} alert-dismissible" >
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-check"></i> {{ ucfirst(session('message.level')) }}!</h4>
                {!! session('message.content') !!}
              </div>
              @endif
              @if(isset($id))
              <form method="post" action="{{ url('/blog') }}/{{$id}}" enctype="multipart/form-data" >
              <input type="hidden" name="_method" value="PUT">
              {{ Form::hidden('id', isset($id) ? $id :'', []) }} 
              @else
              <form method="POST" action="{{ url('/blog/create') }}" enctype="multipart/form-data" >
              @endif
            
             {{ csrf_field() }}
                <div class="card">
                    <div class="card-header text-center">
                      {{ isset($id)?"Update Your Blog":"Add Your Blog"}}</div>

                    <div class="card-body">
                    
                      <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control @error('title') is-invalid @enderror"   id="title" name="title" aria-describedby="titleHelp" value="{{ old('title', $title ?? '') }}" placeholder="Enter Title">
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
                                        @foreach ($categoryForSelect as $data)
                                        <option value="{{$data->id}}"
                                        @if ($data->id == old('category', $category ?? ''))
                                          selected="selected"
                                      @endif
                                          >{{$data->categoryname}}</option>
                                        @endforeach
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
                        <textarea  class="form-control @error('keywords') is-invalid @enderror" id="keywords" name="keywords" aria-describedby="keywordsHelp" placeholder="Enter Keyword">{{ old('keywords', $keywords ?? '') }}</textarea>
                        <small id="keywordsHelp" class="form-text text-muted">Please Enter Keyword Related to Blog Title.</small>
                        @error('keywords')
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror   
                      </div>
                     <div class="form-group">
                        <label for="description">Description</label>
                        <textarea  class="form-control @error('description') is-invalid @enderror " id="description" name="description" aria-describedby="descriptionHelp" placeholder="Enter Your Blog Description">{{ old('description', $description ?? '') }}</textarea>
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
 <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/js/select2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
    
 var editor_config = {
    path_absolute : "{{ url('/') }}/",
    selector: "textarea#post",
    plugins: [
      "advlist autolink lists link image charmap print preview hr anchor pagebreak",
      "searchreplace wordcount visualblocks visualchars code fullscreen",
      "insertdatetime media nonbreaking save table contextmenu directionality",
      "emoticons template paste textcolor colorpicker textpattern"
    ],
    // plugins: 'print preview fullpage paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
  
    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media",
    relative_urls: false,
    file_browser_callback : function(field_name, url, type, win) {
      var x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName('body')[0].clientWidth;
      var y = window.innerHeight|| document.documentElement.clientHeight|| document.getElementsByTagName('body')[0].clientHeight;

      var cmsURL = editor_config.path_absolute + 'laravel-filemanager?field_name=' + field_name;
      if (type == 'image') {
        cmsURL = cmsURL + "&type=Images";
      } else {
        cmsURL = cmsURL + "&type=Files";
      }

      tinyMCE.activeEditor.windowManager.open({
        file : cmsURL,
        title : 'Filemanager',
        width : x * 0.8,
        height : y * 0.8,
        resizable : "yes",
        close_previous : "no"
      });
    }
  };

  tinymce.init(editor_config);
    $('.js-example-basic-single').select2();
})
</script>
@endsection
