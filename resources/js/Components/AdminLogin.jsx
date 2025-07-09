import React, { useState } from 'react';
import axios from 'axios';

export default function AdminLogin({ onLogin }){
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = async(e) => {
    e.preventDefault();
    try{
      const res = await axios.post('/api/login', { email, password });
      onLogin();
    }catch(err){
      alert('ログイン失敗');
      console.error(err);
    }
  };

  return (
    <form onSubmit={handleLogin}>
      <h2>Admin Login</h2>
      <input type="email" placeholder="Email" value={email} onChange={(e) => setEmail(e.target.value)} required />
      <input type="password" placeholder="Password" value={password} onChange={(e) => setPassword(e.target.value)} required />
      <button type="submit">Log In</button>
    </form>
  );
}