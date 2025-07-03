// resources/js/Pages/Skills.jsx
import React, { useEffect, useState } from 'react';
import AppLayout from '@/Layouts/AppLayout';
import SkillsSection from '@/Components/SkillsSection';
import axios from 'axios';

export default function Skills() {
  const [skills, setSkills] = useState([]);

  useEffect(() => {
    axios.get('/api/skills/used')
      .then((res) => setSkills(res.data))
      .catch((err) => console.error('スキル取得失敗:', err));
  }, []);

  return (
    <AppLayout>
      <div className="bg-[#1C1C1C] min-h-screen">
        <SkillsSection skills={skills} />
      </div>
    </AppLayout>
  );
}