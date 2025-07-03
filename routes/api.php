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
Route::post('/experiences', [ExperienceController::class, 'store']);

