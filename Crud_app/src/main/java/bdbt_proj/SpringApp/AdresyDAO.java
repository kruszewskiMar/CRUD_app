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
public class AdresyDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public AdresyDAO(JdbcTemplate jdbcTemplate) {
        super();
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Adresy> list(){
        String sql = "SELECT * FROM ADRESY";
        List<Adresy> listAdresy = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Adresy.class));
        return listAdresy;
    }



    public void save(Adresy adresy){
        SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
        insertActor.withTableName("adresy").usingColumns("kraj","miasto","wojewodztwo","ulica"
        ,"nr_budynku","nr_lokalu","kod_pocztowy");
        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(adresy);
        insertActor.execute(param);
    }
    public Adresy get(int nr_adresu){

        Object[] args = {nr_adresu};
        String sql = "SELECT * FROM ADRESY WHERE nr_adresu = " + args[0];
        Adresy adresy = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Adresy.class));
        return adresy;
    }

    public void update(Adresy adresy){
        String sql = "UPDATE ADRESY SET kraj=:kraj, wojewodztwo=:wojewodztwo, miasto=:miasto," +
                " ulica=:ulica, nr_budynku=:nr_budynku, nr_lokalu=:nr_lokalu,kod_pocztowy=:kod_pocztowy WHERE nr_adresu=:nr_adresu";
        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(adresy);
        NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);

        template.update(sql,param);

    }
    public void delete(int nr_adresu){
        String sql = "DELETE FROM ADRESY WHERE nr_adresu = ?";
        jdbcTemplate.update(sql,nr_adresu);

    }
}
