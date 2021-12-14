import com.shiyuan.dao.Back;
import com.shiyuan.entity.Magazines;
import com.shiyuan.entity.back.BackShoppingCart;
import com.shiyuan.entity.back.SellFrom;
import com.shiyuan.service.Impl.UserServiceImpl;
import com.shiyuan.service.UserService;
import com.shiyuan.utils.getuuid;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.InputStream;
import java.util.List;

public class Test01 {
    @Test
    public void test01() {

        UserService userService = new UserServiceImpl();
        //User user = new User();
        System.out.println("userService.upName(\"ls123456\",\"李建磊\") = " + userService.upName("ls123456", "李建磊"));
        //System.out.println("userService.getUser(\"ls123456\",null) = " + userService.getUser("ls123456", null));

    }

    @Test
    public void testQueryHomeWorkWithPageHelper() throws Exception {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH);
        Back mapper = sqlSession.getMapper(Back.class);
        String[] randomDare = getuuid.getRandomDare();//随机时间
        String[] username = {"hj1234","lj123456", "ls1234","ls123456", "shiyuan", "ww1234", "zs1234", "zx123456", "lu1234", "popo", "tutu", "xiaoli", "poler", "dvdv", "dbf4"};
        String []state={"待下单","待付款","缺货中"};
        List<Magazines> manazines = mapper.getManazines(0, 1000);//杂志
        for (Magazines mg : manazines) {
            for (int i = 0; i < (int) (Math.random() * 100)%10; i++) {
                int temp = (int) ((Math.random() * 1000) * (Math.random() * 1000)) % 5;
                for (int j = 0; j < (int) (Math.random() * 100)%5; j++) {
                    int temp2 = (int) (Math.random() * 100) %15;
                    System.out.println(temp + "  " + temp2);
                    String uuid = getuuid.getUUID();//订单编号
                    BackShoppingCart shoppingCart=new BackShoppingCart(uuid,mg.getM_ID(), username[temp2],randomDare[temp],state[(int) (Math.random() * 100)%3]);
                    mapper.insertshoppingcart(shoppingCart);
                }
            }
        }
        sqlSession.commit();
        sqlSession.close();
    }
}
 /*  BackService back=new BackServiceImpl();

        Map<String, Object> manazinesnull1 = back.getManazinesnull(1);
        List<Magazines> ma =( List<Magazines>)manazinesnull1.get("hwlist") ;
        String s = JSON.toJSONString(ma);
        System.out.println(s);
        int sum = (int)manazinesnull1.get("total");
        int sumpages =(int)manazinesnull1.get("pages");
        int neww = (int)manazinesnull1.get("pageNum");
        Map<String,Integer> map=new HashMap<>();
        map.put("sum",sum);
        map.put("sumpages",sumpages);
        map.put("neww",neww);
        String t = JSON.toJSONString(map);
        System.out.println("map********"+t);*/