# SpringMVC 注释总结 与使用对比

## @Controller
用于标记在一个类上，使用它标记的类就是一个SpringMVC Controller 对象。分发处理器将会扫描使用了该注解的类的方法。通俗来说，被Controller标记的类就是一个控制器，这个类中的方法，就是相应的动作。

## @RequestMapping

是一个用来处理请求地址映射的注解，可用于类或方法上。用于类上，表示类中的所有响应请求的方法都是以该地址作为父路径。

## @Service
用来标记 Service 类, 
例：@Service("userService")注解是告诉Spring，当Spring要创建UserServiceImpl的的实例时，bean的名字必须叫做"userService"，这样当Action需要使用UserServiceImpl的的实例时,就可以由Spring创建好的"userService"，然后注入给Action。

## @Repository
DAO层的标记注释，
如：@Repository(value="userDao")注解是告诉Spring，让Spring创建一个名字叫“userDao”的UserDaoImpl实例。
当Service需要使用Spring创建的名字叫“userDao”的UserDaoImpl实例时，就可以使用@Resource(name = "userDao")注解告诉Spring，Spring把创建好的userDao注入给Service即可。
	
## @Component
mapper层 的标注。

## @Transactional
事务管理 控制标注

## @Autowired
自动装配标注，@Autowired可以对成员变量、方法和构造函数进行标注，来完成自动装配的工作，我们也要清楚，@Autowired是根据类型进行自动装配的。

## @Resource
@Resource的作用相当于@Autowired，只不过@Autowired按byType自动注入，而@Resource默认按 byName自动注入罢了。

@Resource有两个属性是比较重要的，分别是name和type，spring将@Resource注解的name属性解析为bean的名字，而type属性则解析为bean的类型。所以如果使用name属性，则使用byName的自动注入策略，而使用type属性时则使用byType自动注入策略。如果既不指定name也不指定type属性，这时将通过反射机制使用byName自动注入策略。

- @Resource装配顺序
1. 如果同时指定了name和type，则从Spring上下文中找到唯一匹配的bean进行装配，找不到则抛出异常。
2. 如果指定了name，则从上下文中查找名称（id匹配的bean进行装配，找不到则抛出异常。
3. 如果指定了type，则从上下文中找到类型匹配的唯一bean进行装配，找不到或者找到多个，都会抛出异常。
4. 如果既没有指定name，又没有指定type，则自动按照byName方式进行装配，如果没有匹配，则回退为一个原始类型（UserDao）进行匹配，如果匹配则自动装配。

当指定了@service的name值时， 在@Resource中要么不指示，如果指示的话，则要与之相对应。
当没有指定@service的name值是，在@Resource中随意。但是前提是，实现该接口的只有这一个类。
所以，建议是最好在@service和@Resoure中同时指定名称，并且做到一一对应。
如果采用@Autowired来注解，则同样无需指定name属性，若是实现该接口有多个类，则需要通过@Qualifier来做区分
     例：UserService、UserService2是实现IuserService的两个实现类, 类中@Service的注解分别是
```java
@Service("userService1")
public class UserService  implements IuserService {}
@Service("userService2")
public class UserService2 implements IuserService {}
```
那么在TestMethod中测试方法，使用接口IuserService时，使用的@Autowired来标注时，需要使用注解@Qualifier来做区分
```java
@Autowired
@Qualifier("userService2")
private IuserService userService;
  @Resource(name="loginService") 
     private LoginService loginService;
  
     @Autowired(required=false)
     @Qualifier("loginService") 
     private LoginService loginService;
```

### 两个的区别：
  
(1).@Autowired 与@Resource都可以用来装配bean. 都可以写在字段上,或写在setter方法上;

(2).@Autowired 默认按类型装配，默认情况下必须要求依赖对象必须存在，如果要允许null值，可以设
置它的required属性为false，如：@Autowired(required=false) .
如果我们想使用名称装配可以结合 @Qualifier注解进行使用;

(3).@Resource（这个注解属于J2EE的），默认安装名称进行装配，名称可以通过name属性进行指定，如果没有指定name属性，当注解写在字段上时，默认取字段名进行安装名称查找，如果注解写在setter方法上默认取属性名进行装配。当找不到与名称匹配的bean时才按照类型进行装 配。但是需要注意的是，如果name属性一旦指定，就只会按照名称进行装配。

## 总结


@Controller 用于标记在一个类上，使用它标记的类就是一个SpringMVC Controller 对象。分发处理器将会扫描使用了该注解的类的方法。通俗来说，被Controller标记的类就是一个控制器，这个类中的方法，就是相应的动作。

1. @controller 控制器（注入服务）
2. @service 服务（注入dao）
3. @repository dao（实现dao访问）
4. @component （把普通pojo实例化到spring容器中，相当于配置文件中的<bean id="" class=""/>）




## 作用：
@Component-----------泛指组件，当组件不好归类的时候，我们可以使用这个注解进行标注。(Component-------成分; 组分; 零件)

- @Resource----------(资源)
- @Autowired---------(自动绑定)
- @Repository--------于标注数据访问组件，即DAO组件(repository-------仓库; 贮藏室，容器。)
- @Service-----------用于标注业务层组件（我们通常定义的service层就用这个）  
- @Controller--------用于标注控制层组件（如struts中的action）

    这几个注解的作用相同：都是为实现所在类(即组件)的bean的转化，然后可以在容器中调用。然后从名字上的作用就是可以明确各个层次和层次的作用。

###为什么要bean转化。

    虽然下面内容超多，但是看完真的有不少帮助，若是你不是很了解的话。

