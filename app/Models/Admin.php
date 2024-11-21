<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    protected $table = 'admin';
    protected $primaryKey = 'id'; // Đặt khóa chính cho model nếu khác `id`
    protected $fillable = [
        'account', 'password', 'name', 'email', 'image',
    ];

    protected $hidden = [
        'password',
    ];
}

