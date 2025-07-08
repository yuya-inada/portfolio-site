<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProjectController;
use App\Models\Skill;
use App\Http\Controllers\Api\ExperienceController;
use App\Http\Controllers\Api\SkillController;

// 管理者用（認証が必要）
Route::middleware('auth:sanctum')->prefix('admin')->group(function (){
    Route::apiResource('projects', ProjectController::class)->except(['index', 'show']);
});
// 管理者用（編集）
// 一時認証を外して動作テスト
    // Route::middleware('auth:sanctum')->put('/projects/{id}', [ProjectController::class, 'update']);
    Route::put('/projects/{id}', [ProjectController::class, 'update']);
    Route::put('/experiences/{id}', [ExperienceController::class, 'update']);
    // Route::middleware('auth:sanctum')->post('/projects', [ProjectController::class, 'store']);
    Route::post('/projects', [ProjectController::class, 'store']);
    Route::post('/experiences', [ExperienceController::class, 'store']);
    Route::delete('/experiences/{id}', [ExperienceController::class, 'destroy']);
    Route::delete('/projects/{id}', [ProjectController::class, 'destroy']);

// 一般公開用（誰でもアクセス可）
// Projects
Route::get('/projects', [ProjectController::class, 'index']);
Route::get('/projects/{id}', [ProjectController::class, 'show']);


// Skills
Route::get('/skills', [SkillController::class, 'index']);
Route::post('/skills', [SkillController::class, 'store']);
Route::get('/skills/used', [SkillController::class, 'useInProjects']);

// Experience
Route::get('/experiences', [ExperienceController::class, 'index']);

