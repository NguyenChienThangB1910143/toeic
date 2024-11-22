<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\Learner;

class LearnerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Learner::create([
            'name' => 'Test User',
            'username' => 'nct',
            'email' => 'nct@example.com',
            'password' => Hash::make('12345678'), // Mã hóa mật khẩu
            'phoneNumber' => '0123456789',
            'image' => null,
        ]);
    }
}
