class Site < ActiveRecord::Base
  belongs_to :user
  has_many :pages
  has_many :sections
  def self.seedsec(site_id)
   css1 = Css.new
      css1.color = "#000"
      css1.background = "#FFF333"
      css1.save
     
      section1 = Section.new
      section1.name = "header"
      section1.content = "header"
      section1.checked = true
      section1.css_id = css1.id
      section1.site_id = site_id
      section1.save
      Css.find(css1.id).update_attribute("section_id", section1.id)


      css2 = Css.new
      css2.color = "#000"
      css2.background = "#FFF000"
      css2.save
      
      section2 = Section.new
      section2.name = "contentcolumn"
      section2.content = "contentcolumn"
      section2.checked = true
      section2.css_id = css2.id
      section2.site_id = site_id
      section2.save
      Css.find(css2.id).update_attribute("section_id", section2.id)
      
      css3 = Css.new
      css3.color = "#000"
      css3.background = "#FFF111"
      css3.save
      
      section3 = Section.new
      section3.name = "rightcolumn"
      section3.content = "rightcolumn"
      section3.checked = true
      section3.css_id = css3.id
      section3.site_id = site_id
      section3.save
      Css.find(css3.id).update_attribute("section_id", section3.id)
      
      css4 = Css.new
      css4.color = "#000"
      css4.background = "#FFF332"
      css4.save
      
      section4 = Section.new
      section4.name = "leftcolumn"
      section4.content = "leftcolumn"
      section4.checked = true
      section4.css_id = css4.id
      section4.site_id = site_id
      section4.save
      Css.find(css4.id).update_attribute("section_id", section4.id)
      
      css5 = Css.new
      css5.color = "#fff"
      css5.background = "#000"
      css5.save

      
      section5 = Section.new
      section5.name = "footer"
      section5.content = "footer"
      section5.checked = true
      section5.css_id = css5.id
      section5.site_id = site_id
      section5.save
      Css.find(css5.id).update_attribute("section_id", section5.id)
      
      css6 = Css.new
      css6.width = "840px"
      css6.save 
      
      section6 = Section.new
      section6.name = "wraper"
      section6.checked = true
      section6.css_id = css6.id
      section6.site_id = site_id
      section6.save
      Css.find(css6.id).update_attribute("section_id", section6.id)
      

      end
end
