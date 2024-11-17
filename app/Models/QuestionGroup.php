<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class QuestionGroup extends Model
{
    protected $table = 'question_groups';
    protected $primaryKey = 'question_group_id';

    protected $fillable = [
        'audio',
        'image',
        'passage',
        'script',
        'text',
    ];

    public function questions()
    {
        return $this->hasMany(SectionQuestion::class, 'question_group_id');
    }
}
