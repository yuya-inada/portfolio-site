<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ExperienceResource extends JsonResource
{
    public function toArray(Request $request): array{
        return [
            'id'          => $this->id,
            'title'       => $this->title,
            'company'     => $this->company,
            'period'      => $this->period,
            'description' => $this->description,
            'created_at'  => $this->created_at,
            'projects'    => $this->projects->map(function ($project) {
                return [
                    'id'          => $project->id,
                    'title'       => $project->title,
                    'description' => $project->description,
                    'url'         => $project->url,
                    'github_url'  => $project->github_url,
                    'image_url'   => $project->image_url,
                    'skills'      => $project->skills->map(function ($skill) {
                        return [
                            'id'   => $skill->id,
                            'name' => $skill->name,
                            'icon' => $skill->icon,
                        ];
                    }),
                ];
            }),
        ];
    }
}
