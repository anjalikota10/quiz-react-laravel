<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    protected $fillable = ['Course_id','req_id','Selected_ans','Question_id'];
}
