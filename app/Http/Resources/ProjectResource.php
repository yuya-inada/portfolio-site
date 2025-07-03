<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProjectResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            // ここに必要な項目だけ書く
            'id'          => $this->id,
            'title'       => $this->title,
            'description' => $this->description,
            'url'         => $this->url,
            'github_url'  => $this->github_url,
            'image_url'   => $this->image_url,
            'skills'      => $this->whenLoaded('skills'),
        ];
    }
}
