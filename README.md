# springmvc_mybatis_demo
Spring web mvc 5.x mybatis 3.4.x JAVA 10.01 dbcp2 pool2 整合演示

---

- 本项目所有的版本全部采用官方最新稳定版本


## build.gradle配置文件

```xml
plugins {
    id 'java'
    id 'war'
}

group = 'cn.tekin'
version = '1.0-SNAPSHOT'

description = "mybatis spring web mvc integeration, jdk10 springmvc 5.x"

sourceCompatibility = 10
targetCompatibility = 10

repositories {
    mavenCentral()
}

dependencies {
    compile group: 'org.mybatis', name: 'mybatis-spring', version:'1.3.2'
    compile group: 'org.mybatis', name: 'mybatis', version:'3.4.6'
    compile group: 'org.apache.commons', name: 'commons-pool2', version:'2.5.0'
    compile group: 'org.apache.commons', name: 'commons-dbcp2', version:'2.3.0'
    compile group: 'org.springframework', name: 'spring-dao', version:'2.0.8'
    compile group: 'org.springframework', name: 'spring-tx', version:'5.0.6.RELEASE'
    compile group: 'org.springframework', name: 'spring-jdbc', version:'5.0.6.RELEASE'
    compile group: 'mysql', name: 'mysql-connector-java', version:'5.1.46'
    testCompile group: 'org.springframework', name: 'spring-context', version:'5.0.6.RELEASE'
    testCompile group: 'junit', name: 'junit', version:'4.12'
}


/**
 * xml文件放到了非 resources文件夹下的情况必须定义打包需要包含的xml文件
 * maper/*.xml 表示gradle的资源文件夹 打包时 包含 mapper 文件夹下的所有 xml配置文件
 * resources文件夹下的资源文件无需定义，自动包含到打包文件中
 */
sourceSets.main.resources.includes = [ "**/mapper/*.xml" ]

```



---

[tekin](http://tekin.yunna.ws)
