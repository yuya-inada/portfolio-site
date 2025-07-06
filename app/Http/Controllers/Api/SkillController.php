<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Skill;

class SkillController extends Controller
{
    public function store(Request $request){
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'icon' => 'nullable|string|max:255',
            'description' => 'nullable|string|max:255',
            'category' => 'nullable|string|max:255',
        ]);
        $skill = Skill::create($validated);

        return response()->json([
            'message' => 'Skill created successfully.',
            'data' => $skill,
        ], 201);
    }
    public function index(){
        return response()->json(Skill::all());
    }

    // プロジェクトで使用されているスキルだけを返す
    public function useInProjects(){
        $skills = Skill::whereHas('projects')->get();
        return response()->json($skills);
    }
}