Spring 2.5 中除了提供 @Component 注释外，还定义了几个拥有特殊语义的注释，它们分别是：@Repository、@Service 和 @Controller。在目前的 Spring 版本中，这 3 个注释和 @Component 是等效的，但是从注释类的命名上，很容易看出这 3 个注释分别和持久层、业务层和控制层（Web 层）相对应。虽然目前这 3 个注释和 @Component 相比没有什么新意，但 Spring 将在以后的版本中为它们添加特殊的功能。所以，如果 Web 应用程序采用了经典的三层分层结构的话，最好在持久层、业务层和控制层分别采用 @Repository、@Service 和 @Controller 对分层中的类进行注释，而用 @Component 对那些比较中立的类进行注释。 

在一个稍大的项目中，通常会有上百个组件，如果这些组件采用xml的bean定义来配置，显然会增加配置文件的体积，查找以及维护起来也不太方便。 Spring2.5为我们引入了组件自动扫描机制，他可以在类路径底下寻找标注了@Component,@Service,@Controller,@Repository注解的类，并把这些类纳入进spring容器中管理。它的作用和在xml文件中使用bean节点配置组件时一样的。要使用自动扫描机制，我们需要打开以下配置信息： 
Java代码 


```xml
<?xml version="1.0" encoding="UTF-8" ?> <beansxmlnsbeansxmlns="http://www.springframework.org/schema/beans"xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"xmlns:context="http://www.springframework.org/schema/context"xsi:schemaLocation="http://www.springframework.org/schema/beans  http://www.springframework.org/schema/beans/spring-beans-2.5.xsd  http://www.springframework.org/schema/context  http://www.springframework.org/schema/context/spring-context-2.5.xsd" >
    
<context:component-scan base-package=”com.eric.spring”>     
</beans>

```
  
其中base-package为需要扫描的包（含所有子包） @Service用于标注业务层组件，@Controller用于标注控制层组件（如struts中的action）,@Repository用于标注数据访问组件，即DAO组件，而@Component泛指组件，当组件不好归类的时候，我们可以使用这个注解进行标注。
   
    @Service public class VentorServiceImpl implements iVentorService{ } 
    @Repository public class VentorDaoImpl implements iVentorDao {}

 getBean的默认名称是类名（头字母小写），如果想自定义，可以@Service(“aaaaa”)这样来指定，这种bean默认是单例的，如果想改变，可以使用@Service(“beanName”)@Scope(“prototype”)来改变。可以使用以下方式指定初始化方法和销毁方法（方法名任意）：

    
    @PostConstruct public void init() { } 
    @PreDestroy public void destory() { } 

### 注入方式： 
把DAO实现类注入到service实现类中，把service的接口(注意不要是service的实现类)注入到action中，注入时不要new 这个注入的类，因为spring会自动注入，如果手动再new的话会出现错误，然后属性加上@Autowired后不需要getter()和setter()方法，Spring也会自动注入。至于更具体的内容，等对注入的方式更加熟练后会做个完整的例子上来。 

```html
注解在spring的配置文件里面只需要加上<context:annotation-config/>和<context:component-scanbase-package="需要实现注入的类所在包"/>，可以使用base-package="*"表示全部的类。
< context:component-scan base-package=”com.eric.spring”> 
其中base-package为需要扫描的包（含所有子包） 

```

在接口前面标上@Autowired和@Qualifier注释使得接口可以被容器注入，当接口存在两个实现类的时候必须指定其中一个来注入，使用实现类首字母小写的字符串来注入，如： 
    @Autowired      
    @Qualifier("chinese")      
     private Man man; 
      
否则可以省略，只写@Autowired  。 

Spring中@Autowired注解、@Resource注解的区别

Spring不但支持自己定义的@Autowired注解，还支持几个由JSR-250规范定义的注解，它们分别是@Resource、@PostConstruct以及@PreDestroy。
@Resource的作用相当于@Autowired，只不过@Autowired按byType自动注入，而@Resource默认按 byName自动注入罢了。@Resource有两个属性是比较重要的，分是name和type，Spring将@Resource注解的name属性解析为bean的名字，而type属性则解析为bean的类型。所以如果使用name属性，则使用byName的自动注入策略，而使用type属性时则使用byType自动注入策略。如果既不指定name也不指定type属性，这时将通过反射机制使用byName自动注入策略。

@Resource装配顺序
1. 如果同时指定了name和type，则从Spring上下文中找到唯一匹配的bean进行装配，找不到则抛出异常
2. 如果指定了name，则从上下文中查找名称（id）匹配的bean进行装配，找不到则抛出异常
3. 如果指定了type，则从上下文中找到类型匹配的唯一bean进行装配，找不到或者找到多个，都会抛出异常
4. 如果既没有指定name，又没有指定type，则自动按照byName方式进行装配；如果没有匹配，则回退为一个原始类型进行匹配，如果匹配则自动装配；

@Autowired 与@Resource的区别：

1、 @Autowired与@Resource都可以用来装配bean.都可以写在字段上,或写在setter方法上。
2、@Autowired默认按类型装配（这个注解是属业spring的），默认情况下必须要求依赖对象必须存在，如果要允许null值，可以设置它的required属性为false，如：@Autowired(required=false)，如果我们想使用名称装配可以结合@Qualifier注解进行使用，如下：
a.@Autowired() @Qualifier("baseDao")
b.private BaseDao baseDao;
3、@Resource（这个注解属于J2EE的），默认安装名称进行装配，名称可以通过name属性进行指定，如果没有指定name属性，当注解写在字段上时，默认取字段名进行安装名称查找，如果注解写在setter方法上默认取属性名进行装配。当找不到与名称匹配的bean时才按照类型进行装配。但是需要注意的是，如果name属性一旦指定，就只会按照名称进行装配。
a.@Resource(name="baseDao")
b.private BaseDao baseDao;

