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

import java.io.IOException;
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

    @Test
    public  void doupdate() throws IOException {
        String []str=   {"zz01.jpg","zz0101.jpg","zz0102.jpg","zz0103.jpg","zz0104.jpg","zz0105.jpg","zz0106.jpg","zz0107.jpg","zz0108.jpg","zz0109.jpg","zz0110.jpg","zz0111.jpg","zz0112.jpg","zz0113.jpg","zz0114.jpg","zz0115.jpg","zz0116.jpg","zz02.png","zz03.jpg","zz0301.jpg","zz0302.jpg","zz0303.jpg","zz0304.jpg","zz0305.jpg","zz0306.jpg","zz0307.jpg","zz0308.jpg","zz0309.jpg","zz0310.jpg","zz0311.jpg","zz03112.jpg","zz03113.jpg","zz03114.jpg","zz03115.jpg","zz03116.jpg","zz03118.jpg","zz03119.jpg","zz04.jpg","zz05.jpg","zz0501.jpg","zz0502.jpg","zz0503.jpg","zz0504.jpg","zz0505.jpg","zz0506.jpg","zz0507.jpg","zz0508.jpg","zz0509.jpg","zz0510.jpg","zz0511.jpg","zz0512.jpg","zz0513.jpg","zz0514.jpg","zz0515.jpg","zz0516.jpg","zz0517.jpg","zz06.jpg","zz07.png","zz08.jpg","zz09.jpg","zz10.jpg","zz11.jpg","zz12.jpg","zz13.jpg","zz14.jpg","zz15.jpg","zz16.jpg","zz17.jpg","zz18.jpg","zz19.jpg","zz20.jpg","zz21.jpg","zz22.jpg","zz23.jpg","zz24.jpg","zz25.jpg,zz26.jpg","zz27.jpg","zz28.jpg","zz29.jpg","zz30.jpg",""};
        String preName="../img/zz_img/";
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        Back mapper = sqlSession.getMapper(Back.class);
        List<Magazines> manazines = mapper.getManazines(0, 1000);//杂志
        for (Magazines mg : manazines) {
           if ("../img/zz20.jpg".equals(mg.getM_ImgUrl())){
               System.out.println(mg.getM_ID()+"   "+mg.getM_ImgUrl());
               String img=preName+str[((int)(Math.random()*1000))%81];
               mapper.upDataBookImg(img,mg.getM_ID());
               sqlSession.commit();
           }
        }
        sqlSession.commit();
        sqlSession.close();
    }
}
