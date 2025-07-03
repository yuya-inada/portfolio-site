<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB; // ← これを忘れずに！

class ExperienceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('experiences')->insert([
            [
                'title'   => 'Senior Software Engineer',
                'company' => 'Tech Corp',
                'period'  => '2020 - Present',
                'description' => 'Led development of microservices architecture serving millions of users.',
            ],
            [
                'title'   => 'Software Engineer',
                'company' => 'Innovation Labs',
                'period'  => '2017 - 2020',
                'description' => 'Developed full-stack applications using React and Node.js.',
            ],
        ]);
    }
}