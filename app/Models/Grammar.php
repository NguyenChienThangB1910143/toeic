<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Grammar extends Model
{
    use HasFactory;

    protected $table = 'grammars';

    protected $primaryKey = 'grammar_id';

    // Các cột có thể được gán dữ liệu hàng loạt
    protected $fillable = [
        'name'
    ];

    // Nếu không muốn dùng timestamp, có thể bỏ
    public $timestamps = true;
}
