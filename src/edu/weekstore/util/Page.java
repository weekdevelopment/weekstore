package edu.weekstore.util;

import edu.weekstore.model.NoticeDAO;
import edu.weekstore.model.QnaDAO;

public class Page {
    private final static int pageCount = 5;
    private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPageNum = 0;
    private int curPageNum = 1;
    private int postCount = 5;
    private int postStart = 1;
    private int pageBlockNum = 1;
    private int totalBlockNum = 1;
    private int totalPageCount = 1;

    public int getBlockStartNum() {
        return blockStartNum;
    }
    public void setBlockStartNum(int blockStartNum) {
        this.blockStartNum = blockStartNum;
    }
    public int getBlockLastNum() {
        return blockLastNum;
    }
    public void setBlockLastNum(int blockLastNum) {
        this.blockLastNum = blockLastNum;
    }
    public int getLastPageNum() {
        return lastPageNum;
    }
    public void setLastPageNum(int lastPageNum) {
        this.lastPageNum = lastPageNum;
    }

    public int getCurPageNum() {
        return curPageNum;
    }

    public void setCurPageNum(int curPageNum) {
        this.curPageNum = curPageNum;
    }

    public int getPostCount() {
        return postCount;
    }

    public void setPostCount(int postCount) {
        this.postCount = postCount;
    }

    public int getPostStart() {
        return postStart;
    }

    public void setPostStart(int postStart) {
        this.postStart = postStart;
    }

    public int getPageBlockNum() {
        return pageBlockNum;
    }

    public void setPageBlockNum(int pageBlockNum) {
        this.pageBlockNum = pageBlockNum;
    }

    public int getTotalBlockNum() {
        return totalBlockNum;
    }

    public void setTotalBlockNum(int totalBlockNum) {
        this.totalBlockNum = totalBlockNum;
    }

    public int getTotalPageCount() {
        return totalPageCount;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public void makePostStart(int curPage){
        this.postStart = (curPage - 1) * this.postCount + 1;
        this.pageBlockNum = (int)Math.floor(curPage / pageCount);

        QnaDAO dao = new QnaDAO();
        int total = dao.getCount();
        int comp = pageCount * postCount;
        if( total % comp == 0 ) {
            this.totalBlockNum = (int)Math.floor(total/comp);
        } else {
            this.totalBlockNum = (int)Math.floor(total/comp) + 1;
        }
        if(total % postCount == 0){
            totalPageCount = (int)Math.floor(total/postCount);
        } else {
            totalPageCount = (int)Math.floor(total/postCount)+1;
        }
    }

    public void makePostStart(int curPage, String searchType, String kwd){
        this.postStart = (curPage - 1) * this.postCount + 1;
        this.pageBlockNum = (int)Math.floor(curPage / pageCount);

        QnaDAO dao = new QnaDAO();
        int total = dao.getCount(searchType, kwd);
        int comp = pageCount * postCount;
        if( total % comp == 0 ) {
            this.totalBlockNum = (int)Math.floor(total/comp);
        } else {
            this.totalBlockNum = (int)Math.floor(total/comp) + 1;
        }
        if(total % postCount == 0){
            totalPageCount = (int)Math.floor(total/postCount);
        } else {
            totalPageCount = (int)Math.floor(total/postCount)+1;
        }
    }

    // block을 생성
    // 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
    public void makeBlock(int curPage){
        int blockNum = 0;

        blockNum = (int)Math.floor((curPage-1)/ pageCount);
        blockStartNum = (pageCount * blockNum) + 1;

        QnaDAO dao = new QnaDAO();
        int total = dao.getCount();
        int comp = 0;
        if(total % postCount == 0){
            comp = (int)Math.floor(total/ postCount);
        } else {
            comp = (int)Math.floor(total/ postCount)+1;
        }
        blockLastNum = blockStartNum + (pageCount-1);
        if(blockLastNum>=comp){
            blockLastNum = comp;
        }
    }

    public void makeBlock(int curPage, String searchType, String kwd){
        int blockNum = 0;

        blockNum = (int)Math.floor((curPage-1)/ pageCount);
        blockStartNum = (pageCount * blockNum) + 1;

        QnaDAO dao = new QnaDAO();
        int total = dao.getCount(searchType, kwd);
        int comp = 0;
        if(total % postCount == 0){
            comp = (int)Math.floor(total/ postCount);
        } else {
            comp = (int)Math.floor(total/ postCount)+1;
        }
        blockLastNum = blockStartNum + (pageCount-1);
        if(blockLastNum>=comp){
            blockLastNum = comp;
        }
    }

    // 총 페이지의 마지막 번호
    public void makeLastPageNum() {
        QnaDAO dao = new QnaDAO();
        int total = dao.getCount();

        if( total % pageCount == 0 ) {
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else {
            lastPageNum = (int)Math.floor(total/pageCount) + 1;
        }
    }

    // 검색을 했을 때 총 페이지의 마지막 번호
    public void makeLastPageNum(String searchType, String kwd) {
        QnaDAO dao = new QnaDAO();
        int total = dao.getCount(searchType, kwd);

        if( total % pageCount == 0 ) {
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else {
            lastPageNum = (int)Math.floor(total/pageCount) + 1;
        }
    }
}
