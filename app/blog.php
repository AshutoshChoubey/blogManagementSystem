<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class blog extends Model
{
    use SoftDeletes;
    protected $guarded = ['_token'];

}
