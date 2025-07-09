import React from 'react';
import { Link } from '@inertiajs/react';
// import { motion } from "framer-motion";

export default function SkillDetail({ skill }){
  return (
    <div className="min-h-screen bg-[#1C1C1C] text-white py-10 px-6 font-crimson-text">
      <div className="max-w-4xl mx-auto">
        <Link href="/skills" className="text-sm text-[#D4B08C] hover:underline mb-6 inlien-block">
          ← Back to Skills
        </Link>
        <div className="bg-[#2A2A2A] p-8 rounded-lg shadow-lg border border-[#3D3D3D]">
          <div className="flex flex-col items-center justify-center mt-5 mb-6">
            <h2 className="text-4xl text-[#D4B08C] mb-4">{skill.name}</h2>
            <i className={`${skill.icon} text-5xl mb-4 text-[#D4B08C]`}></i>
          </div>
          <div className="mt-8 grid grid-cols-1 md:grid-cols-2 gap-10">
            <div>
              {skill.description && skill.description.trim() !== '' ? (
                <p className="mb-6 text-lg leading-relaxed">
                  {skill.description}
                </p>
              ) : (
                <p className="text-gray-400">説明が登録されていません。</p>
              )}
            </div>
            <div>
                <h3 className="text-xl font-semibold mb-2 text-[#D4B08C]">
                  使用されているプロジェクト：
                </h3>
                {skill.projects && skill.projects.length > 0 ? (
                  <ul className="list-disc ml-6">
                    {skill.projects.map(project => (
                      <li key={project.id}>{project.title}</li>
                    ))}
                  </ul>
                ) : (
                  <p className="text-gray-400">このスキルはまだプロジェクトに使用されていません。</p>
                )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};