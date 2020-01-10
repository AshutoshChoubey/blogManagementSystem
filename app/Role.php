<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Role extends Model
{
    Use SoftDeletes;
    protected $guarded = ['_token'];
    public function users()
    {
        return $this->belongsToMany('App\User');
    }
}