推荐使用：@Resource注解在字段上，这样就不用写setter方法了，并且这个注解是属于J2EE的，减少了与spring的耦合。这样代码看起就比较优雅。
使用Spring2.5的新特性——Autowired可以实现快速的自动注入，而无需在xml文档里面添加bean的声明，大大减少了xml文档的维护(我想到安卓开发是不是有一个xml里面每个页面都要在这声明，类似的原理，原来web开发也是这么滴，注解出现后，就不用一个个声明啦)。（偶喜欢这个功能，因为偶对xml不感冒以下是一个例子：
```java
//先编写接口Man：    
 public interface Man {    
            public String sayHello();    
 }

  
//然后写Man的实现类Chinese和American：    

@Service    
public class Chinese implements Man{    
    public String sayHello() {    
        return "I am Chinese!";    
    }    
}    
    
@Service    
public class American implements Man{    
    public String sayHello() {    
        return "I am American!";    
    }    
}   

```
 
@Service注释表示定义一个bean，自动根据bean的类名实例化一个首写字母为小写的bean，例如Chinese实例化为chinese，American实例化为american，如果需要自己改名字则:@Service("你自己改的bean名")。
beans.xml  
```xml
<?xml version="1.0" encoding="UTF-8"?>    
<beans xmlns="http://www.springframework.org/schema/beans"    
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"    
        xmlns:context="http://www.springframework.org/schema/context"    
        xsi:schemaLocation="http://www.springframework.org/schema/beans     
           http://www.springframework.org/schema/beans/spring-beans-2.5.xsd    
           http://www.springframework.org/schema/context    
           http://www.springframework.org/schema/context/spring-context-2.5.xsd">    
      <context:annotation-config/>    
      <context:component-scan base-package="testspring.main"/>    
</beans>  

```

在spring的配置文件里面只需要加上<context:annotation-config/>和<context:component-scan base-package="需要实现注入的类所在包"/>，可以使用base-package="*"表示全部的类。

编写主类测试：
```java
@Service    
public class Main {    
    @Autowired    
    @Qualifier("chinese")    
    private Man man;    
    public static void main(String[] args) {    
        // TODO code application logic here    
        ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");    
        Main main = (Main) ctx.getBean("main");    
        System.out.println(main.getMan().sayHello());    
    }    
    public Man getMan() {    
        return man;    
    }    
} 
``` 
在Man接口前面标上@Autowired和@Qualifier注释使得Man接口可以被容器注入，当Man接口存在两个实现类的时候必须指定其中一个来注入，使用实现类首字母小写的字符串来注入。否则可以省略，只写@Autowired
注释配置相对于 XML 配置具有很多的优势： 
 

它可以充分利用 Java 的反射机制获取类结构信息，这些信息可以有效减少配置的工作。如使用 JPA 注释配置 ORM 映射时，我们就不需要指定 PO 的属性名、类型等信息，如果关系表字段和 PO 属性名、类型都一致，您甚至无需编写任务属性映射信息——因为这些信息都可以通过 Java 反射机制获取。  
     
 注释和 Java 代码位于一个文件中，而 XML 配置采用独立的配置文件，大多数配置信息在程序开发完成后都不会调整，如果配置信息和 Java 代码放在一起，有助于增强程序的内聚性。而采用独立的 XML 配置文件，程序员在编写一个功能时，往往需要在程序文件和配置文件中不停切换，这种思维上的不连贯会降低开发效率。   
 因此在很多情况下，注释配置比 XML 配置更受欢迎，注释配置有进一步流行的趋势。Spring 2.5 的一大增强就是引入了很多注释类，现在您已经可以使用注释配置完成大部分 XML 配置的功能。在这篇文章里，我们将向您讲述使用注释进行 Bean 定义和依赖注入的内容。
原来我们是怎么做的
在使用注释配置之前，先来回顾一下传统上是如何配置 Bean 并完成 Bean 之间依赖关系的建立。下面是 3 个类，它们分别是 Office、Car 和 Boss，这 3 个类需要在 Spring 容器中配置为 Bean：


 Office 仅有一个属性：    
 1. Office.java    
 package cn.tekin;    
 public class Office {    
     private String officeNo =”001”;     
    //省略 get/setter    
     @Override    
     public String toString() {    
         return "officeNo:" + officeNo;    
     }    
 }    
 Car 拥有两个属性：    
2. Car.java    
  package cn.tekin;    
  public class Car {    
      private String brand;    
      private double price;    
      // 省略 get/setter    
      @Override    
      public String toString() {    
          return "brand:" + brand + "," + "price:" + price;    
      }    
  }    
  Boss 拥有 Office 和 Car 类型的两个属性：    
 3. Boss.java    
  package cn.tekin;    
  public class Boss {    
      private Car car;    
     private Office office;    
       // 省略 get/setter    
       @Override    
      public String toString() {    
         return "car:" + car + "\n" + "office:" + office;    
     }    
  }   
