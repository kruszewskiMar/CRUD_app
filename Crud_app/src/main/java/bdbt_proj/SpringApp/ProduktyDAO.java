package bdbt_proj.SpringApp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;
@Repository
public class ProduktyDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public ProduktyDAO(JdbcTemplate jdbcTemplate){
        super();
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Produkty> list(){
        String sql = "SELECT * FROM PRODUKTY";
        List<Produkty> listProdukty = jdbcTemplate.query(sql,BeanPropertyRowMapper.newInstance(Produkty.class));
        return  listProdukty;
    }
    public void save(Produkty produkty){
        SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
        insertActor.withTableName("produkty").usingColumns("nr_produktu","nazwa_produktu","opis_produktu","czas_gwarancji", "netto","brutto","vat");
        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(produkty);
        insertActor.execute(param);
    }
    public Produkty get(int nr_produktu){

        Object[] args = {nr_produktu};
        String sql = "SELECT * FROM PRODUKTY WHERE nr_produktu = " + args[0];
        Produkty produkty = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Produkty.class));
        return produkty;
    }

    public void update(Produkty produkty){
        String sql = "UPDATE PRODUKTY SET nazwa_produktu=:nazwa_produktu, opis_produktu=:opis_produktu, czas_gwarancji=:czas_gwarancji," +
                " netto=:netto, brutto=:brutto, vat=:vat WHERE nr_produktu=:nr_produktu";
        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(produkty);
        NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);

        template.update(sql,param);

    }
    public void delete(int nr_produktu){
        String sql = "DELETE FROM PRODUKTY WHERE nr_produktu = ?";
        jdbcTemplate.update(sql,nr_produktu);

    }

}
