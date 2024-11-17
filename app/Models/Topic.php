<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    use HasFactory;

    protected $table = 'topics'; // Tên bảng trong database
    protected $primaryKey = 'id'; // Đặt khóa chính 
    // Các cột có thể được gán hàng loạt
    protected $fillable = [
        'name', 
        'image', 
        'description', 
        'topic_type',
        'created_at',
        'updated_at',
    ];

    // Định nghĩa mối quan hệ với các model khác nếu có
    // Ví dụ: Một topic có thể có nhiều lessons
    public function lessons()
    {
        return $this->hasMany(Lesson::class);
    }
}
