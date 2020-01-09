<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $guarded = ['_token'];
    public function users()
    {
        return $this->belongsToMany('App\User');
    }
}
