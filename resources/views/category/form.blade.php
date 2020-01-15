<div class="form-group {{ $errors->has('categoryname') ? 'has-error' : ''}}">
    <label for="Category Name" class="control-label">{{ 'Categoryname' }}</label>
    <input class="form-control" name="categoryname" type="text" id="categoryname" value="{{ isset($category->categoryname) ? $category->categoryname : ''}}" >
    {!! $errors->first('categoryname', '<p class="help-block">:message</p>') !!}
</div>
<div class="form-group {{ $errors->has('categorydescription') ? 'has-error' : ''}}">
    <label for="Category Description" class="control-label">{{ 'Categorydescription' }}</label>
    <textarea class="form-control" rows="5" name="categorydescription" type="textarea" id="categorydescription" >{{ isset($category->categorydescription) ? $category->categorydescription : ''}}</textarea>
    {!! $errors->first('categorydescription', '<p class="help-block">:message</p>') !!}
</div>


<div class="form-group">
    <input class="btn btn-primary" type="submit" value="{{ $formMode === 'edit' ? 'Update' : 'Create' }}">
</div>
