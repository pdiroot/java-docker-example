package com.dataart.example.back.service;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class RequestParser {

    private static final String[] HEADERS_TO_TRY = {
            "X-Forwarded-For",
            "Proxy-Client-IP",
            "WL-Proxy-Client-IP",
            "HTTP_X_FORWARDED_FOR",
            "HTTP_X_FORWARDED",
            "HTTP_X_CLUSTER_CLIENT_IP",
            "HTTP_CLIENT_IP",
            "HTTP_FORWARDED_FOR",
            "HTTP_FORWARDED",
            "HTTP_VIA",
            "REMOTE_ADDR",
            "X-Real-IP"
    };

    public String getIPAddressFromRequest(HttpServletRequest request) {
        String ip;
        for (String header : HEADERS_TO_TRY) {
            ip = request.getHeader(header);
            if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
                return validateIPAddress(ip);
            }
        }
        return request.getRemoteAddr();
    }

    private String validateIPAddress(String ipAddress) {
        if (!ipAddress.contains(",")) {
            return ipAddress;
        }
        String[] ipAddresses = ipAddress.split(",");
        return ipAddresses[ipAddresses.length - 1].trim();
    }
}