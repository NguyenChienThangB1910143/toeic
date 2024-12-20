<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LearnerExam extends Model
{
    use HasFactory;
    protected $table = 'tbl_learner_exam';
    protected $primaryKey = 'learner_exam_id';
    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true;

    protected $fillable = [
        'learner_id', // id của leaner
        'exam_id', // id của bài thi
        'completion_time', // tổng thời gian người dùng làm bài thi
        'num_listen_correct_ans', // số câu người dùng đã chọn đúng ở phần nghe(part 1 đến part 4)
        'listen_score', // điểm của phần nghe
        'num_read_correct_ans', // số câu người dùng đã chọn đúng ở phần đọc(part 5 đến part 7)
        'read_score', // số điểm của phần đọc
        'total_score', // điểm tổng của bài thi
        'num_correct_ans', // số câu người dùng chọn đúng
        'num_wrong_ans', // số câu người dùng chọn sai
        'num_skip_ans', // số câu người dùng không chọn
    ];

    protected $casts = [
        'completion_time' => 'datetime',
    ];

    public function learner()
    {
        return $this->belongsTo(Learner::class, 'learner_id');
    }

    public function exam()
    {
        return $this->belongsTo(Exam::class, 'exam_id');
    }
}
