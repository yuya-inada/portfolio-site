<?php

namespace App\Http\Controllers;

use App\Models\Project;
use Illuminate\Http\Request;
use App\Http\Resources\ProjectResource;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    // 一覧取得　（GET　/api/projects）
    public function index()
    {
        // return Project::all();
        return ProjectResource::collection(Project::all());
    }

    /**
     * Display the specified resource.
     */
    // 詳細取得（GET /api/projexts/{id}）
    public function show(string $id)
    {
        return Project::findOrFail($id);
    }

    /**
     * Store a newly created resource in storage.
     */
    // 新規追加（POST /api/admin/projects）
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'url' => 'nullable|url',
        ]);

        $project = Project::create($validated);
        return response()->json($project, 201);
    }

    /**
     * Update the specified resource in storage.
     */
    // 更新　(PUT /api/admin/projects/{id})
    public function update(Request $request, string $id)
    {
        $project = Project::findOrFail($id);
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'url' => 'nullable|url',
        ]);

        $project->update($validated);
        return response()->json($project);
    }

    /**
     * Remove the specified resource from storage.
     */
    // 削除　(DELETE /api/admin/projects/{id})
    public function destroy(string $id)
    {
        $project = Project::findOrFail($id);
        $project->delete();

        return response()->json(['message' => '削除しました']);
    }
}
