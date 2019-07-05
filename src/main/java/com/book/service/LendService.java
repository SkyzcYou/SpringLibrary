package com.book.service;

import com.book.dao.LendDao;
import com.book.entity.Lend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


/**
 * service-LendService
 * @author Skyzc
 * @email youzhengcai@gmail.com
 * @date 2019/06/30 09:35
 */
@Service
public class LendService {
    private LendDao lendDao;

    @Autowired
    public void setLendDao(LendDao lendDao) {
        this.lendDao = lendDao;
    }

    public boolean bookReturn(long bookId){
        return lendDao.bookReturnOne(bookId)>0 && lendDao.bookReturnTwo(bookId)>0;
    }

    public boolean bookLend(long bookId,int readerId){
        return lendDao.bookLendOne(bookId,readerId)>0 && lendDao.bookLendTwo(bookId)>0;
    }

    public ArrayList<Lend> lendList(){
        return lendDao.lendList();
    }
    public ArrayList<Lend> myLendList(int readerId){
        return lendDao.myLendList(readerId);
    }

}