我们在 Spring 容器中将 Office 和 Car 声明为 Bean，并注入到 Boss Bean 中：下面是使用传统 XML 完成这个工作的配置文件 beans.xml：
4. beans.xml 将以上三个类配置成 Bean
```xml
<?xml version="1.0" encoding="UTF-8" ?>    
 <beans xmlns="http://www.springframework.org/schema/beans"    
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"    
    xsi:schemaLocation="http://www.springframework.org/schema/beans     
  http://www.springframework.org/schema/beans/spring-beans-2.5.xsd">    
     <bean id="boss" class="cn.tekin.Boss">    
         <property name="car" ref="car"/>    
        <property name="office" ref="office" />    
    </bean>    
    <bean id="office" class="cn.tekin.Office">    
        <property name="officeNo" value="002"/>    
     </bean>    
     <bean id="car" class="cn.tekin.Car" scope="singleton">    
         <property name="brand" value=" 红旗 CA72"/>    
        <property name="price" value="2000"/>    
    </bean>    
</beans>    
```
 
 当我们运行以下代码时，控制台将正确打出 boss 的信息：  

5. 测试类：AnnoIoCTest.java  
```java
import org.springframework.context.ApplicationContext;    
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AnnoIoCTest {    
     public static void main(String[] args) {    
          String[] locations = {"beans.xml"};    
          ApplicationContext ctx =     
             new ClassPathXmlApplicationContext(locations);    
         Boss boss = (Boss) ctx.getBean("boss");    
         System.out.println(boss);    
      }    
}

```  
  
使用 @Autowired 注释 
Spring 2.5 引入了 @Autowired 注释，它可以对类成员变量、方法及构造函数进行标注，完成自动装配的工作。来看一下使用 @Autowired 进行成员变量自动注入的代码：

6. 使用 @Autowired 注释的 Boss.java   
```java
package cn.tekin;    
 import org.springframework.beans.factory.annotation.Autowired;    
 public class Boss {    
    @Autowired    
     private Car car;    
     @Autowired    
     private Office office;    
     …    
 }    
``` 
 
 Spring 通过一个 BeanPostProcessor 对 @Autowired 进行解析，所以要让 @Autowired 起作用必须事先在 Spring 容器中声明 AutowiredAnnotationBeanPostProcessor Bean。    
7. 让 @Autowired 注释工作起来
```xml
<?xml version="1.0" encoding="UTF-8" ?>    
 <beans xmlns="http://www.springframework.org/schema/beans"    
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"    
     xsi:schemaLocation="http://www.springframework.org/schema/beans     
  http://www.springframework.org/schema/beans/spring-beans-2.5.xsd">    
     <!-- 该 BeanPostProcessor 将自动起作用，对标注 @Autowired 的 Bean 进行自动注入 -->    
     <bean class="org.springframework.beans.factory.annotation.    
         AutowiredAnnotationBeanPostProcessor"/>    
    
    <!-- 移除 boss Bean 的属性注入配置的信息 -->    
    <bean id="boss" class="cn.tekin.Boss"/>    
       <bean id="office" class="cn.tekin.Office">    
         <property name="officeNo" value="001"/>    
     </bean>    
     <bean id="car" class="cn.tekin.Car" scope="singleton">    
         <property name="brand" value=" 红旗 CA72"/>    
       <property name="price" value="2000"/>    
    </bean>    
 </beans> 
```   
    
这样，当 Spring 容器启动时，AutowiredAnnotationBeanPostProcessor 将扫描 Spring 容器中所有 Bean，当发现 Bean 中拥有 @Autowired
注释时就找到和其匹配（默认按类型匹配）的 Bean，并注入到对应的地方中去。
按照上面的配置，Spring 将直接采用 Java 反射机制对 Boss 中的 car 和 office 这两个私有成员变量进行自动注入。所以对成员变量使用 @Autowired 后，您大可将它们的 setter 方法（setCar() 和 setOffice()）从 Boss 中删除。
当然，您也可以通过 @Autowired 对方法或构造函数进行标注，来看下面的代码：
[java] view plain copy
8. 将 @Autowired 注释标注在 Setter 方法上    
 package cn.tekin;    
 public class Boss {    
     private Car car;    
     private Office office;    
     
      @Autowired    
    public void setCar(Car car) {    
        this.car = car;    
    }    
  
    @Autowired    
     public void setOffice(Office office) {    
         this.office = office;    
    }    
     …    
 }    
 这时，@Autowired 将查找被标注的方法的入参类型的 Bean，并调用方法自动注入这些 Bean。而下面的使用方法则对构造函数进行标注：    
9. 将 @Autowired 注释标注在构造函数上  
  
 package cn.tekin;    
 public class Boss {    
     private Car car;    
     private Office office;    
  
     @Autowired    
     public Boss(Car car ,Office office){    
         this.car = car;    
        this.office = office ;    
    }    
    …    
}
  
 由于 Boss() 构造函数有两个入参，分别是 car 和 office，@Autowired 将分别寻找和它们类型匹配的 Bean，将它们作为 Boss(Car car ,Office office) 的入参来创建 Boss Bean。  
当候选 Bean 数目不为 1 时的应对方法
在默认情况下使用 @Autowired 注释进行自动注入时，Spring 容器中匹配的候选 Bean 数目必须有且仅有一个。当找不到一个匹配的 Bean 时，Spring 容器将抛出 BeanCreationException 异常，并指出必须至少拥有一个匹配的 Bean。我们可以来做一个实验：

10. 候选 Bean 数目为 0 时    
 <?xml version="1.0" encoding="UTF-8" ?>    
 <beans xmlns="http://www.springframework.org/schema/beans"    
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"    
      xsi:schemaLocation="http://www.springframework.org/schema/beans     
  http://www.springframework.org/schema/beans/spring-beans-2.5.xsd ">    
      
    <bean class="org.springframework.beans.factory.annotation.    
         AutowiredAnnotationBeanPostProcessor"/>     
       <bean id="boss" class="cn.tekin.Boss"/>    
     
    <!-- 将 office Bean 注释掉 -->    
    <!-- <bean id="office" class="cn.tekin.Office">    
     <property name="officeNo" value="001"/>    
    </bean>-->    
    
     <bean id="car" class="cn.tekin.Car" scope="singleton">    
        <property name="brand" value=" 红旗 CA72"/>    
         <property name="price" value="2000"/>    
    </bean>    
 </beans>   
