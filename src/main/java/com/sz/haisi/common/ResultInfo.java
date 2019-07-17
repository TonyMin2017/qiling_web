package com.sz.haisi.common;

//通用的结果提示信息；
public class ResultInfo {

    private int errorCode = 0; //表示没有错误 ；成功；
    private String errorMsg ;  //表示具体的错误信息；

    public ResultInfo() {
    }

    public ResultInfo(int errorCode, String errorMsg) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
