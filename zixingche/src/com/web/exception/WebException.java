package com.web.exception;

/**
 * Created by zyz on 2016/11/10.
 */
public class WebException extends RuntimeException{

    public WebException() {
    }

    public WebException(String message) {
        super(message);
    }
}