由于 office Bean 被注释掉了，所以 Spring 容器中将没有类型为 Office 的 Bean 了，而 Boss 的 office 属性标注了 @Autowired，当启动 Spring 容器时，异常就产生了。 
当不能确定 Spring 容器中一定拥有某个类的 Bean 时，可以在需要自动注入该类 Bean 的地方可以使用 @Autowired(required = false)，这等于告诉 Spring：在找不到匹配 Bean 时也不报错。来看一下具体的例子：

11. 使用 @Autowired(required = false)   
```java
package cn.tekin;    
import org.springframework.beans.factory.annotation.Autowired;    
import org.springframework.beans.factory.annotation.Required;    
 public class Boss {    
     private Car car;    
    private Office office;    
     @Autowired    
     public void setCar(Car car) {    
         this.car = car;    
     }    
    @Autowired(required = false)    
     public void setOffice(Office office) {    
        this.office = office;    
    }    
    …    
 }    

``` 

当然，一般情况下，使用 @Autowired 的地方都是需要注入 Bean 的，使用了自动注入而又允许不注入的情况一般仅会在开发期或测试期碰到（如为了快速启动 Spring 容器，仅引入一些模块的 Spring 配置文件），所以 @Autowired(required = false) 会很少用到。  
和找不到一个类型匹配 Bean 相反的一个错误是：如果 Spring 容器中拥有多个候选 Bean，Spring 容器在启动时也会抛出 BeanCreationException 异常。来看下面的例子：

12. 在 beans.xml 中配置两个 Office 类型的 Bean    
 <bean id="office" class="cn.tekin.Office">    
    <property name="officeNo" value="001"/>    
 </bean>    
 <bean id="office2" class="cn.tekin.Office">    
     <property name="officeNo" value="001"/>    
 </bean>    
 …    
 我们在 Spring 容器中配置了两个类型为 Office 类型的 Bean，当对 Boss 的 office 成员变量进行自动注入时，Spring 容器将无法确定到底要用哪一个 Bean，因此异常发生了。    
 Spring 允许我们通过 @Qualifier 注释指定注入 Bean 的名称，这样歧义就消除了，可以通过下面的方法解决异常：    
13. 使用 @Qualifier 注释指定注入 Bean 的名称  
  
@Autowired    
 public void setOffice(@Qualifier("office")Office office) {    
     this.office = office;    
 }    
 @Qualifier("office") 中的 office 是 Bean 的名称，所以 @Autowired 和 @Qualifier 结合使用时，自动注入的策略就从 byType 转变成 byName 了。@Autowired 可以对成员变量、方法以及构造函数进行注释，而 @Qualifier 的标注对象是成员变量、方法入参、构造函数入参。正是由于注释对象的不同，所以 Spring 不将 @Autowired 和 @Qualifier 统一成一个注释类。下面是对成员变量和构造函数入参进行注释的代码：    
 //对成员变量进行注释：    
14. 对成员变量使用 @Qualifier 注释  
  
public class Boss {    
     @Autowired    
     private Car car;    
    @Autowired    
    @Qualifier("office")    
   private Office office;    
    …    
}    
 //对构造函数入参进行注释：    
15. 对构造函数变量使用 @Qualifier 注释    
 public class Boss {    
     private Car car;    
     private Office office;    
  
     @Autowired    
     public Boss(Car car , @Qualifier("office")Office office){    
         this.car = car;    
         this.office = office ;    
     }    
 }    
 @Qualifier 只能和 @Autowired 结合使用，是对 @Autowired 有益的补充。一般来讲，@Qualifier 对方法签名中入参进行注释会降低代码的可读性，而对成员变量注释则相对好一些。  
使用 JSR-250 的注释  
  Spring 不但支持自己定义的 @Autowired 的注释，还支持几个由 JSR-250 规范定义的注释，它们分别是 @Resource、@PostConstruct 以及 @PreDestroy。
@Resource
@Resource 的作用相当于 @Autowired，只不过 @Autowired 按 byType 自动注入，面 @Resource 默认按 byName 自动注入罢了。@Resource 有两个属性是比较重要的，分别是 name 和 type，Spring 将 @Resource 注释的 name 属性解析为 Bean 的名字，而 type 属性则解析为 Bean 的类型。所以如果使用 name 属性，则使用 byName 的自动注入策略，而使用 type 属性时则使用 byType 自动注入策略。如果既不指定 name 也不指定 type 属性，这时将通过反射机制使用 byName 自动注入策略。

Resource 注释类位于 Spring 发布包的 lib/j2ee/common-annotations.jar 类包中，因此在使用之前必须将其加入到项目的类库中。来看一个使用 @Resource 的例子：

