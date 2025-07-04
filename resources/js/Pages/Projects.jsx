// resources/js/Pages/Projects.jsx
import React from 'react';
import AppLayout from '@/Layouts/AppLayout';
import ProjectsSection from '@/Components/ProjectsSection';

export default function Projects({ projects }) {
  return (
    <AppLayout>
      <div className="bg-[#1C1C1C] min-h-screen">
        <ProjectsSection projects={projects} />
      </div>
    </AppLayout>
  );
}