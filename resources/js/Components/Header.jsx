import React, { useState } from 'react';
import { Menu, X } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { Link, usePage } from '@inertiajs/react';
// import { useNavigate } from 'react-router-dom';
import axios from '../axiosSetup';
import { router } from '@inertiajs/react';

export default function Header() {
  const [menuOpen, setMenuOpen] = useState(false);
  const toggleMenu = () => setMenuOpen(!menuOpen);
  const closeMenu = () => setMenuOpen(false);
  // const navigate = useNavigate();
  const isAuthenticated = !!localStorage.getItem('auth_token');

  const handleLogout = async () => {
    try{
      await axios.post('/api/admin/logout');
      localStorage.removeItem('auth_token');
      window.location.reload();
    }catch(err){
      console.error('ログアウト失敗:', err);
    }
  };

  return (
    <header className="fixed top-0 left-0 right-0 bg-[#2A2A2A] border-b border-[#3D3D3D] z-50 text-white">
      <div className="mx-w-6xl mx-auto px-6 flex justify-between items-center py-4">
        {/* 左側：ロゴ */}
        <div>
          <h1 className="text-3xl font-crimson-text text-[#D4B08C]" >My Portfolio</h1>
        </div>

        {/* 右側ナビゲーション　＆　ハンバーガー */}
        <div className="flex items-center gap-6">
          {/* PCナビゲーション */}
          <nav className="hidden lg:flex space-x-6">
            <NavLinks />
            {/* ログイン・ログアウト表示 */}
            {isAuthenticated ? (
              <button
                onClick={handleLogout}
                className="text-sm text-red-500 hover:text-red-400 underline text-left"
              >
                Logout
              </button>
            ) : (
              <button
                onClick={() => router.visit('/admin-login')}
                className="text-sm text-white hover:underline"
              >
                Admin Login
              </button>
            )}
          </nav>
          {/* モバイル用メニューアイコン */}
          <button onClick={toggleMenu} className="lg:hidden z-50 text-[#D4B08C]">
            {menuOpen ? <X size={28} /> : <Menu size={28} />}
          </button>
        </div>
      </div>

      {/* モバイル用スライドメニュー */}
      <AnimatePresence>
        {menuOpen && (
          <>
            {/* オーバーレイ */}
            <motion.div
              className="fixed inset-0 bg-[#1C1C1C] bg-opacity-50 z-40"
              onClick={closeMenu}
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
            />

            {/* 右からスライドするパネル */}
            <motion.div
              className="fixed top-0 right-0 h-full w-[200px] bg-[#1C1C1C] text-white p-6 z-50"
              initial={{ x: '100%' }}
              animate={{ x: 0 }}
              exit={{ x: '100%' }}
              transition={{ type: 'tween', duration: 0.3 }}
            >
              <button onClick={closeMenu} className="mb-6">
                <X size={24} />
              </button>
              <nav className="flex flex-col space-y-4 items-start">
                <NavLinks onClick={closeMenu} />
                {/* ログイン・ログアウト表示 */}
                {isAuthenticated ? (
                  <button
                    onClick={handleLogout}
                    className="text-sm text-red-500 hover:text-red-400 underline"
                  >
                    Logout
                  </button>
                ) : (
                  <button
                    onClick={() => router.visit('/admin-login')}
                    className="text-sm text-white hover:underline"
                  >
                    Admin Login
                  </button>
                )}
              </nav>
            </motion.div>
          </>
        )}
      </AnimatePresence>
    </header>
  );
}

// メニューリンク：現在ページなら下線強調
function NavLinks({ onClick = () => {} }) {
  const { url } = usePage(); // <- Insertia で現在パスを取得

  const links = [
    { label: 'Top', href: '/'},
    { label: 'About', href: '/about' },
    { label: 'Skills', href: '/skills' },
    { label: 'Experience', href: '/experience' },
    { label: 'Projects', href: '/projects' },
    { label: 'Hobbies', href: '/hobbies' },
    { label: 'Contact', href: '/contact' },
  ];

  return (
    <>
      {links.map(({ label, href }) => (
        <Link
          key={href}
          href={href}
          onClick={onClick}
          className={`hover:underline ${
            url === href ? 'underline font-bold text-[#D4B08C]' : ''
          }`}
        >
          {label}
        </Link>
      ))}
    </>
  );
}