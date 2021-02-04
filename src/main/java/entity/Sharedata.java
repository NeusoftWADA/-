package entity;

public class Sharedata {
    private int user_id;
    private int k_id;
    public Sharedata(int user_id,int k_id){
        this.user_id = user_id;
        this.k_id = k_id;
    }
    public Sharedata(){
    }
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getK_id() {
        return k_id;
    }

    public void setK_id(int k_id) {
        this.k_id = k_id;
    }
}
