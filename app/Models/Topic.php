<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    protected $table = 'tbl_topic';

    protected $fillable = [
        'topic_id', 'name',	'image', 'topic_status', 'topic_type','created_at','updated_at',	

    ];

}
