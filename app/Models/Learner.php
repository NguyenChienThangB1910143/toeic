<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Learner extends Model
{
    use HasFactory;

    protected $table = 'learners';

    protected $primaryKey = 'learner_id';

    // Các cột có thể được gán dữ liệu hàng loạt
    protected $fillable = [
        'name'	,
        'email'	,
        'username',	
        'password'	,
        'address'	,
        'phoneNumber',	
        'gender',
        'image'	,
        'status'	,
    ];

}
