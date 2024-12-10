<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TestQuestion extends Model
{
    protected $table = 'test_question';
    protected $primaryKey = 'test_question_id'; 

    protected $fillable = ['test_id', 'question_id'];

    public function test()
{
    return $this->hasMany(Test::class, 'test_id');
}

}