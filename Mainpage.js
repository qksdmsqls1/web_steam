import React, { useState, useEffect } from 'react';
import logo from '../assets/그림1.png'; // 로컬 이미지
import searchIcon from '../assets/그림2.jpg'; // 돋보기 이미지
import s from '../assets/다운로드.jpg'; // 첫 번째 이미지
import s2 from '../assets/다운로드2.jpg'; // 두 번째 이미지

function MainPage() {
  const images = [s, s2]; // 슬라이드할 이미지 배열
  const [currentIndex, setCurrentIndex] = useState(0); // 현재 이미지 인덱스

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentIndex((prevIndex) => (prevIndex + 1) % images.length);
    }, 3000); // 3초마다 이미지 전환

    return () => clearInterval(interval); // 컴포넌트 언마운트 시 인터벌 정리
  }, [images.length]);

  return (
    <div style={{ width: 1920, height: 3390, background: 'white', flexDirection: 'column', justifyContent: 'center', alignItems: 'flex-start', gap: 10, display: 'inline-flex' }}>
      <div style={{ width: 1920, height: 3390, position: 'relative', background: '#D0D0D0' }}>
        <div style={{ width: 264, height: 41, left: 1571, top: 91, position: 'absolute', textAlign: 'center', color: 'black', fontSize: 30, fontFamily: 'Inter', fontWeight: '400', wordWrap: 'break-word', zIndex: 3 }}>
          로그인/회원가입
        </div>

        {/* 검색 바와 로고 */}
        <div style={{ width: 1184, height: 119, left: 272, top: 53, position: 'absolute', zIndex: 3 }}>
          <div style={{ width: 1060, height: 82, left: 124, top: 18, position: 'absolute', background: '#262626', borderRadius: 199, overflow: 'hidden' }}>
            {/* 검색 바 (하얀색) */}
            <div style={{ width: 1000, height: 40, padding: 10, left: 20, top: 11, position: 'absolute', background: 'white', borderRadius: 36, display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
              {/* 입력 필드 */}
              <input type="text" placeholder="검색" style={{ border: 'none', outline: 'none', flex: 1, paddingLeft: '10px', fontSize: '18px' }} />
              {/* 돋보기 이미지 */}
              <img style={{ width: '30px', height: '30px', marginRight: '10px' }} src={searchIcon} alt="돋보기 아이콘" />
            </div>
          </div>

          {/* 로고 */}
          <div style={{ width: 96, height: 119, left: 0, top: 0, position: 'absolute' }}>
            <img style={{ width: 96, height: 96, left: 0, top: 0, position: 'absolute' }} src={logo} alt="ASG 로고" />
          </div>
        </div>

        {/* 슬라이드 이미지 */}
        <div style={{ width: 1868, height: 815, left: 18, top: 215, position: 'absolute', zIndex: 1 }}>
          <img
            style={{ width: '100%', height: '100%', objectFit: 'cover' }}
            src={images[currentIndex]}
            alt="슬라이드 이미지"
          />
        </div>

        {/* 상단 커뮤니티 회색 배경 */}
        <div style={{ width: 1824, height: 78, left: 39, top: 250, position: 'absolute', background: '#989898', zIndex: 2 }}>
          <div style={{ width: 1765, height: 43, left: 33, top: 20, position: 'absolute', textAlign: 'center', color: 'white', fontSize: 30, fontFamily: 'Inter', fontWeight: '400', wordWrap: 'break-word' }}>
            <span style={{ margin: '0 50px' }}>커뮤니티</span>
            <span style={{ margin: '0 50px' }}>●</span>
            <span style={{ margin: '0 50px' }}>AI추천 받기</span>
            <span style={{ margin: '0 50px' }}>●</span>
            <span style={{ margin: '0 50px' }}>세일중인 게임</span>
            <span style={{ margin: '0 50px' }}>●</span>
            <span style={{ margin: '0 50px' }}>게임목록</span>
          </div>
        </div>

        {/* 하단 커뮤니티 회색 배경 */}
        <div style={{ width: 1824, height: 78, left: 39, top: 900, position: 'absolute', background: '#989898', zIndex: 2 }} />

        {/* 나머지 페이지 내용 */}
        <div style={{ width: 1792, height: 505, left: 57, top: 1087, position: 'absolute', zIndex: 1 }}>
          <img style={{ width: 377, height: 451, left: 10, top: 54, position: 'absolute' }} src="https://via.placeholder.com/377x451" alt="추천 게임 이미지 1" />
          <img style={{ width: 377, height: 451, left: 487, top: 54, position: 'absolute' }} src="https://via.placeholder.com/377x451" alt="추천 게임 이미지 2" />
          <img style={{ width: 377, height: 451, left: 938, top: 54, position: 'absolute' }} src="https://via.placeholder.com/377x451" alt="추천 게임 이미지 3" />
          <img style={{ width: 377, height: 451, left: 1415, top: 54, position: 'absolute' }} src="https://via.placeholder.com/377x451" alt="추천 게임 이미지 4" />
          <div style={{ width: 233, height: 36, left: 0, top: 0, position: 'absolute', textAlign: 'center', color: 'black', fontSize: 30, fontFamily: 'Inter', fontWeight: '400', wordWrap: 'break-word' }}>
            오늘의 추천게임
          </div>
        </div>

        <div style={{ width: 1782, height: 640, left: 67, top: 1727, position: 'absolute' }}>
          <div style={{ width: 986, height: 575, left: 10, top: 65, position: 'absolute', backgroundImage: 'url(https://via.placeholder.com/986x575)', backgroundSize: 'cover' }}>
            <div style={{ width: 1127, height: 378, left: 0, top: -6, position: 'absolute' }} />
          </div>
          <div style={{ width: 740, height: 575, left: 1042, top: 65, position: 'absolute', backgroundImage: 'url(https://via.placeholder.com/740x575)', backgroundSize: 'cover' }}>
            <div style={{ width: 1127, height: 378, left: 0, top: -6, position: 'absolute' }} />
          </div>
          <div style={{ width: 233, height: 36, left: 0, top: 0, position: 'absolute', textAlign: 'center', color: 'black', fontSize: 30, fontFamily: 'Inter', fontWeight: '400', wordWrap: 'break-word' }}>
            올해의 게임
          </div>
        </div>

        <div style={{ width: 1920, height: 532, left: 0, top: 2858, position: 'absolute', background: '#6E6E6E' }}>
          <img style={{ width: 367, height: 367, left: 100, top: 82, position: 'absolute' }} src="https://via.placeholder.com/367x367" alt="추가 이미지" />
        </div>
      </div>
    </div>
  );
}

export default MainPage;
