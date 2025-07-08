import React, { useState } from 'react';
import axios from '../axiosSetup';

export default function AdminLogin({ onLogin }){
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async(e) => {
    e.preventDefault();
    try{
      const res = await axios.post('/api/login', { email, password });
      localStorage.setItem('auth_token', res.data.token);
      onLogin();
    }catch(err){
      alert('ログイン失敗');
      console.error(err);
    }
  };

  return (
    <>
    <div className="min-h-screen bg-[#2A2A2A] flex items-center justify-center">
      <form 
        onSubmit={handleLogin}
        className="bg-[#1C1C1C] p-8 rounded-lg w-full max-w-sm mx-auto text-white"
      >
        <h2 className="text-2xl mb-4 text-[#D4B08C]">
          Admin Login
        </h2>
        <input 
          type="email"
          className="w-full px-4 py-2 mb-4 bg-[#333] border border-gray-600 rounded"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <input
          type="password"
          className="w-full px-4 py-2 mb-4 bg-[#333] border border-gray-600 rounded"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <button
          type="submit"
          className="w-full bg-[#D4B08C] text-[#2A2A2A] py-2 rounded hover:bg-[#b2946f]"  
        >
          Log In
        </button>
      </form>
    </div>
    </>
  );
}