// resources/js/Pages/Experience.jsx
import React, { useEffect, useState } from 'react';
import AppLayout from '@/Layouts/AppLayout';
import ExperienceSection from '@/Components/ExperienceSection';
import axios from 'axios';

export default function Experience() {
  const [experiences, setExperiences] = useState([]);

  useEffect(() => {
    axios.get('/api/experiences')
      .then((res) => setExperiences(res.data))
      .catch((err) => console.error('経験取得失敗:', err));
  }, []);

  return (
    <AppLayout>
      <div className="bg-[#1C1C1C] min-h-screen">
        <ExperienceSection experiences={experiences} />
      </div>
    </AppLayout>
  );
}