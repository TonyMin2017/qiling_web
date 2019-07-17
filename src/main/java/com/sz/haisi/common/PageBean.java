package com.sz.haisi.common;

import java.util.List;
//通用分页类；
public class PageBean<T> {
    private long total;  //所有数据的行数；
    private List<T> rows; //当前页的数据；
    private int pageSize; //每页行数；
    private int pageTotals;//总页数；
    private int pageIndex;//当前页；
    public PageBean() {
    }
    public PageBean(long total, List<T> rows, int pageSize, int pageTotals, int pageIndex) {
        this.total = total;
        this.rows = rows;
        this.pageSize = pageSize;
        this.pageTotals = pageTotals;
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageTotals() {
        return pageTotals;
    }

    public void setPageTotals(int pageTotals) {
        this.pageTotals = pageTotals;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
