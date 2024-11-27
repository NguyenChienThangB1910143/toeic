<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class DictionaryController extends Controller
{
    public function index()
    {
        return view('dictionary.index');
    }

    public function search(Request $request)
    {
        $word = strtolower(trim($request->input('word')));

        // Gửi yêu cầu đến Free Dictionary API
        $url = "https://api.dictionaryapi.dev/api/v2/entries/en/{$word}";
        $response = Http::get($url);

        if ($response->successful()) {
            $data = $response->json();
            if (isset($data[0]['meanings'][0]['definitions'])) {
                $definitions = $data[0]['meanings'][0]['definitions'];
                $meanings = [];
        
                foreach ($definitions as $definition) {
                    $meanings[] = $definition['definition'];
                }
        
                return response()->json([
                    'word' => $word,
                    'meanings' => $meanings
                ]);
            }
        }
        

        return response()->json([
            'word' => $word,
            'meanings' => ["Word not found in the dictionary."]
        ]);
    }
}
