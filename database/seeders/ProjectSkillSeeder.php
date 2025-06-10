<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ProjectSkillSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $now = Carbon::now();

        DB::table('project_skill')->insert([
            [
                'project_id' =>1,
                'skill_id' => 1, // HTML
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'project_id' => 1,
                'skill_id' => 2, //CSS
                'created_at' => $now,
                'updated_at' => $now,
            ]
            ]);
    }
}
