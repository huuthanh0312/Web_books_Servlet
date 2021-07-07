package Model.BO;

import java.util.ArrayList;
import java.util.List;

import Model.Bean.GiohangBean;

public class GiohangBo {
	public List<GiohangBean> ds= new ArrayList<GiohangBean>();
	public void Them(String masach, String tensach, String tacgia,long gia,long soluong,String anh) throws Exception {
      int n =ds.size();
      for(int i = 0;i<n;i++) 
      {
    	  if(ds.get(i).getMasach().trim().equals(masach.trim())) 
    	  {
    		  long slt=ds.get(i).getSoluong()+soluong;
    		  ds.get(i).setSoluong(slt);
    		  long g = ds.get(i).getGia();
    		  long tt = slt*g;
    		  ds.get(i).setThanhtien(tt);
    		  return;
    	  }
      }
      GiohangBean gh =new GiohangBean(masach, tensach, tacgia, gia, soluong, anh);
      ds.add(gh);
	}
	public boolean Xoa(String masach) 
	{
		int n =ds.size();
	      for(int i = 0;i<n;i++) 
	      {
	    	  if(ds.get(i).getMasach().trim().equals(masach.trim())) 
	    	  {
	    		  ds.remove(i);
	    		  return true;
	    	  }
	      }
       return false;
	}

	public boolean Sua(String masach,String soluong) 
	{
		int n =ds.size();
	      for(int i = 0;i<n;i++)
	      {
	    	  if(ds.get(i).getMasach().trim().equals(masach.trim())) 
	    	  {
	    		  ds.get(i).setSoluong(Long.parseLong(soluong));  	    		  
	    		  long g = ds.get(i).getGia();
	    		  long tt = Integer.parseInt(soluong)*g;
	    		  ds.get(i).setThanhtien(tt);
	    		  return true;
	    	  }
	      }
     return false;
	}
	public long TongTien() 
	{
		int n =ds.size();
		long tongtien = 0;
	    for(int i = 0;i<n;i++)
	    {    		  
    	  long tt = ds.get(i).getThanhtien();
    		  tongtien = tongtien+ tt;
	    }
        return tongtien ;
	}
	
}
