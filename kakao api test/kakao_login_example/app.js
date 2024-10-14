require('dotenv').config();
const express = require('express');
const app = express();
const axios = require('axios');

// 정적 파일 서빙
app.use(express.static('public'));

// 카카오 로그인 요청
app.get('/auth/kakao', (req, res) => {
    const kakaoAuthURL = `https://kauth.kakao.com/oauth/authorize?client_id=${process.env.KAKAO_REST_API_KEY}&redirect_uri=${process.env.REDIRECT_URI}&response_type=code`;
    res.redirect(kakaoAuthURL);
});

// 카카오 로그인 콜백 처리
app.get('/auth/kakao/callback', async (req, res) => {
    const code = req.query.code;

    try {
        // Access Token 발급
        const tokenResponse = await axios({
            method: 'POST',
            url: `https://kauth.kakao.com/oauth/token`,
            headers: {
                'Content-type': 'application/x-www-form-urlencoded;charset=utf-8'
            },
            data: `grant_type=authorization_code&client_id=${process.env.KAKAO_REST_API_KEY}&redirect_uri=${process.env.REDIRECT_URI}&code=${code}`
        });

        const accessToken = tokenResponse.data.access_token;

        // 사용자 정보 요청
        const userResponse = await axios({
            method: 'GET',
            url: `https://kapi.kakao.com/v2/user/me`,
            headers: {
                Authorization: `Bearer ${accessToken}`
            }
        });

        res.json(userResponse.data); // 사용자 정보 출력
    } catch (error) {
        res.json(error.response.data); // 에러 출력
    }
});

// 서버 시작
app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});
