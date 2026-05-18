//追加修正20260518

package tool;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "*.action" })
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(
			HttpServletRequest req,
			HttpServletResponse res)
			throws ServletException, IOException {

		try {

			// 文字コード設定
			req.setCharacterEncoding("UTF-8");

			// パス取得
			String path =
				req.getServletPath().substring(1);

			// Actionクラス名へ変換
			String name =
				path
				.replace(".action", "Action")
				.replace('/', '.');

			// デバッグ表示
			System.out.println(
				"★ servlet path -> "
				+ req.getServletPath()
			);

			System.out.println(
				"★ class name -> "
				+ name
			);

			// Action生成
			Action action =
				(Action) Class
				.forName(name)
				.getDeclaredConstructor()
				.newInstance();

			// 実行
			action.execute(req, res);

		} catch (Exception e) {

			e.printStackTrace();

			// エラー画面
			req.setAttribute(
				"exception",
				e
			);

			req.getRequestDispatcher(
				"/error.jsp"
			).forward(req, res);
		}
	}

	@Override
	protected void doPost(
			HttpServletRequest req,
			HttpServletResponse res)
			throws ServletException, IOException {

		doGet(req, res);
	}
}