<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Models\Project;

// // メインページ
Route::get('/', function () {
    $projects = Project::with('skills')->get();
    return Inertia::render('MainComponent', ['projects' => $projects]);
});

// Hobiiesページを追加
Route::get('/hobbies', function () {
    return Inertia::render('Hobbies');
});

// コンタクトページ追加
Route::get('/contact', function(){
    return Inertia::render('Contact');
});

// プロジェクトページ追加
Route::get('/projects', function () {
    $projects = App\Models\Project::with('skills')->get();  // 必要なデータを取得
    return Inertia::render('Projects', ['projects' => $projects]);
});

// 自己紹介ページ追加
Route::get('/about', function(){
    return Inertia::render('TopIntro');
});

// スキル紹介ページ追加
Route::get('/skills', function(){
    return Inertia::render('Skills');
});

// 経歴ページ追加
Route::get('/experience', function(){
    return Inertia::render('Experience');
});

// Dashboard
Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// プロフィール編集など（認証要）
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
