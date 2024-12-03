<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vocabulary extends Model
{
    protected $table = 'vocabularys';
    protected $primaryKey = 'vocabulary_id'; 

    protected $fillable = [
        'topic_id'	,
        'word'	,
        'ipa',
        'image'	,
        'meaning',
        'example_sentence',
        'updated_at',
        'created_at',
    ];
    public function topic()
    {
        return $this->belongsTo(Topic::class, 'topic_id');
    }

}