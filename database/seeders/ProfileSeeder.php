<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Profile;
use Carbon\Carbon;

class ProfileSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $now = Carbon::now();
        Profile::insert([
            [
                'user_id' => 1,
                'bio' => 'I am a full-stack developer with a passion for learning.',
                'location' => 'Tokyo, Japn',
                'website' => 'https://example.com',
                'created_at' => $now,
                'updated_at' => $now,
            ]
        ]);
    }
}
