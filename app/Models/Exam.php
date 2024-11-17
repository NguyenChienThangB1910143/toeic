<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Exam extends Model
{
    use HasFactory;

    protected $table = 'exams';

    protected $primaryKey = 'exam_id';

    // Khai báo các trường có thể được gán
    protected $fillable = [
        'name',
        'duration',
    ];

    // Tùy chọn: Nếu không muốn sử dụng timestamps tự động
    public $timestamps = true;

}
