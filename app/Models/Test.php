<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Test extends Model
{
    protected $table = 'tests';
    protected $primaryKey = 'test_id'; 

    protected $fillable = [
        'section_id', 'name', 'created_at', 'updated_at',
    ];

    public function tests()
    {
        return $this->belongsTo(Section::class, 'section_id');
    }

}