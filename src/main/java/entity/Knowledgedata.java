package entity;

import java.util.Date;

public class Knowledgedata {
    private int k_id;
    private int user_id;
    private String title;
    private String Abstract;
    private String content;
    private Date createTime;
    public Knowledgedata(int k_id,int user_id,String title,String Abstract,String content,Date createTime){
        this.k_id=k_id;
        this.user_id=user_id;
        this.title=title;
        this.Abstract=Abstract;
        this.content=content;
        this.createTime=createTime;
    }

    public int getK_id() {
        return k_id;
    }

    public void setK_id(int k_id) {
        this.k_id = k_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAbstract() {
        return Abstract;
    }

    public void setAbstract(String anAbstract) {
        Abstract = anAbstract;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
