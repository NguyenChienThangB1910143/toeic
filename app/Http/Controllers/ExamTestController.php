<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ExamTestController extends Controller
{
    public function ExamTestIndex(Request $request){
        
        return view('test');
    }
}
