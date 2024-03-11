package vnua.edu.model;

public class Specialized {
    public String id;
    public String field_id;

    public int type;

    public String name;
    public int year_start;
    public int year_end;

    public Specialized() {

    }

    public Specialized(String id, String field_id, int type, String name, int year_start, int year_end) {
        this.id = id;
        this.field_id = field_id;
        this.type = type;
        this.name = name;
        this.year_start = year_start;
        this.year_end = year_end;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getField_id() {
        return field_id;
    }

    public void setField_id(String field_id) {
        this.field_id = field_id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getYear_start() {
        return year_start;
    }

    public void setYear_start(int year_start) {
        this.year_start = year_start;
    }

    public int getYear_end() {
        return year_end;
    }

    public void setYear_end(int year_end) {
        this.year_end = year_end;
    }
}
