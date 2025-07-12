import React, { useEffect, useState } from 'react';
import AppLayout from '@/Layouts/AppLayout';
import ExperienceSection from '@/Components/ExperienceSection';
import axios from 'axios';

export default function Experience() {
  const [experiences, setExperiences] = useState([]);
  const [projects, setProjects] = useState([]);

  const reloadProjects = async () => {
    try {
      const res = await axios.get('/api/projects');
      setProjects(res.data.data || res.data); // data配列か否か対応
    } catch (err) {
      console.error('プロジェクト取得失敗:', err);
    }
  };

  useEffect(() => {
    axios.get('/api/experiences')
      .then((res) => setExperiences(res.data.data || res.data)) // data配列か否か対応
      .catch((err) => console.error('経験取得失敗:', err));

    reloadProjects();
  }, []);

  return (
    <AppLayout>
      <div className="bg-[#1C1C1C] min-h-screen">
        <ExperienceSection
          projects={projects}
          experiences={experiences} />
      </div>
    </AppLayout>
  );
}