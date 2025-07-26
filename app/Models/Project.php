<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Project extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'description',
        'url',
        'image_url',
        'image_urls',
        'github_url',
        'user_id',
    ];

    protected $casts = [
        'image_urls' => 'array',
    ];

    public function skills(){
        return $this->belongsToMany(Skill::class)->withTimestamps();
    }

    public function experiences(){
        return $this->belongsToMany(Experience::class)->withTimestamps();
    }
}
