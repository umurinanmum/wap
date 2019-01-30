import com.wap.dao.CategoryDao;
import com.wap.dao.TaskDao;
import lombok.var;
import org.junit.Test;

public class CategoryDaoTest {

    @Test
    public void test() {
        CategoryDao categoryDao = new CategoryDao();
        System.out.println(categoryDao.getAll().getData().get(0).getName());

        TaskDao taskDao = new TaskDao();
        var tasks = taskDao.getAllTask(true);
        int a =5;
    }
}
