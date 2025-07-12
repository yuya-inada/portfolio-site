import React, { useState, useEffect } from 'react';
import AppLayout from '@/Layouts/AppLayout';
import ProjectsSection from '@/Components/ProjectsSection';
import ExperienceSection from '@/Components/ExperienceSection';
import axios from 'axios';

export default function ProjectsPage(){
  const [projects, setProjects] = useState([]);
  const [skills, setSkills] = useState([]);
  const [experiences, setExperiences] = useState([]);

  const fetchProjects = async () => {
    try{
      const res = await axios.get('/api/projects');
      setProjects(res.data.data || res.data);
    }catch(error){
      console.error('プロジェクト取得失敗:', error);
    }
  };

  const fetchExperiences = async () => {
    try {
      const res = await axios.get('/api/experiences');
      setExperiences(res.data.data || res.data);
    } catch (error) {
      console.error('経験取得失敗:', error);
    }
  };

  useEffect(() => {
    fetchProjects();
    fetchExperiences();

    const fetchSkills = async() => {
      try{
        const res = await axios.get('/api/skills/used');
        setSkills(res.data);
      }catch(error){
        console.error('スキル取得失敗:', error);
      }
    };
    fetchSkills();
  }, []);

  const fetchProjectsAndSkills = async () => {
    try {
      console.log('fetchProjectsAndSkills start');
      const resProject = await axios.get('/api/projects');
      setProjects(resProject.data.data || resProject.data);
      const resSkills = await axios.get('/api/skills/used');
      setSkills(resSkills.data);
      console.log('fetchProjectsAndSkills success');

      // 経験情報も再取得
      const resExp = await axios.get('/api/experiences');
      setExperiences(resExp.data.data || resExp.data);
    } catch (error) {
      console.error('プロジェクト・スキル・経験再取得失敗:', error);
    }
  };

  return (
    <AppLayout>
      <div className="bg-[#1C1C1C] min-h-screen px-4">
        <ProjectsSection 
          projects={projects}
          setSkills={setSkills}  // 👈 これが抜けていた
          onProjectsUpdated={fetchProjectsAndSkills}
        />
        {/* <ExperienceSection
          projects={projects}
          experiences={experiences}
          reloadProjects={fetchProjectsAndSkills}
        /> */}
      </div>
    </AppLayout>
  );
}