<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Learner;

class LearnerController extends Controller
{
    // Phương thức hiển thị danh sách học viên
    public function showqlLearner()
    {
        $learners = Learner::paginate(5);
        return view('backend.learners.index', compact('learners'));
    }

}
