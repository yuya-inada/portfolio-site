<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Contact;
use Carbon\Carbon;

class ContactSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $now = Carbon::now();
        Contact::insert([
            [
                'name' => 'John Doe',
                'email' => 'john@example.com',
                'message' => 'This is a test contact message.',
                'created_at' => $now,
                'updated_at' => $now,
            ]
        ]);
    }
}
