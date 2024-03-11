package vnua.edu.model;

import java.io.File;
import java.util.List;

public class Field {
    public String id;
    public String name;

    public Specialized[] specialized;

    public Field() {

    }

    public Field(String id, String name, Specialized[] specialized) {
        this.id = id;
        this.name = name;
        this.specialized = specialized;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Specialized[] getSpecialized() {
        return specialized;
    }

    public void setSpecialized(Specialized[] specializeds) {
        this.specialized = specializeds;
    }
}
