<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Learner extends Authenticatable implements MustVerifyEmail
{
    use Notifiable, HasFactory;

    protected $table = 'learners';
    public $timestamps = false;

    protected $primaryKey = 'learner_id';

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

    // Hàm set password để tự động mã hóa mật khẩu
}
