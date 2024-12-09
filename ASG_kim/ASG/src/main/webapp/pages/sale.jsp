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
    <link rel="stylesheet" href="../css/sale.css">
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
        <section class="sale-banner">
            <img src="../images/sale.jpg" alt="Holiday Sale Banner" class="banner-image">
        </section>

        <section class="featured-game">
            <img src="../images/game.png" alt="Featured Game Image" class="featured-game-image">
        </section>
        
        <section class="game-description">
            <h2>Beyond: Two Souls</h2>
            <p>
                이번 AI가 10월의 Best game으로 뽑았습니다! <br>
                Beyond: Two Souls는 주변 동료들과 함께하며 좀비 세계에서<br>
                이 세계를 탈출하는 게임으로 스릴러, 퍼즐, 협동을 총망라한...
            </p>
            <div class="featured-price-container">
                <div class="price-top">
                    <span class="featured-original-price">$19,000원</span>
                </div>
                <div class="price-bottom">
                    <span class="featured-discount-box">-60%</span>
                    <span class="featured-discount-price">$7,000원</span>
                </div>
                <button class="featured-game-bookmark">
                    <img src="../images/bookmark.png" alt="Bookmark" class="featured-game-bookmark-img">
                </button>
            </div>
        </section>

        <section class="free-games">
            <h2>무료 Game</h2>
            <div class="free-game-row">
                <div class="free-game-card">
                    <img src="../images/game.png" alt="Baldur's Gate" class="free-game-image">
                    <div class="free-game-info">
                        <p class="free-game-title">Baldur's Gate</p>
                        <p>혁명이 되어가는 게임! 이 게임을 해보고 싶다면 어떻게 해야하죠? 어떤 설명을 남아야 하죠?</p>
                        <span class="free-game-price">무료</span>
                    </div>
                </div>
                <div class="free-game-card">
                    <img src="../images/game.png" alt="Rust" class="free-game-image">
                    <div class="free-game-info">
                        <p class="free-game-title">Rust</p>
                        <p>혁명이 되어가는 게임! 이 게임을 해보고 싶다면 어떻게 해야하죠? 어떤 설명을 남아야 하죠?</p>
                        <span class="free-game-price">무료</span>
                    </div>
                </div>
                <div class="free-game-card">
                    <img src="../images/game.png" alt="Call of Duty" class="free-game-image">
                    <div class="free-game-info">
                        <p class="free-game-title">Call of Duty®</p>
                        <p>혁명이 되어가는 게임! 이 게임을 해보고 싶다면 어떻게 해야하죠? 어떤 설명을 남아야 하죠?</p>
                        <span class="free-game-price">무료</span>
                    </div>
                </div>
                <div class="free-game-card">
                    <img src="../images/game.png" alt="Fallout 76" class="free-game-image">
                    <div class="free-game-info">
                        <p class="free-game-title">Fallout 76</p>
                        <p>혁명이 되어가는 게임! 이 게임을 해보고 싶다면 어떻게 해야하죠? 어떤 설명을 남아야 하죠?</p>
                        <span class="free-game-price">무료</span>
                    </div>
                </div>
                <div class="free-game-card">
                    <img src="../images/game.png" alt="Metal Gear" class="free-game-image">
                    <div class="free-game-info">
                        <p class="free-game-title">Metal Gear</p>
                        <p>혁명이 되어가는 게임! 이 게임을 해보고 싶다면 어떻게 해야하죠? 어떤 설명을 남아야 하죠?</p>
                        <span class="free-game-price">무료</span>
                    </div>
                </div>
                <div class="free-game-card">
                    <img src="../images/game.png" alt="Red Dead Redemption 2" class="free-game-image">
                    <div class="free-game-info">
                        <p class="free-game-title">Red Dead Redemption 2</p>
                        <p>혁명이 되어가는 게임! 이 게임을 해보고 싶다면 어떻게 해야하죠? 어떤 설명을 남아야 하죠?</p>
                        <span class="free-game-price">무료</span>
                    </div>
                </div>
            </div>
            <button class="free-game-more-btn">더보기</button>
        </section>

        <section class="discount-filter-section">
            <div class="filter-options">
                <button class="filter-button active">할인율</button>
                <button class="filter-button">장르</button>
                <button class="filter-button">출시일</button>
                <button class="filter-button">인기순</button>
            </div>
            <div class="game-grid">
                <!-- 첫 번째 게임 카드 -->
                <div class="game-card">
                    <img src="../images/game.png" alt="Game 1" class="game-thumbnail">
                    <div class="game-details">
                        <h3 class="game-title">The Last of Us: Part 1</h3>
                        <p class="game-description">게임 설명이 여기에 들어갑니다. 게임 특징과 장점을 간단히 설명합니다.</p>
                        <div class="price-container">
                            <span class="original-price">₩19,000</span>
                            <span class="discount-rate">-25%</span>
                            <span class="discounted-price">₩7,000</span>
                        </div>
                        <button class="bookmark-button">
                            <img src="../images/bookmark-icon.png" alt="Bookmark">
                        </button>
                    </div>
                </div>
        
                <!-- 반복적으로 더 많은 게임 카드 추가 -->
                <div class="game-card">
                    <img src="../images/game.png" alt="Game 2" class="game-thumbnail">
                    <div class="game-details">
                        <h3 class="game-title">Left 4 Dead</h3>
                        <p class="game-description">멀티플레이 좀비 액션의 정석을 경험해 보세요.</p>
                        <div class="price-container">
                            <span class="original-price">₩15,000</span>
                            <span class="discount-rate">-50%</span>
                            <span class="discounted-price">₩7,500</span>
                        </div>
                        <button class="bookmark-button">
                            <img src="../images/bookmark-icon.png" alt="Bookmark">
                        </button>
                    </div>
                </div>
                <!-- 추가적인 게임 카드는 여기에... -->
                <div class="game-card">
                    <img src="../images/game.png" alt="Game 1" class="game-thumbnail">
                    <div class="game-details">
                        <h3 class="game-title">The Last of Us: Part 1</h3>
                        <p class="game-description">게임 설명이 여기에 들어갑니다. 게임 특징과 장점을 간단히 설명합니다.</p>
                        <div class="price-container">
                            <span class="original-price">₩19,000</span>
                            <span class="discount-rate">-25%</span>
                            <span class="discounted-price">₩7,000</span>
                        </div>
                        <button class="bookmark-button">
                            <img src="../images/bookmark-icon.png" alt="Bookmark">
                        </button>
                    </div>
                </div>
                <div class="game-card">
                    <img src="../images/game.png" alt="Game 1" class="game-thumbnail">
                    <div class="game-details">
                        <h3 class="game-title">The Last of Us: Part 1</h3>
                        <p class="game-description">게임 설명이 여기에 들어갑니다. 게임 특징과 장점을 간단히 설명합니다.</p>
                        <div class="price-container">
                            <span class="original-price">₩19,000</span>
                            <span class="discount-rate">-25%</span>
                            <span class="discounted-price">₩7,000</span>
                        </div>
                        <button class="bookmark-button">
                            <img src="../images/bookmark-icon.png" alt="Bookmark">
                        </button>
                    </div>
                </div>
                <div class="game-card">
                    <img src="../images/game.png" alt="Game 1" class="game-thumbnail">
                    <div class="game-details">
                        <h3 class="game-title">The Last of Us: Part 1</h3>
                        <p class="game-description">게임 설명이 여기에 들어갑니다. 게임 특징과 장점을 간단히 설명합니다.</p>
                        <div class="price-container">
                            <span class="original-price">₩19,000</span>
                            <span class="discount-rate">-25%</span>
                            <span class="discounted-price">₩7,000</span>
                        </div>
                        <button class="bookmark-button">
                            <img src="../images/bookmark-icon.png" alt="Bookmark">
                        </button>
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

