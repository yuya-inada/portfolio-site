<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Project;
use Carbon\Carbon;

class ProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $now = Carbon::now();
        Project::insert([
            [
                'user_id' => 1,
                'title' => 'Portfolio Website',
                'description' => 'A personal portfolio site built with Laravel.',
                'url' => 'https://example.com/portfolio',
                'image_url' => '',
                'github_url' => '',
                'created_at' => $now,
                'updated_at' => $now,
            ]
        ]);
    }
}
