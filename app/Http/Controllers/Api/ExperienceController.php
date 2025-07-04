<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Experience;
use App\Http\Resources\ExperienceResource;

class ExperienceController extends Controller
{
    public function index() {
        return ExperienceResource::collection(
            Experience::with('projects.skills')->get()
        );
    }

    public function store(Request $request) {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'company' => 'required|string|max:255',
            'period' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        $experience = Experience::create($validated);

        return response()->json([
            'message' => 'Experience created successfully.',
            'data' => $experience,
        ], 201);
    }

    public function update(Request $request, $id){
        $experience = Experience::findOrFail($id);
        $experience->update([
            'title'       => $request->input('title'),
            'company'     => $request->input('company'),
            'period'      => $request->input('period'),
            'description' => $request->input('description'),
        ]);

        // プロジェクト同期処理（experience_projects 中間テーブル更新）
        if($request->has('projects')){
            $experience->projects()->sync($request->input('projects'));
        }

        return response()->json([
            'message' => 'Experinece updated successfully.'
        ]);
    }
}