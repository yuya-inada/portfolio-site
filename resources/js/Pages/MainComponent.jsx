import React, { useEffect, useState } from 'react';
import axios from 'axios';
import AppLayout from '@/Layouts/AppLayout';
import TopIntroSection from '@/Components/TopIntroSection';
import SkillsSection from '@/Components/SkillsSection';
import ExperienceSection from '@/Components/ExperienceSection';
import ProjectsSection from '@/Components/ProjectsSection';
import HobbiesSection from '@/Components/HobbiesSection';
import ContactSection from '@/Components/ContactSection';

export default function MainComponent() {
  const [projects, setProjects] = useState([]);
  const [usedSkills, setSkills] = useState([]);

  useEffect(() => {
    // プロジェクト取得
    axios.get('/api/projects')
      .then((res) => {
        setProjects(res.data.data || res.data);
      })
      .catch((err) => {
        console.error('API取得失敗:', err);
      });

    // 使用中のスキル取得
    axios.get('/api/skills/used')
      .then((res) => {
        setSkills(res.data);
      })
      .catch((err) => {
        console.error('スキル取得失敗: ', err);
      });
  }, []);

  function copyEmail(){
    navigator.clipboard.writeText('youreMail@sample.com')
      .then(() => alert('Copied!'))
      .catch((err) => console.error('コピーに失敗', err));
  }

  return (
    <AppLayout>
      <div className="bg-[#1C1C1C] min-h-screen">
        <TopIntroSection copyEmail={copyEmail} />
        <SkillsSection skills={usedSkills} />
        <ExperienceSection projects={projects} />
        <ProjectsSection projects={projects} />
        <HobbiesSection />
        <ContactSection />
      </div>
    </AppLayout>
  );
}