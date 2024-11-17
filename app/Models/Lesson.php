<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    protected $table = 'lessons';
    protected $primaryKey = 'lesson_id'; 

    protected $fillable = [
        'section_id', 'name', 'created_at', 'updated_at',
    ];

}