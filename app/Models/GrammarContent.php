<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GrammarContent extends Model
{
    protected $table = 'grammars_contents';
    protected $primaryKey = 'content_id'; 

    protected $fillable = [
        'grammar_id', 'title', 'content', 'created_at', 'updated_at',
    ];
    public function grammarcontent()
    {
        return $this->belongsTo(Grammar::class, 'grammar_id');
    }
}