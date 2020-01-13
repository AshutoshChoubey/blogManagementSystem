<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class category extends Model
{
   
    use SoftDeletes;
    protected $guarded = ['_token'];
    public function blog()
    {
        return $this->hasMany("App\blog", "category",'id');
    }
    // public function blog()
    // {
    //     return $this->belongsTo('App\blog');
    // }
}
