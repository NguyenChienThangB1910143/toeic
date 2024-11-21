<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable; // Kế thừa từ Authenticatable
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;

class Learner extends Authenticatable
{
    use Notifiable;

    protected $table = 'learners';
    public $timestamps = false;


    protected $primaryKey = 'learner_id';

    // Các cột có thể được gán dữ liệu hàng loạt
    protected $fillable = [
        'name',
        'username',
        'email',
        'password',
        'phoneNumber',
        'address',
        'gender',
        'image',
        'status',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
