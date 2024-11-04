<?php

namespace App\Http\Controllers;

use App\Models\Topic;
use Illuminate\Http\Request;

class TopicController extends Controller
{
    public function showQLTopic() {
        $topics = Topic::all();
        return view('backend.QLTopic', compact('topics'));
    }

    public function store(Request $request) {
        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'required|image',
            'topic_status' => 'required|string',
            'topic_type' => 'required|string',
        ]);

        $imagePath = $request->file('image')->store('images', 'public');

        Topic::create([
            'name' => $request->name,
            'image' => $imagePath,
            'topic_status' => $request->topic_status, // This is now the description
            'topic_type' => $request->topic_type,
        ]);

        return redirect()->route('qltopic')->with('success', 'Topic added successfully!');
    }
}
