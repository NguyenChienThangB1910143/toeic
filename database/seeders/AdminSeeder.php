<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\Admin; // Import đúng class Admin

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Admin::create([
            'account' => 'admin0',
            'password' => Hash::make('123'), // Mã hóa mật khẩu "123" bằng Bcrypt
            'name' => 'Admin Name',
            'email' => 'admin@example.com',
            'image' => '',
        ]);
    }
}
