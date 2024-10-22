package iuh.fit.se.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import iuh.fit.se.dao.dienthoaiDAO;
import iuh.fit.se.dao.nhacungcapDAO;
import iuh.fit.se.daoimpl.DienThoaiDAOimpl;
import iuh.fit.se.daoimpl.NhaCungCapDAOimpl;
import iuh.fit.se.entities.dienthoai;
import iuh.fit.se.entities.nhacungcap;
import iuh.fit.se.utils.EntityManagerFactoryUtil;

/**
 * Servlet implementation class DanhSachDienThoaiNccController
 */
@WebServlet("/listdt")
public class DanhSachDienThoaiNccController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private EntityManagerFactoryUtil emf;
    private dienthoaiDAO dienthoaiDAO;
    private nhacungcapDAO nhacungcapDAO;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhSachDienThoaiNccController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// TODO Auto-generated method stub
		this.emf = new EntityManagerFactoryUtil();
		this.dienthoaiDAO = new DienThoaiDAOimpl(this.emf.getEntityManager());
		this.nhacungcapDAO = new NhaCungCapDAOimpl(this.emf.getEntityManager());
	}
	@Override
    public void destroy() {
        this.emf.close();
        super.destroy();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String searchTerm = request.getParameter("search");
	    List<nhacungcap> nhacungcaps = nhacungcapDAO.findAll();
	    List<dienthoai> listDienThoai;

	    if (searchTerm != null && !searchTerm.isEmpty()) {
	        String lowerCaseSearchTerm = searchTerm.toLowerCase();
	        
	        listDienThoai = dienthoaiDAO.findAll().stream()
	                .filter(dt -> dt.getMaDT().toLowerCase().contains(lowerCaseSearchTerm) || 
	                              dt.getTenDT().toLowerCase().contains(lowerCaseSearchTerm) || 
	                              (dt.getNhaCungCap() != null && dt.getNhaCungCap().getMaNCC().toLowerCase().contains(lowerCaseSearchTerm)))
	                .toList();
	    } else {
	        listDienThoai = dienthoaiDAO.findAll();
	    }
	    
	    request.setAttribute("listNCC", nhacungcaps);
	    request.setAttribute("listDienThoai", listDienThoai); // Sử dụng danh sách đã lọc

	    RequestDispatcher dispatcher = request.getRequestDispatcher("view/DanhSachDienThoaiNCC.jsp");
	    dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
