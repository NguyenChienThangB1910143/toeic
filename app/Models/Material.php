<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Material extends Model
{
    use HasFactory;

    protected $table = 'materials';

    protected $primaryKey = 'material_id';

    // Khai báo các trường có thể được gán
    protected $fillable = [
        'title',
        'description',
        'file_pdf',
    ];

    // Tùy chọn: Nếu không muốn sử dụng timestamps tự động
    public $timestamps = true;
}
