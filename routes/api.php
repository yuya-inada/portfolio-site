<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProjectController;
use App\Models\Skill;
use App\Http\Controllers\Api\ExperienceController;
use App\Http\Controllers\Api\SkillController;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

Route::post('/login', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
    ]);

    $user = User::where('email', $request->email)->first();
    if (! $user || ! Hash::check($request->password, $user->password)) {
        throw ValidationException::withMessages([
            'email' => ['The provided credentials are incorrect.'],
        ]);
    }
    // トークンを生成して返す
    return response()->json([
        'token' => $user->createToken('admin-token')->plainTextToken,
        'user' => $user
    ]);
});
// 管理者用API（編集・削除）
Route::middleware('auth:sanctum')->prefix('admin')->group(function (){
    Route::post('/logout', function(Request $request){
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Logged out']);
    });
    // プロジェクト　登録・編集・削除
    Route::apiResource('projects', ProjectController::class)->except(['index', 'show']);

    // 経歴
    Route::post('/experiences', [ExperienceController::class, 'store']);
    Route::put('/experiences/{id}', [ExperienceController::class, 'update']);
    Route::delete('/experiences/{id}', [ExperienceController::class, 'destroy']);
    
    // スキル
    Route::post('/skills', [SkillController::class, 'store']);
});

// 一般公開用（誰でもアクセス可）
// Projects
Route::get('/projects', [ProjectController::class, 'index']);
Route::get('/projects/{id}', [ProjectController::class, 'show']);
// Skills
Route::get('/skills', [SkillController::class, 'index']);
Route::get('/skills/used', [SkillController::class, 'useInProjects']);
Route::get('/skills/{id}', [SkillController::class, 'show']);
// Experience
Route::get('/experiences', [ExperienceController::class, 'index']);

