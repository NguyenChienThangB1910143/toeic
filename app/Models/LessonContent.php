<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LessonContent extends Model
{
    protected $table = 'lesson_content';
    protected $primaryKey = 'content_id'; 

    protected $fillable = [
        'lesson_id', 'title', 'content', 'created_at', 'updated_at',
    ];
    public function lessoncontent()
    {
        return $this->belongsTo(Lesson::class, 'lesson_id');
    }
}