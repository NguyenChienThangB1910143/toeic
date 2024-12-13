<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\SectionQuestion;
use App\Models\QuestionGroup;

class TestQuestion extends Model
{
    protected $table = 'test_question';
    protected $primaryKey = 'test_question_id';

    protected $fillable = ['test_id', 'question_id'];

    public function test()
    {
        return $this->belongsTo(Test::class, 'test_id');
    }

    public function question()
    {
        return $this->belongsTo(SectionQuestion::class, 'question_id');
    }

    public function group()
    {
        return $this->hasOneThrough(
            QuestionGroup::class,
            SectionQuestion::class,
            'question_id', // Foreign key on SectionQuestion table...
            'question_group_id', // Foreign key on QuestionGroup table...
            'question_id', // Local key on TestQuestion table...
            'question_group_id' // Local key on SectionQuestion table...
        );
    }
}
