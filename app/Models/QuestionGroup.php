<?php
namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use App\Models\SectionQuestion;
class QuestionGroup extends Model
{
    protected $table = 'tbl_question_group';
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