16. 使用 @Resource 注释的 Boss.java    
 package cn.tekin;    
 import javax.annotation.Resource;    
 public class Boss {    
     // 自动注入类型为 Car 的 Bean    
    @Resource    
     private Car car;    
     
     // 自动注入 bean 名称为 office 的 Bean    
     @Resource(name = "office")    
    private Office office;    
 }    
 一般情况下，我们无需使用类似于 @Resource(type=Car.class) 的注释方式，因为 Bean 的类型信息可以通过 Java 反射从代码中获取。    
 要让 JSR-250 的注释生效，除了在 Bean 类中标注这些注释外，还需要在 Spring 容器中注册一个负责处理这些注释的 BeanPostProcessor：    
 <bean class="org.springframework.context.annotation.CommonAnnotationBeanPostProcessor"/>    
 CommonAnnotationBeanPostProcessor 实现了 BeanPostProcessor 接口，它负责扫描使用了 JSR-250 注释的 Bean，并对它们进行相应的操作。 
  
@PostConstruct 和 @PreDestroy 

Spring 容器中的 Bean 是有生命周期的，Spring 允许在 Bean 在初始化完成后以及 Bean 销毁前执行特定的操作，您既可以通过实现 InitializingBean/DisposableBean 接口来定制初始化之后 / 销毁之前的操作方法，也可以通过 <bean> 元素的 init-method/destroy-method 属性指定初始化之后 / 销毁之前调用的操作方法。关于 Spring 的生命周期，笔者在《精通 Spring 2.x—企业应用开发精解》第 3 章进行了详细的描述，有兴趣的读者可以查阅。
JSR-250 为初始化之后/销毁之前方法的指定定义了两个注释类，分别是 @PostConstruct 和 @PreDestroy，这两个注释只能应用于方法上。标注了 @PostConstruct 注释的方法将在类实例化后调用，而标注了 @PreDestroy 的方法将在类销毁之前调用。

17. 使用 @PostConstruct 和 @PreDestroy 注释的 Boss.java    
 package cn.tekin;    
 import javax.annotation.Resource;    
 import javax.annotation.PostConstruct;    
 import javax.annotation.PreDestroy;    
 public class Boss {    
     @Resource    
     private Car car;    
    @Resource(name = "office")    
     private Office office;    
    @PostConstruct    
    public void postConstruct1(){    
       System.out.println("postConstruct1");    
    }    
     @PreDestroy    
    public void preDestroy1(){    
       System.out.println("preDestroy1");     
  }    
    …    
 }    
 您只需要在方法前标注 @PostConstruct 或 @PreDestroy，这些方法就会在 Bean 初始化后或销毁之前被 Spring 容器执行了。    
 我们知道，不管是通过实现 InitializingBean/DisposableBean 接口，还是通过 <bean> 元素的 init-method/destroy-method 属性进行配置，都只能为 Bean 指定一个初始化 / 销毁的方法。但是使用 @PostConstruct 和 @PreDestroy 注释却可以指定多个初始化 / 销毁方法，那些被标注 @PostConstruct 或 @PreDestroy 注释的方法都会在初始化 / 销毁时被执行。    
 通过以下的测试代码，您将可以看到 Bean 的初始化 / 销毁方法是如何被执行的：  
   
18. 测试类代码    
 ```java
package cn.tekin;    
 import org.springframework.context.support.ClassPathXmlApplicationContext;    
 public class AnnoIoCTest {    
    public static void main(String[] args) {    
         String[] locations = {"beans.xml"};    
        ClassPathXmlApplicationContext ctx =     
           new ClassPathXmlApplicationContext(locations);    
         Boss boss = (Boss) ctx.getBean("boss");    
        System.out.println(boss);    
        ctx.destroy();// 关闭 Spring 容器，以触发 Bean 销毁方法的执行    
    }    
 }    
```
 这时，您将看到标注了 @PostConstruct 的 postConstruct1() 方法将在 Spring 容器启动时，创建 Boss Bean 的时候被触发执行，而标注了 @PreDestroy 注释的 preDestroy1() 方法将在 Spring 容器关闭前销毁 Boss Bean 的时候被触发执行。    
 使用 <context:annotation-config/> 简化配置    
 Spring 2.1 添加了一个新的 context 的 Schema 命名空间，该命名空间对注释驱动、属性文件引入、加载期织入等功能提供了便捷的配置。我们知道注释本身是不会做任何事情的，它仅提供元数据信息。要使元数据信息真正起作用，必须让负责处理这些元数据的处理器工作起来。     
而我们前面所介绍的 AutowiredAnnotationBeanPostProcessor 和 CommonAnnotationBeanPostProcessor 就是处理这些注释元数据的处理器。但是直接在 Spring 配置文件中定义这些 Bean 显得比较笨拙。Spring 为我们提供了一种方便的注册这些 BeanPostProcessor 的方式，这就是 <context:annotation-config/>。请看下面的配置：    
19. 调整 beans.xml 配置文件    
```xml
 <?xml version="1.0" encoding="UTF-8" ?>    
 <beans xmlns="http://www.springframework.org/schema/beans"    
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"    
      xmlns:context="http://www.springframework.org/schema/context"    
      xsi:schemaLocation="http://www.springframework.org/schema/beans     
  http://www.springframework.org/schema/beans/spring-beans-2.5.xsd    
  http://www.springframework.org/schema/context     
  http://www.springframework.org/schema/context/spring-context-2.5.xsd">    
     <context:annotation-config/>     
     <bean id="boss" class="cn.tekin.Boss"/>    
     <bean id="office" class="cn.tekin.Office">    
        <property name="officeNo" value="001"/>    
     </bean>    
    <bean id="car" class="cn.tekin.Car" scope="singleton">    
        <property name="brand" value=" 红旗 CA72"/>    
        <property name="price" value="2000"/>    
    </bean>    
 </beans>    
```
 <context:annotationconfig/> 将隐式地向 Spring 容器注册 AutowiredAnnotationBeanPostProcessor、CommonAnnotationBeanPostProcessor、PersistenceAnnotationBeanPostProcessor 以及 equiredAnnotationBeanPostProcessor 这 4 个 BeanPostProcessor。    
 在配置文件中使用 context 命名空间之前，必须在 <beans> 元素中声明 context 命名空间。    
 使用 @Component    
 虽然我们可以通过 @Autowired 或 @Resource 在 Bean 类中使用自动注入功能，但是 Bean 还是在 XML 文件中通过 <bean> 进行定义 —— 也就是说，在 XML 配置文件中定义 Bean，通过 @Autowired 或 @Resource 为 Bean 的成员变量、方法入参或构造函数入参提供自动注入的功能。能否也通过注释定义 Bean，从 XML 配置文件中完全移除 Bean 定义的配置呢？答案是肯定的，我们通过 Spring 2.5 提供的 @Component 注释就可以达到这个目标了。    
 下面，我们完全使用注释定义 Bean 并完成 Bean 之间装配：    
