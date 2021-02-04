package entity;

public class Set_categories {
    private int k_id;
    private int categories_id;

    public Set_categories(int k_id, int categories_id) {
        this.k_id = k_id;
        this.categories_id = categories_id;
    }
    public Set_categories() {
    }

    public int getK_id() {
        return k_id;
    }

    public void setK_id(int k_id) {
        this.k_id = k_id;
    }

    public int getCategories_id() {
        return categories_id;
    }

    public void setCategories_id(int categories_id) {
        this.categories_id = categories_id;
    }
}
