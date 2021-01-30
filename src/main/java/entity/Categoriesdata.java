package entity;

public class Categoriesdata {
    private int id;
    private String name;

    public Categoriesdata(int id, String name) {
        this.id = id;
        this.name = name;
    }
    public Categoriesdata() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
