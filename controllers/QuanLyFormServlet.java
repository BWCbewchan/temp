package iuh.fit.se.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import iuh.fit.se.dao.dienthoaiDAO;
import iuh.fit.se.daoimpl.DienThoaiDAOimpl;
import iuh.fit.se.entities.dienthoai;
import iuh.fit.se.utils.EntityManagerFactoryUtil;

/**
 * Servlet implementation class QuanLyFormServlet
 */
@WebServlet("/QuanLyFormServlet")
public class QuanLyFormServlet extends HttpServlet {
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
        String searchTerm = request.getParameter("search");
        List<dienthoai> listDienThoai;

        if (searchTerm != null && !searchTerm.isEmpty()) {
            listDienThoai = dienThoaiDao.findAll().stream()
                    .filter(dt -> dt.getMaDT().contains(searchTerm) || 
                                  dt.getTenDT().contains(searchTerm))
                    .toList();
        } else {
            listDienThoai = dienThoaiDao.findAll();
        }

        request.setAttribute("listDienThoai", listDienThoai);
        request.getRequestDispatcher("view/QuanLyForm.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maDT = request.getParameter("maDT");

        if (maDT != null && !maDT.isEmpty()) {
            boolean deleted = dienThoaiDao.delete(maDT);
            if (deleted) {
                request.setAttribute("message", "Xóa điện thoại thành công.");
            } else {
                request.setAttribute("error", "Không tìm thấy điện thoại với mã: " + maDT);
            }
        } else {
            request.setAttribute("error", "Mã điện thoại không hợp lệ.");
        }

        // Lấy lại danh sách điện thoại sau khi xóa
        List<dienthoai> listDienThoai = dienThoaiDao.findAll();
        request.setAttribute("listDienThoai", listDienThoai);
        request.getRequestDispatcher("/view/QuanLyForm.jsp").forward(request, response);

    }

    @Override
    public void destroy() {
        entityManagerFactory.close();
        super.destroy();
    }

}
