<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Experience extends Model
{
    protected $fillable = ['title', 'company', 'period', 'description'];

    public function projects(){
        return $this->belongsToMany(Project::class)->withTimestamps();
    }
}
