package jp.co.sample.admin;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class CreateInnServlet
 */
@WebServlet("/admin/craete-inn")
@MultipartConfig(maxFileSize=1048576)
public class CreateInnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 宿を登録するページを表示する
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/craeteInn.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 宿を登録する
		Part part = request.getPart("fileUpload");
		File uploadDir = new File(getServletContext().getRealPath("/upload"));
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		String fileName = part.getSubmittedFileName();
		save(part, new File(uploadDir, fileName));

		request.setAttribute("uploadFilePath", "/upload/" + fileName);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/bootstrap-sample.jsp");
		rd.forward(request, response);
	}

	public void save(Part in, File out) throws IOException {
		BufferedInputStream br = new BufferedInputStream(in.getInputStream());
		try (BufferedOutputStream bw = new BufferedOutputStream(new FileOutputStream(out))) {
			int len = 0;
			byte[] buff = new byte[1024];
			while ((len = br.read(buff)) != -1) {
				bw.write(buff, 0, len);
			}
		}
	}
}
