<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Steam Guide</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/bookmark.css">
</head>
<body>
    <!-- Header/Navbar -->
    <header class="navbar">
        <div class="navbar-left">
            <button class="menu-icon">☰</button>
            <div class="logo">AI Steam Guide</div>
        </div>
        <div class="navbar-center">
            <div class="search-container">
                <input type="text" placeholder="Search" class="search-bar">
                <button class="search-btn">
                    <img src="../images/search-icon.png" alt="Search Icon" class="search-icon">
                </button>
            </div>
        </div>        
        <div class="navbar-right">
            <button class="bookmark" onclick="location.href='../pages/bookmark.jsp'">
                <img src="../images/bookmark.png" alt="bookmark" class="bookmark-img">
            </button>
            <button class="icon">
                <img src="../images/notification-icon.png" alt="Notification Icon" class="icon-img">
            </button>            
            <button class="login-btn">로그인/회원가입</button>
        </div>
    </header>
    
    <nav class="secondary-menu">
        <ul>
            <li><a href="../pages/coummnity.jsp">Coummnity</a></li> 
            <li><a href="../pages/AI_choice.jsp">AI_choice</a></li> 
            <li><a href="../pages/sale.jsp">Sale games</a></li> 
            <li><a href="../pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <main>

        <section class="bookmark-page">
            <h2 class="bookmark-title">'name'님의 북마크</h2>
            <div class="bookmark-container">
                <!-- Filters Sidebar -->
                <aside class="filters-sidebar">
                    <h3>Filters</h3>
                    <input type="text" placeholder="search" class="filter-search">
                    <div class="filter-section">
                        <h4>장르</h4>
                        <ul>
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Healing</a></li>
                            <li><a href="#">Single</a></li>
                            <li><a href="#">Horror</a></li>
                            <li><a href="#">Together</a></li>
                        </ul>
                    </div>
                </aside>
        
                <!-- Bookmark List -->
                <div class="bookmark-list">
                    <div class="bookmark-item">
                        <img src="../images/game.png" alt="Game Thumbnail" class="bookmark-thumbnail">
                        <div class="bookmark-info">
                            <h3 class="bookmark-game-title">중국 장사게임</h3>
                            <p>이 게임에 적합한 설명이 들어갑니다. 부가적인 정보도 추가 가능.</p>
                        </div>
                        <div class="bookmark-actions">
                            <span class="bookmark-price">무료</span>
                            <button class="bookmark-steam-btn">Steam 구매하러가기</button>
                            <button class="bookmark-icon">
                                <img src="../images/bookmark-icon.png" alt="Bookmark Icon">
                            </button>
                        </div>
                    </div>
                    <!-- Repeat for more games -->
                    <div class="bookmark-item">
                        <img src="../images/game.png" alt="Game Thumbnail" class="bookmark-thumbnail">
                        <div class="bookmark-info">
                            <h3 class="bookmark-game-title">A Dance of Fire and Ice</h3>
                            <p>이 게임에 적합한 설명이 들어갑니다. 부가적인 정보도 추가 가능.</p>
                        </div>
                        <div class="bookmark-actions">
                            <span class="bookmark-price">무료</span>
                            <button class="bookmark-steam-btn">Steam 구매하러가기</button>
                            <button class="bookmark-icon">
                                <img src="../images/bookmark-icon.png" alt="Bookmark Icon">
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>
    </body>


    <div id="footer"></div>

    <style>
        .logo {
            cursor: pointer; /* 클릭 가능한 손 모양 커서를 표시 */
        }
    </style>

    <script>
        // footer.html 파일을 동적으로 로드
        fetch('../pages/footer.jsp')
            .then(response => response.text())
            .then(data => {
                document.getElementById('footer').innerHTML = data;
            });
    
        // 로그인/회원가입 버튼 클릭 시 페이지 이동
        document.addEventListener('DOMContentLoaded', () => {
            const loginButton = document.querySelector('.login-btn');
            if (loginButton) {
                loginButton.addEventListener('click', () => {
                    window.location.href = '../pages/login.jsp'; // 로그인 페이지로 이동
                });
            }
        });
        document.addEventListener('DOMContentLoaded', () => {
            const mainLink = document.querySelector('.logo'); // 텍스트를 감싼 클래스 선택
            if (mainLink) {
                mainLink.addEventListener('click', () => {
                    window.location.href = '../pages/main.jsp'; // 메인 페이지로 이동
                });
            }
        });
    </script>
    
    </html>
