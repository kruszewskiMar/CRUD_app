package bdbt_proj.SpringApp;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.sql.DriverManager;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class AdresyDAOTest{
    private AdresyDAO dao;
    @BeforeEach
    void setUp() throws Exception {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
        dataSource.setUsername("MKRUSZE");
        dataSource.setPassword("Marcin21");
        dataSource.setDriverClassName("oracle.jdbc.OracleDriver");

        dao = new AdresyDAO(new JdbcTemplate(dataSource));

    }

    @Test
    void list() {
        List<Adresy> listAdresy = dao.list();

        assertTrue(listAdresy.isEmpty());
    }

    @Test
    void save() {
        fail("Nie zaimplementowano");
    }

    @Test
    void get() {
        fail("Nie zaimplementowano");
    }

    @Test
    void update() {
        fail("Nie zaimplementowano");
    }

    @Test
    void delete() {
        fail("Nie zaimplementowano");
    }
}