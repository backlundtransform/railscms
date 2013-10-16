module CssesHelper
  def write_it (element, content)
  
    if defined? content
      return element+content+";"
    else
      return ""
    end
    
  
  end
  
  def w(element, content)
  
    if defined? content
      return element+content+";"
    else
      return ""
    end
    
  
  end
  
  def width(width)
  
   if width.checked==false
      return "0";
      else
      return width.css.width
      end
end

  def sign(width,sign)
  
   if width.checked==false
      return "0";
      else
      return sign+width.css.width
      end
end
  
  
 def margin (element, rightwidth, leftwidth)
   
   
    if defined? rightwidth.css.width and leftwidth.css.width
      
     
   leftwidth = width(leftwidth)
   rightwidth = width(rightwidth)
  
 
      return element+"0 "+rightwidth+" 0 "+leftwidth+";"
    else
      return ""
    end


  end

end

