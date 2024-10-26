import java.util.Scanner;

public class logins {
    // 간단한 유저 정보 저장 (예제용)
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "password";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("===== Login =====");

        // 사용자 입력 받기
        System.out.print("Username: ");
        String inputUsername = scanner.nextLine();

        System.out.print("Password: ");
        String inputPassword = scanner.nextLine();

        // 로그인 검증
        if (login(inputUsername, inputPassword)) {
            System.out.println("Login successful! Welcome, " + inputUsername + "!");
        } else {
            System.out.println("Invalid username or password.");
        }

        scanner.close();
    }

    // 로그인 검증 메서드
    private static boolean login(String username, String password) {
        return USERNAME.equals(username) && PASSWORD.equals(password);
    }
}
