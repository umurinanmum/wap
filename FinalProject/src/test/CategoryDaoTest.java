import com.wap.dao.CategoryDao;
import com.wap.dao.TaskDao;
import com.wap.dto.CategoryDto;
import com.wap.dto.TaskDto;
import com.wap.dto.UserDto;
import lombok.var;
import org.junit.Test;

import java.sql.Date;

public class CategoryDaoTest {

    @Test
    public void test() {
        CategoryDao categoryDao = new CategoryDao();
        System.out.println(categoryDao.getAll().getData().get(0).getName());

        TaskDao taskDao = new TaskDao();
        var tasks = taskDao.getAllTask(true);

        TaskDto taskDto = new TaskDto();
        taskDto.setName("test");
        taskDto.setRequiredBy(Date.valueOf("2019-01-17"));
        taskDto.setCategory(new CategoryDto());
        taskDto.getCategory().setId(1);
        taskDto.setPriority(5);
        taskDto.setUser(new UserDto());
        taskDto.getUser().setId(1);
        taskDto.setCompleted(true);

        //taskDao.save(taskDto);

        taskDto = new TaskDto();
        taskDto.setName("test");
        taskDto.setRequiredBy(Date.valueOf("2019-01-17"));
        taskDto.setCategory(new CategoryDto());
        taskDto.getCategory().setId(1);
        taskDto.setPriority(5333333);
        taskDto.setUser(new UserDto());
        taskDto.getUser().setId(1);
        taskDto.setCompleted(true);
        taskDto.setId(101);

      //  taskDao.update(taskDto);

      //  taskDao.delete(101);

        int a =5;
    }
}