20. 使用 @Component 注释的 Car.java  
  
 package cn.tekin;    
 import org.springframework.stereotype.Component;    
 @Component    
 public class Car {    
     …    
 }  
      
 仅需要在类定义处，使用 @Component 注释就可以将一个类定义了 Spring 容器中的 Bean。下面的代码将 Office 定义为一个 Bean：    
21. 使用 @Component 注释的 Office.java    

 package cn.tekin;    
 import org.springframework.stereotype.Component;    
 @Component    
 public class Office {    
     private String officeNo = "001";    
     …    
 }  
   
 这样，我们就可以在 Boss 类中通过 @Autowired 注入前面定义的 Car 和 Office Bean 了。    
22. 使用 @Component 注释的 Boss.java  
  
```java
 package cn.tekin;    
 import org.springframework.beans.factory.annotation.Autowired;    
 import org.springframework.beans.factory.annotation.Required;    
 import org.springframework.beans.factory.annotation.Qualifier;    
 import org.springframework.stereotype.Component;      
 @Component("boss")    
 public class Boss {    
    @Autowired    
    private Car car;    
     @Autowired    
     private Office office;    
     …    
 }  
```  
 @Component 有一个可选的入参，用于指定 Bean 的名称，在 Boss 中，我们就将 Bean 名称定义为“boss”。一般情况下，Bean 都是 singleton 的，需要注入 Bean 的地方仅需要通过 byType 策略就可以自动注入了，所以大可不必指定 Bean 的名称。    
 在使用 @Component 注释后，Spring 容器必须启用类扫描机制以启用注释驱动 Bean 定义和注释驱动 Bean 自动注入的策略。Spring 2.5 对 context 命名空间进行了扩展，提供了这一功能，请看下面的配置：    
23. 简化版的 beans.xml    
 ```xml
<?xml version="1.0" encoding="UTF-8" ?>    
 <beans xmlns="http://www.springframework.org/schema/beans"    
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"    
     xmlns:context="http://www.springframework.org/schema/context"    
    xsi:schemaLocation="http://www.springframework.org/schema/beans     
  http://www.springframework.org/schema/beans/spring-beans-2.5.xsd    
  http://www.springframework.org/schema/context     
  http://www.springframework.org/schema/context/spring-context-2.5.xsd">    
     <context:component-scan base-package="cn.tekin"/>    
 </beans>    
```
 这里，所有通过 <bean> 元素定义 Bean 的配置内容已经被移除，仅需要添加一行 <context:component-scan/> 配置就解决所有问题了——Spring XML 配置文件得到了极致的简化（当然配置元数据还是需要的，只不过以注释形式存在罢了）。<context:component-scan/> 的 base-package 属性指定了需要扫描的类包，类包及其递归子包中所有的类都会被处理。    
 <context:component-scan/> 还允许定义过滤器将基包下的某些类纳入或排除。Spring 支持以下 4 种类型的过滤方式，通过下表说明：    
 表 1. 扫描过滤方式    
 过滤器类型 说明     
 注释 假如 cn.tekin.SomeAnnotation 是一个注释类，我们可以将使用该注释的类过滤出来。     
 类名指定 通过全限定类名进行过滤，如您可以指定将 cn.tekin.Boss 纳入扫描，而将 cn.tekin.Car 排除在外。     
 正则表达式 通过正则表达式定义过滤的类，如下所示： com\.baobaotao\.Default.*     
 AspectJ 表达式 通过 AspectJ 表达式定义过滤的类，如下所示： com. baobaotao..*Service+     
 下面是一个简单的例子：     
 <context:component-scan base-package="cn.tekin">    
     <context:include-filter type="regex"     
         expression="com\.baobaotao\.service\..*"/>    
     <context:exclude-filter type="aspectj"     
         expression="cn.tekin.util..*"/>    
 </context:component-scan>    
 值得注意的是 <context:component-scan/> 配置项不但启用了对类包进行扫描以实施注释驱动 Bean 定义的功能，同时还启用了注释驱动自动注入的功能（即还隐式地在内部注册了 AutowiredAnnotationBeanPostProcessor 和 CommonAnnotationBeanPostProcessor），因此当使用 <context:component-scan/> 后，就可以将 <context:annotation-config/> 移除了。    
 默认情况下通过 @Component 定义的 Bean 都是 singleton 的，如果需要使用其它作用范围的 Bean，可以通过 @Scope 注释来达到目标，如以下代码所示：    
