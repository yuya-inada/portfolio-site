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
        return ProjectResource::collection(Project::with('skills')->get());
    }

    /**
     * Display the specified resource.
     */
    // 詳細取得（GET /api/projexts/{id}）
    public function show(string $id)
    {
        return new ProjectResource(Project::with('skills')->findOrFail($id));
    }

    /**
     * Store a newly created resource in storage.
     */
    // 新規追加（POST /api/admin/projects）
    public function store(Request $request){
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'url' => 'nullable|url',
            'image_url' => 'nullable|url',
            'github_url' => 'nullable|url',
            'skill_ids' => 'array|nullable',
            'skill_ids.*' => 'integer|exists:skills,id',
        ]);

        // $user = $request->user();
        // if(!$user){
        //     return response()->json(['message' => '未承認のユーザーです。'], 401);
        // }
        // // 🔑 Sanctumで認証されたユーザーのIDを取得
        // $validated['user_id'] = user()->id;

        // 開発中の仮ユーザー：一時対応
        $validated['user_id'] = 1;

        // プロジェクト作成
        $project = Project::create($validated);

        // スキルの関連付け
        if (!empty($validated['skill_ids'])) {
            $project->skills()->attach($validated['skill_ids']);
        }

        return response()->json([
            'message' => 'Project created successfully.',
            'data' => $project->load('skills'), // スキル情報も一緒に返す
        ], 201);
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
            'image_url' => 'nullable|url',
            'github_url' => 'nullable|url',
            'skill_ids' => 'array|nullable',
            'skill_ids.*' => 'integer|exists:skills,id',
        ]);

        $project->update([
            'title' => $validated['title'],
            'description' => $validated['description'] ?? null,
            'url' => $validated['url'] ?? null,
            'image_url' => $validated['image_url'] ?? null,
            'github_url' => $validated['github_url'] ?? null,
        ]);

        // スキルの関連付け
        if (!empty($validated['skill_ids'])) {
            $project->skills()->sync($validated['skill_ids']);
        }

        return response()->json([
            'message' => 'Project updated successfully.',
            'data' => new ProjectResource($project->load('skills')),
        ]);
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
