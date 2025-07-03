// resources/js/Pages/Projects.jsx
import React, { useEffect, useState } from 'react';
import AppLayout from '@/Layouts/AppLayout';
import ProjectsSection from '@/Components/ProjectsSection';
import axios from 'axios';

export default function Projects() {
  const [projects, setProjects] = useState([]);

  useEffect(() => {
    axios.get('/api/projects')
      .then(res => setProjects(res.data.data || res.data))
      .catch(err => console.error('プロジェクト取得失敗:', err));
  }, []);

  return (
    <AppLayout>
      <div className="bg-[#1C1C1C] min-h-screen">
        <ProjectsSection projects={projects} />
      </div>
    </AppLayout>
  );
}