24. 通过 @Scope 指定 Bean 的作用范围    
```java
 package cn.tekin;    
 import org.springframework.context.annotation.Scope;    
 …    
 @Scope("prototype")    
 @Component("boss")    
 public class Boss {    
     …    
 }  
```  
这样，当从 Spring 容器中获取 boss Bean 时，每次返回的都是新的实例了。  
  注释配置和 XML 配置的适用场合  
  是否有了这些 IOC 注释，我们就可以完全摒除原来 XML 配置的方式呢？答案是否定的。有以下几点原因：  
  
  注释配置不一定在先天上优于 XML 配置。如果 Bean 的依赖关系是固定的，（如 Service 使用了哪几个 DAO 类），这种配置信息不会在部署时发生调整，那么注释配置优于 XML 配置；反之如果这种依赖关系会在部署时发生调整，XML 配置显然又优于注释配置，因为注释是对 Java 源代码的调整，您需要重新改写源代码并重新编译才可以实施调整。   
  如果 Bean 不是自己编写的类（如 JdbcTemplate、SessionFactoryBean 等），注释配置将无法实施，此时 XML 配置是唯一可用的方式。   
  
  注释配置往往是类级别的，而 XML 配置则可以表现得更加灵活。比如相比于 @Transaction 事务注释，使用 aop/tx 命名空间的事务配置更加灵活和简单。   
  所以在实现应用中，我们往往需要同时使用注释配置和 XML 配置，对于类级别且不会发生变动的配置可以优先考虑注释配置；而对于那些第三方类以及容易发生调整的配置则应优先考虑使用 XML 配置。Spring 会在具体实施 Bean 创建和 Bean 注入之前将这两种配置方式的元信息融合在一起。
  
### 小结  

  Spring 在 2.1 以后对注释配置提供了强力的支持，注释配置功能成为 Spring 2.5 的最大的亮点之一。合理地使用 Spring 2.5 的注释配置，可以有效减少配置的工作量，提高程序的内聚性。但是这并不意味着传统 XML 配置将走向消亡，在第三方类 Bean 的配置，以及那些诸如数据源、缓存池、持久层操作模板类、事务管理等内容的配置上，XML 配置依然拥有不可替代的地位。


##  @Transactional 使用详解

### @Transactional之value

    value这里主要用来指定不同的事务管理器；主要用来满足在同一个系统中，存在不同的事务管理器。比如在Spring中，声明了两种事务管理器txManager1, txManager2.

然后，用户可以根据这个参数来根据需要指定特定的txManager.

   那有同学会问什么情况下会存在多个事务管理器的情况呢？ 比如在一个系统中，需要访问多个数据源或者多个数据库，则必然会配置多个事务管理器的。

###  @Transactional之propagation

      Propagation支持7种不同的传播机制：

 - REQUIRED
    业务方法需要在一个事务中运行,如果方法运行时,已处在一个事务中,那么就加入该事务,否则自己创建一个新的事务.这是spring默认的传播行为.。 
 
  - SUPPORTS： 
    如果业务方法在某个事务范围内被调用,则方法成为该事务的一部分,如果业务方法在事务范围外被调用,则方法在没有事务的环境下执行。
    
  - MANDATORY：
    只能在一个已存在事务中执行,业务方法不能发起自己的事务,如果业务方法在没有事务的环境下调用,就抛异常
 - REQUIRES_NEW
             业务方法总是会为自己发起一个新的事务,如果方法已运行在一个事务中,则原有事务被挂起,新的事务被创建,直到方法结束,新事务才结束,原先的事务才会恢复执行.
  - NOT_SUPPORTED
           声明方法需要事务,如果方法没有关联到一个事务,容器不会为它开启事务.如果方法在一个事务中被调用,该事务会被挂起,在方法调用结束后,原先的事务便会恢复执行.
 - NEVER：
              声明方法绝对不能在事务范围内执行,如果方法在某个事务范围内执行,容器就抛异常.只有没关联到事务,才正常执行.
 -  NESTED：
          如果一个活动的事务存在,则运行在一个嵌套的事务中.如果没有活动的事务,则按 - REQUIRED属性执行.它使用了一个单独的事务, 这个事务拥有多个可以回滚的保证点.内部事务回滚不会对外部事务造成影响, 它只对DataSourceTransactionManager 事务管理器起效.

     其实大家最感到困惑的是REQUIRED_NEW和NESTED两种不同的传播机制，功能类似，都涉及到了事务嵌套的问题，那两者有何区别呢？该如何正确使用这两种模式呢？

以下是摘自Spring的文档：

PROPAGATION_REQUIRES_NEW : uses a completely independent transaction for each affected transaction scope. In that case, the underlying physical transactions are different and hence can commit or roll back independently, with an outer transaction not affected by an inner transaction's rollback status.


内部的事务独立运行，在各自的作用域中，可以独立的回滚或者提交；而外部的事务将不受内部事务的回滚状态影响。 

ROPAGATION_NESTED : uses a single physical transaction with multiple savepoints that it can roll back to. Such partial rollbacks allow an inner transaction scope to trigger a rollback for its scope, with the outer transaction being able to continue the physical transaction despite some operations having been rolled back. This setting is typically mapped onto JDBC savepoints, so will only work with JDBC resource transactions.

NESTED的事务，基于单一的事务来管理，提供了多个保存点。这种多个保存点的机制允许内部事务的变更触发外部事务的回滚。而外部事务在混滚之后，仍能继续进行事务处理，即使部分操作已经被混滚。 由于这个设置基于JDBC的保存点，所以只能工作在JDBC的机制智商。

由此可知， 两者都是事务嵌套，不同之处在于，内外事务之间是否存在彼此之间的影响；NESTED之间会受到影响，而产生部分回滚，而REQUIRED_NEW则是独立的。

