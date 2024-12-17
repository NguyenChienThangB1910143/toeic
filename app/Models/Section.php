<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Section extends Model
{
    protected $table = 'sections'; // Tên bảng trong cơ sở dữ liệu

    protected $primaryKey = 'section_id'; // Đặt khóa chính 
    protected $fillable = [
        'name',
        'image',
        'description',
        'type',
        'created_at',
        'updated_at',
    ];
    public function questions()
    {
        return $this->hasMany(SectionQuestion::class, 'section_id');
    }
    public function lessons()
    {
        return $this->hasMany(Lesson::class, 'section_id');
    }

    public function tests()
    {
        return $this->hasMany(Test::class, 'section_id');
    }
}
