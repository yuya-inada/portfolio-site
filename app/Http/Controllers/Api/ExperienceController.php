<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Experience;
use App\Http\Resources\ExperienceResource;

class ExperienceController extends Controller
{
    public function index() {
        return ExperienceResource::collection(
            Experience::with('projects.skills')->get()
        );
    }

    public function store(Request $request) {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'company' => 'required|string|max:255',
            'period' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        $experience = Experience::create($validated);

        return response()->json([
            'message' => 'Experience created successfully.',
            'data' => $experience,
        ], 201);
    }
}