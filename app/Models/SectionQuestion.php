<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\QuestionGroup;

class SectionQuestion extends Model
{
    protected $table = 'section_questions';
    protected $primaryKey = 'question_id'; 

    protected $fillable = [
        'section_id',
        'question_group_id',
        'content',
        'option1',
        'option2',
        'option3',
        'option4',
        'correct_option',
        'image',
        'audio',
        'text',
        'script',
        'created_at', 
        'updated_at',
    ];
        public function section()
    {
        return $this->belongsTo(Section::class, 'section_id');
    }
    public function group()
    {
        return $this->belongsTo(QuestionGroup::class, 'question_group_id');
    }
    
}