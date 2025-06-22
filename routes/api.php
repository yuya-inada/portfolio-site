<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProjectController;

// 管理者用（認証が必要）
Route::middleware('auth:sanctum')->prefix('admin')->group(function (){
    Route::apiResource('projects', ProjectController::class)->except(['index', 'show']);
    Route::post('/admin/projects', [ProjectController::class, 'store']);
    Route::put('/admin/projects/{id}', [ProjectController::class, 'update']);
    Route::delete('/admin/projects/{id}', [ProjectController::class, 'destroy']);
});

// 一般公開用
Route::get('/projects', [ProjectController::class, 'index']);
Route::get('/projects/{id}', [ProjectController::class, 'show']);

