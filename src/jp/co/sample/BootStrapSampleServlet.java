package jp.co.sample;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BootStrapSampleServlet
 */
@WebServlet("/bootstrap-sample")
public class BootStrapSampleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/bootstrap-sample.jsp");
		rd.forward(request, response);
	}

	void sample(String name, String address) {
		String baseQuery = "SELECT * FROM Sample";
		List<String> queryList = new ArrayList<>();
		List<String> valueList = new ArrayList<>();
		if (!"".equals(name)) {
			queryList.add("NAME = ?");
			valueList.add(name);
		}
		if (!"".equals(address)) {
			queryList.add("ADDRESS = ?");
			valueList.add(address);
		}
		String sql = String.join("AND" , queryList);
		if (!sql.isEmpty()) {
			sql = baseQuery + " WHERE " + sql;
		}
	}

}
