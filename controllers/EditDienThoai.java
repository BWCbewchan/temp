package iuh.fit.se.controllers;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import iuh.fit.se.dao.dienthoaiDAO;
import iuh.fit.se.daoimpl.DienThoaiDAOimpl;
import iuh.fit.se.entities.dienthoai;
import iuh.fit.se.utils.EntityManagerFactoryUtil;

/**
 * Servlet implementation class EditDienThoai
 */
@WebServlet("/EditDienThoai")
public class EditDienThoai extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private EntityManagerFactoryUtil entityManagerFactory;
    private dienthoaiDAO dienThoaiDao;

    @Override
    public void init() throws ServletException {
        this.entityManagerFactory = new EntityManagerFactoryUtil();
        this.dienThoaiDao = new DienThoaiDAOimpl(entityManagerFactory.getEntityManager());
    }

    @Override
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		// TODO Auto-generated method stub
    	String maDT = request.getParameter("maDT");
        System.out.println("Received maDT: " + maDT); // Debugging output

        if (maDT == null || maDT.trim().isEmpty()) {
            request.setAttribute("error", "Mã điện thoại không hợp lệ!");
            request.getRequestDispatcher("QuanLyFormServlet").forward(request, response);
            return;
        }

        String tenDT = request.getParameter("tenDT");
        int namSanXuat = Integer.parseInt(request.getParameter("namSanXuat"));
        String cauHinh = request.getParameter("cauHinh");

        // Debugging output
        System.out.println("Updating DienThoai with ID: " + maDT);
        System.out.println("New name: " + tenDT);
        System.out.println("New year: " + namSanXuat);
        System.out.println("New configuration: " + cauHinh);

        dienthoai existingDienThoai = dienThoaiDao.findById(maDT);
        if (existingDienThoai != null) {
            existingDienThoai.setTenDT(tenDT);
            existingDienThoai.setNamSanXuat(namSanXuat);
            existingDienThoai.setCauHinh(cauHinh);

            if (dienThoaiDao.update(existingDienThoai) != null) {
                request.setAttribute("message", "Cập nhật thành công!");
            } else {
                request.setAttribute("error", "Cập nhật không thành công!");
            }
        } else {
            request.setAttribute("error", "Không tìm thấy sản phẩm để cập nhật!");
        }

        request.getRequestDispatcher("QuanLyFormServlet").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }
    @Override
    public void destroy() {
        entityManagerFactory.close();
        super.destroy();
    }
}
