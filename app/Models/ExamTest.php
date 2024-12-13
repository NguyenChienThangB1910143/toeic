<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamTest extends Model
{
    use HasFactory;

    // Đặt tên bảng nếu bảng không theo quy tắc Laravel (bảng theo kiểu plural)
    protected $table = 'exam_tests';

    // Đặt khóa chính nếu nó không phải là 'id'
    protected $primaryKey = 'id';

    // Tắt tự động timestamps (nếu không có cột created_at và updated_at trong bảng)
    public $timestamps = false;

    // Các thuộc tính được phép gán hàng loạt
    protected $fillable = [
        'exam_id',
        'part1_test_id',
        'part2_test_id',
        'part3_test_id',
        'part4_test_id',
        'part5_test_id',
        'part6_test_id',
        'part7_test_id',
    ];

    // Nếu bạn muốn tạo các mối quan hệ với các bảng khác, bạn có thể thêm các phương thức như:
    // public function exam() {
    //     return $this->belongsTo(Exam::class);
    // }
}
