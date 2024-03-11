package vnua.edu.filters;

import jdk.jshell.execution.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import vnua.edu.utils.Utils;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class AdminFilter implements Filter {


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String uri = httpRequest.getRequestURI();
        if (!uri.contains("admin/login")) {
            String token = Utils.extractTokenFromCookie(httpRequest);
            if (tokenIsValid(token)) {
                // Nếu token hợp lệ, cho phép request đi tiếp
                chain.doFilter(request, response);
                return;
            } else {
                httpResponse.sendRedirect("/admin/login?returnUrl=" + URLEncoder.encode(uri, StandardCharsets.UTF_8));
                return;
            }
        }
        chain.doFilter(request, response);
    }

    private boolean tokenIsValid(String token) {
        if(token == null ||token.isEmpty())
            return false;
        String[] tokenParts = token.split("\\.");

        if (tokenParts.length == 3) { // Đảm bảo token có 3 phần (header, payload, signature)
            try {
                // Giải mã phần payload để lấy thông tin trường exp
                Base64.Decoder decoder = Base64.getUrlDecoder();
                String payload = new String(decoder.decode(tokenParts[1]), StandardCharsets.UTF_8);

                // Sử dụng regex để tìm và trích xuất giá trị của trường exp
                Pattern pattern = Pattern.compile("\"exp\":(\\d+)");
                Matcher matcher = pattern.matcher(payload);

                if (matcher.find()) {
                    long exp = Long.parseLong(matcher.group(1));

                    // Lấy thời gian hiện tại
                    long now = Instant.now().getEpochSecond();
                    return exp > now;
                } else {
                    return false;
                }
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        } else {
            return false;
        }
    }



    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo filter (nếu cần)
    }

    @Override
    public void destroy() {
        // Hủy filter (nếu cần)
    }
}
