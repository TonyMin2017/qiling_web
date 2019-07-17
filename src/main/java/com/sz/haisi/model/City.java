package com.sz.haisi.model;

public class City {

    private int cid;
    private String cname;
    private int pid;
    private String pname; //所在省；  多对一；
    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }


    public City() {
    }

    public City(String cname, int pid) {
        this.cname = cname;
        this.pid = pid;
    }

    public City(String cname, String pname) {
        this.cname = cname;
        this.pname = pname;
    }

    public City(int cid, String cname, int pid) {
        this.cid = cid;
        this.cname = cname;
        this.pid = pid;
    }

    public int getCid() {
        return cid;
    }

    @Override
    public String toString() {
        return "City{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", pid=" + pid +
                '}';
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
}
