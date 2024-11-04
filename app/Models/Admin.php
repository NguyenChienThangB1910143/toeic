<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    protected $table = 'tbl_admin';

    protected $fillable = [
        'account', 'password', 'name', 'email', 'image',
    ];

    protected $hidden = [
        'password',
    ];
}

