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
    <link rel="stylesheet" href="../css/details.css">
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
            <li><a href="../pages/community.jsp">Community</a></li> 
            <li><a href="../pages/AI_choice.jsp">AI_choice</a></li> 
            <li><a href="../pages/sale.jsp">Sale games</a></li> 
            <li><a href="../pages/library.jsp">Library</a></li>
        </ul>
    </nav>

    <main>
        <section class="game-detail-section">
            <h1 class="game-title">Beyond: Two Souls</h1>
            <div class="game-content">
                <!-- 왼쪽 게임 이미지 -->
                <div class="game-image-container">
                    <img src="../images/game.png" alt="Beyond: Two Souls" class="game-image">
                </div>
        
                <!-- 오른쪽 설명 및 특징 섹션 -->
                <div class="game-info-box">
                    <div class="game-summary">
                        <h3>게임 특징 및 장점</h3>
                        <ul>
                            <li>혼자서 플레이 가능한 게임</li>
                            <li>선사 3D가리의 멀티플레이어</li>
                            <li>스릴러, 공포, 협동</li>
                            <li>새로운 게임 경험 제공</li>
                            <li>AI 추천 10월 Best Game</li>
                        </ul>
                        <button class="share-button">공유하기</button>
                    </div>
                </div>
            </div>
        
            <!-- 게임 스크린샷 섹션 -->
            <div class="game-screenshots-section">
                <h2>게임 스크린샷</h2>
                <div class="screenshot-carousel">
                    <div class="screenshot">
                        <img src="../images/game.png" alt="Screenshot 1">
                    </div>
                    <div class="screenshot">
                        <img src="../images/game.png" alt="Screenshot 2">
                    </div>
                    <div class="screenshot">
                        <img src="../images/game.png" alt="Screenshot 3">
                    </div>
                    <div class="screenshot">
                        <img src="../images/game.png" alt="Screenshot 4">
                    </div>
                </div>
            </div>
        
            <!-- 게임 설명 및 구매 섹션 -->
            <div class="game-description-section">
                <div class="description-container">
                    <!-- 게임 설명 텍스트 -->
                    <p>
                        이번 AI가 10월의 Best game으로 뽑았습니다! <br>
                        Beyond: Two Souls는 주변 동료들과 함께하여 좀비 세계에서 이 세계를 탈출하는 게임으로, 스릴러, 퍼즐, 협동을 좋아한다면 정말 강추드리는 게임입니다! <br>
                        지금 바로 스팀으로 로그인하여 다운로드 하세요! 다운로드 시 모든 개발 혜택과 페이스 및 퀘스트를 제공해드릴 수 있습니다. <br>
                        또한 나의 개발자 제작자 사이의 모든 혜택을 누릴 수 있습니다. 어떤 식으로 볼 수 있을지 궁금하다면?
                    </p>
            
                    <!-- 가격 및 구매 버튼 섹션 -->
                    <div class="purchase-info">
                        <div class="price-details">
                            <span class="discount-expiry">Until Oct 31</span>
                            <span class="original-price">$19,000원</span>
                            <span class="discount-box">-60%</span>
                            <span class="discount-price">$7,000원</span>
                        </div>
                        <button class="purchase-button">Steam 구매하러가기</button>
                    </div>
            
                    <!-- 사용자 피드백 섹션 -->
                    <div class="user-feedback">
                        <button class="like-button">
                            <span>제품이 마음에 드시나요?</span>
                            <img src="../images/like-icon.png" alt="Like Icon">
                        </button>
                        <span class="likes-count">44,233</span>
                        <span class="reviews-count">1,223 리뷰</span>
                    </div>
                </div>
            </div>
        
            <!-- 게임 하이라이트 영상 섹션 -->
            <div class="game-highlight-video-section">
                <h2>게임 하이라이트</h2>
                <div class="video-container">
                    <iframe 
                        width="800" 
                        height="450" 
                        src="https://www.youtube.com/embed/Asb40dQGi-0" 
                        title="YouTube video player" 
                        frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                        allowfullscreen>
                    </iframe>
                </div>
            </div>
        </section>


        <section class="recommended-games-section">
            <h2>이런 게임은 어떠세요?</h2>
            <div class="recommended-games-row">
                <!-- 첫 번째 게임 카드 -->
                <div class="recommended-game-card">
                    <img src="../images/game.png" alt="SPORTS VR" class="game-image">
                    <div class="game-info">
                        <p class="game-title">SPORTS VR</p>
                        <p>모든 사람들과 함께 가상 현실로 실감나는 스포츠를 즐겨보세요.</p>
                        <span class="game-price">$19,000원</span>
                    </div>
                </div>
        
                <!-- 두 번째 게임 카드 -->
                <div class="recommended-game-card">
                    <img src="../images/game.png" alt="BEAT SABER" class="game-image">
                    <div class="game-info">
                        <p class="game-title">BEAT SABER</p>
                        <p>리듬을 타며 모든 비트를 잘라나가세요. 박진감 넘치는 게임!</p>
                        <span class="game-price">$19,000원</span>
                    </div>
                </div>
        
                <!-- 세 번째 게임 카드 -->
                <div class="recommended-game-card">
                    <img src="../images/game.png" alt="FARMER POTATOES" class="game-image">
                    <div class="game-info">
                        <p class="game-title">FARMER POTATOES</p>
                        <p>감자를 심고 수확하여 농장을 발전시키세요. 느긋한 힐링 게임.</p>
                        <span class="game-price">$19,000원</span>
                    </div>
                </div>
            </div>
        
            <div class="recommended-games-row">
                <!-- 네 번째 게임 카드 -->
                <div class="recommended-game-card">
                    <img src="../images/game.png" alt="BRO TATO" class="game-image">
                    <div class="game-info">
                        <p class="game-title">BRO TATO</p>
                        <p>강력한 동료와 함께 적들을 물리치세요. 탑다운 액션 게임.</p>
                        <span class="game-price">$19,000원</span>
                    </div>
                </div>
        
                <!-- 다섯 번째 게임 카드 -->
                <div class="recommended-game-card">
                    <img src="../images/game.png" alt="BATTLEBEAD" class="game-image">
                    <div class="game-info">
                        <p class="game-title">BATTLEBEAD</p>
                        <p>적들과의 대결에서 살아남으세요. 전장 속의 영웅이 되어보세요.</p>
                        <span class="game-price">$19,000원</span>
                    </div>
                </div>
        
                <!-- 여섯 번째 게임 카드 -->
                <div class="recommended-game-card">
                    <img src="../images/game.png" alt="로열 스매시" class="game-image">
                    <div class="game-info">
                        <p class="game-title">로열 스매시</p>
                        <p>왕국의 모든 적들을 물리치세요. 스매시로 모든 것을 정리하세요!</p>
                        <span class="game-price">$19,000원</span>
                    </div>
                </div>
            </div>
        </section>

        <section class="game-review-section">
            <div class="review-filters">
                <button class="filter-button active">최신순</button>
                <button class="filter-button">인기순</button>
                <button class="filter-button">조회순</button>
                <button class="filter-button">추천순</button>
            </div>
            
            <div class="reviews-list">
                <!-- 첫 번째 리뷰 카드 -->
                <div class="review-card">
                    <div class="review-header">
                        <img src="../images/like-icon.png" alt="Like Icon" class="review-icon">
                        <span class="review-title">이 게임은 쩔었다</span>
                    </div>
                    <div class="review-content">
                        <p>
                            와 진짜 이 게임 꼭 하셔야 해요. 너무 재밌어요! 별점을 준다면 100점 만점에 1000점이에요.
                            스릴러 좋아하신 분들은 꼭 하셔야 해요. 단, 단점이 있는데 시간이 너무 많이 뺏겨버린다는 단점, 이거 진짜 꼭 해보세요.
                        </p>
                    </div>
                    <div class="review-footer">
                        <span class="review-date">2023.03.12</span>
                        <div class="review-actions">
                            <button class="view-button"><img src="../images/view-icon.png" alt="View Icon"></button>
                            <button class="bookmark-button"><img src="../images/bookmark-icon.png" alt="Bookmark Icon"></button>
                        </div>
                    </div>
                </div>
        
                <!-- 두 번째 리뷰 카드 -->
                <div class="review-card">
                    <div class="review-header">
                        <img src="../images/like-icon.png" alt="Like Icon" class="review-icon">
                        <span class="review-title">정말 멋진 경험이었어요</span>
                    </div>
                    <div class="review-content">
                        <p>
                            게임 내 스토리와 그래픽이 너무 인상적이었어요. 다른 게임에서는 느낄 수 없었던 감동을 주는 게임이에요.
                            특히 멀티플레이 경험이 정말 훌륭했고, 친구들과 함께 즐기기에 최고입니다.
                        </p>
                    </div>
                    <div class="review-footer">
                        <span class="review-date">2023.02.28</span>
                        <div class="review-actions">
                            <button class="view-button"><img src="../images/view-icon.png" alt="View Icon"></button>
                            <button class="bookmark-button"><img src="../images/bookmark-icon.png" alt="Bookmark Icon"></button>
                        </div>
                    </div>
                </div>
        
                <!-- 세 번째 리뷰 카드 -->
                <div class="review-card">
                    <div class="review-header">
                        <img src="../images/like-icon.png" alt="Like Icon" class="review-icon">
                        <span class="review-title">AI 추천, 믿고 해봤는데 최고!</span>
                    </div>
                    <div class="review-content">
                        <p>
                            처음에는 반신반의했는데, 정말 최고였습니다. 추천받고 시작했는데 한 번도 후회하지 않았습니다.
                            AI가 추천한 만큼 믿을 수 있는 게임이었습니다.
                        </p>
                    </div>
                    <div class="review-footer">
                        <span class="review-date">2023.01.15</span>
                        <div class="review-actions">
                            <button class="view-button"><img src="../images/view-icon.png" alt="View Icon"></button>
                            <button class="bookmark-button"><img src="../images/bookmark-icon.png" alt="Bookmark Icon"></button>
                        </div>
                    </div>
                </div>
            </div>
            
            <button class="more-reviews-button">더보기</button>
            <button class="write-review-button">댓글 달기</button>
        </section>
        
        
    </main>

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

</body>
</html>
    