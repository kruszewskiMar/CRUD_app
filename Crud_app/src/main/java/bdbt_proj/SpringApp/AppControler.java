package bdbt_proj.SpringApp;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.List;


@Configuration
@Controller
public class AppControler implements WebMvcConfigurer {

    @Autowired
    private AdresyDAO dao;
    @Autowired
    private ProduktyDAO dao1;
    @Autowired
    private KlienciDAO dao2;

    @RequestMapping("/admin/adresy")
    public String ViewHomePage(Model model){
        List<Adresy> listAdresy = dao.list();
        model.addAttribute("listAdresy", listAdresy);
        return "adresy";
    }
    @RequestMapping("/user/produkty")
    public String Products(Model model){
        List<Produkty> listProdukty = dao1.list();
        model.addAttribute("listProdukty", listProdukty);
        return "produkty";
    }
    @RequestMapping("/admin/produktyAdmin")
    public String adminProducts(Model model){
        List<Produkty> listProduktyAdmin = dao1.list();
        model.addAttribute("listProduktyAdmin", listProduktyAdmin);
        return "produktyAdmin";
    }
    @RequestMapping("/admin/klienci")
    public String klienci(Model model){
        List<Klienci> listKlienci = dao2.list();
        model.addAttribute("listKlienci", listKlienci);
        return "klienci";
    }

    @RequestMapping("/admin/newAdd")
    public String showNewForm(Model model){
        Adresy adresy = new Adresy();
        model.addAttribute("Adres", adresy);
        return "new_form";
    }
    @RequestMapping("/admin/newPro")
    public String newProduct(Model model){
        Produkty produkty = new Produkty();
        model.addAttribute("Produkt", produkty);
        return "new_product";
    }
    @RequestMapping("/admin/newKli")
    public String newKli(Model model){
        Klienci klienci = new Klienci();
        model.addAttribute("Klient", klienci);
        return "new_client";
    }
    @RequestMapping(value = "/admin/saveAdd", method = RequestMethod.POST)
    public String save(@ModelAttribute("Adres") Adresy adresy){
        dao.save(adresy);
        return "redirect:/admin/adresy";
    }
    @RequestMapping(value = "/admin/saveKli", method = RequestMethod.POST)
    public String save(@ModelAttribute("Klient") Klienci klienci){
        dao2.save(klienci);
        return "redirect:/admin/klienci";
    }

    @RequestMapping(value = "/admin/savePro", method = RequestMethod.POST)
    public String saveProd(@ModelAttribute("Produkt") Produkty produkty){
        dao1.save(produkty);
        return "redirect:/admin/produktyAdmin";
    }
    @RequestMapping("/admin/editAdd/{nr_adresu}")
    public ModelAndView showEditForm(@PathVariable(name = "nr_adresu") int nr_adresu){
        ModelAndView mav = new ModelAndView("edit_form");
        Adresy adresy = dao.get(nr_adresu);
        mav.addObject("Adres",adresy);
        return mav;
    }
    @RequestMapping("/admin/editPro/{nr_produktu}")
    public ModelAndView editPro(@PathVariable(name = "nr_produktu") int nr_produktu){
        ModelAndView mav1 = new ModelAndView("edit_product");
        Produkty produkty = dao1.get(nr_produktu);
        mav1.addObject("Produkt",produkty);
        return mav1;
    }
    @RequestMapping("/admin/editKli/{nr_klienta}")
    public ModelAndView editKli(@PathVariable(name = "nr_klienta") int nr_klienta){
        ModelAndView mav2 = new ModelAndView("edit_client");
        Klienci klienci = dao2.get(nr_klienta);
        mav2.addObject("Klient",klienci);
        return mav2;
    }
    @RequestMapping(value = "/admin/updateAdd", method = RequestMethod.POST)
    public String update(@ModelAttribute("Adres") Adresy adresy){
        dao.update(adresy);
        return "redirect:/admin/adresy";
    }
    @RequestMapping(value = "/admin/updatePro", method = RequestMethod.POST)
    public String updateProd(@ModelAttribute("Produkt") Produkty produkty){
        dao1.update(produkty);
        return "redirect:/admin/produktyAdmin";
    }
    @RequestMapping(value = "/admin/updateKli", method = RequestMethod.POST)
    public String updateKli(@ModelAttribute("Klient") Klienci klienci){
        dao2.update(klienci);
        return "redirect:/admin/klienci";
    }
    @RequestMapping("/admin/deleteAdd/{nr_adresu}")
    public String delete(@PathVariable(name = "nr_adresu") int nr_adresu){
        dao.delete(nr_adresu);
        return "redirect:/admin/adresy";
    }
    @RequestMapping("/admin/deletePro/{nr_produktu}")
    public String deleteProd(@PathVariable(name = "nr_produktu") int nr_produktu){
        dao1.delete(nr_produktu);
        return "redirect:/admin/produktyAdmin";
    }
    @RequestMapping("/admin/deleteKli/{nr_klienta}")
    public String deleteKli(@PathVariable(name = "nr_klienta") int nr_klienta){
        dao2.delete(nr_klienta);
        return "redirect:/admin/klienci";
    }
    @GetMapping("/access-denied")
    public String getAccessDenied() {
        return "/accessDenied";
    }

    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/main").setViewName("main");
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/admin/newAdd").setViewName("newAdd");
        registry.addViewController("/admin/adresy").setViewName("adresy");
        registry.addViewController("/admin").setViewName("admin");
        registry.addViewController("/user").setViewName("user");
        registry.addViewController("/user/produkty").setViewName("produkty");
        registry.addViewController("/admin/produktyAdmin").setViewName("produktyAdmin");
        registry.addViewController("/admin/newPro").setViewName("newPro");
        registry.addViewController("/admin/klienci").setViewName("klienci");
        registry.addViewController("/user/koszyk").setViewName("koszyk");
    }
}
