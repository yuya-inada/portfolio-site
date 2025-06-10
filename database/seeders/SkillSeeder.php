<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Skill;
use Carbon\Carbon;

class SkillSeeder extends Seeder
{
    public function run(): void
    {
        $now = Carbon::now();
        Skill::insert([
            [
                'name' => 'HTML',
                'icon' => 'fab fa-html5',
                'description' => 'Markup language for web pages.',
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'name' => 'CSS',
                'icon' => 'fab fa-css3-alt',
                'description' => 'Style sheet language for designing web pages.',
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'name' => 'JavaScript',
                'icon' => 'fab fa-js',
                'description' => 'Programming language for interactive web apps.',
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'name' => 'PHP',
                'icon' => 'fab fa-php',
                'description' => 'Server-side scripting language.',
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'name' => 'Laravel',
                'icon' => 'fab fa-laravel',
                'description' => 'PHP web framework for modern applications.',
                'created_at' => $now,
                'updated_at' => $now,
            ],
        ]);
    }
}