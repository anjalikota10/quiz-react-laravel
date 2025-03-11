<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Questions extends Model
{
      protected $fillable = ['Questions','Course_id','Answer','Correct_answer'];
}
