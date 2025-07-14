import React, { useEffect, useState } from 'react';
import axios from 'axios';
import AppLayout from '@/Layouts/AppLayout';
import TopIntroSection from '@/Components/TopIntroSection';
import SkillsSection from '@/Components/SkillsSection';
import ExperienceSection from '@/Components/ExperienceSection';
import ProjectsSection from '@/Components/ProjectsSection';
// import HobbiesSection from '@/Components/HobbiesSection';
// import ContactSection from '@/Components/ContactSection';

export default function MainComponent() {
  const [projects, setProjects] = useState([]);
  const [usedSkills, setSkills] = useState([]);
  const [experiences, setExperiences] = useState([]);

  const reloadProjects = async () => {
    try {
      const res = await axios.get('/api/projects');
      setProjects(res.data.data || res.data);
    } catch (err) {
      console.error('API取得失敗:', err);
    }
  };
  
  const reloadExperiences = async () => {
    try {
      const res = await axios.get('/api/experiences');
      setExperiences(res.data.data || res.data);
    } catch (err) {
      console.error('経歴取得失敗:', err);
    }
  };

  useEffect(() => {
    reloadProjects();
    reloadExperiences();

    axios.get('/api/skills/used')
    .then((res) => setSkills(res.data))
    .catch((err) => console.error('スキル取得失敗:', err));
  }, []);

  function copyEmail(){
    navigator.clipboard.writeText('obelu1001@gmail.com')
      .then(() => alert('Copied!'))
      .catch((err) => console.error('コピーに失敗', err));
  }

  const isAuthenticated = !!localStorage.getItem('auth_token');

  return (
    <AppLayout>
      <div className="bg-[#1C1C1C] min-h-screen overflow-x-hidden">
        <TopIntroSection copyEmail={copyEmail} />
        <SkillsSection skills={usedSkills} />
        <ExperienceSection 
          projects={projects}
          experiences={experiences}
          reloadExperiences={reloadExperiences}
          isAuthenticated={isAuthenticated}
        />
        <ProjectsSection 
          projects={projects}
          setSkills={setSkills}
          onProjectsUpdated={() => {
            reloadProjects();
            reloadExperiences();
            axios.get('/api/skills/used')
            .then((res) => setSkills(res.data))
            .catch((err) => console.error('スキル再取得失敗:', err));
          }}
        />
        {/* <HobbiesSection />
        <ContactSection /> */}
      </div>
    </AppLayout>
  );
}