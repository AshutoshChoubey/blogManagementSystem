<div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
    <label for="title" class="control-label">{{ 'Title' }}</label>
    <input class="form-control" name="title" type="text" id="title" value="{{ isset($blog->title) ? $blog->title : ''}}" >
    {!! $errors->first('title', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('keywords') ? 'has-error' : ''}}">
    <label for="keywords" class="control-label">{{ 'Keywords' }}</label>
    <textarea class="form-control" rows="5" name="keywords" type="textarea" id="keywords" >{{ isset($blog->keywords) ? $blog->keywords : ''}}</textarea>
    {!! $errors->first('keywords', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('category') ? 'has-error' : ''}}">
    <label for="category" class="control-label">{{ 'Category' }}</label>
    <textarea class="form-control" rows="5" name="category" type="textarea" id="category" >{{ isset($blog->category) ? $blog->category : ''}}</textarea>
    {!! $errors->first('category', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('photo') ? 'has-error' : ''}}">
    <label for="photo" class="control-label">{{ 'Photo' }}</label>
    <textarea class="form-control" rows="5" name="photo" type="textarea" id="photo" >{{ isset($blog->photo) ? $blog->photo : ''}}</textarea>
    {!! $errors->first('photo', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('description') ? 'has-error' : ''}}">
    <label for="description" class="control-label">{{ 'Description' }}</label>
    <textarea class="form-control" rows="5" name="description" type="textarea" id="description" >{{ isset($blog->description) ? $blog->description : ''}}</textarea>
    {!! $errors->first('description', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('post') ? 'has-error' : ''}}">
    <label for="post" class="control-label">{{ 'Post' }}</label>
    <textarea class="form-control" rows="5" name="post" type="textarea" id="post" >{{ isset($blog->post) ? $blog->post : ''}}</textarea>
    {!! $errors->first('post', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('file') ? 'has-error' : ''}}">
    <label for="file" class="control-label">{{ 'File' }}</label>
    <textarea class="form-control" rows="5" name="file" type="textarea" id="file" >{{ isset($blog->file) ? $blog->file : ''}}</textarea>
    {!! $errors->first('file', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('published') ? 'has-error' : ''}}">
    <label for="published" class="control-label">{{ 'Published' }}</label>
    <textarea class="form-control" rows="5" name="published" type="textarea" id="published" >{{ isset($blog->published) ? $blog->published : ''}}</textarea>
    {!! $errors->first('published', '<p class="help-block">:message</p>') !!}
</div>


<div class="form-group">
    <input class="btn btn-primary" type="submit" value="{{ $formMode === 'edit' ? 'Update' : 'Create' }}">
</div>
