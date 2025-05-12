package base;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;

import java.io.FileReader;
import java.io.IOException;
import java.time.Duration;
import java.util.Properties;

public class Basefactory {

    public static WebDriver driver;

    public static String filePath = ".\\src\\test\\resources\\config.properties";

    public static FileReader reader;

    public static Properties props;


    public static WebDriver setUp() throws IOException {

        propertiesLoad();

        String BROWSER = props.getProperty("browser");
        System.out.println("Launching "+BROWSER+" Browser");

        if(BROWSER.equalsIgnoreCase("Chrome")){
            driver = new ChromeDriver();
        } else if (BROWSER.equalsIgnoreCase("Edge")) {
            driver = new EdgeDriver();
        }else System.out.println("Browser supports only 'Chrome' and 'Edge' ");


        return driver;
    }

    public static WebDriver navigateToURL() {

        driver.get(props.getProperty("ERS_Test_URL"));
        // driver.manage().timeouts().pageLoadTimeout(Duration.ofMillis(30));
        driver.manage().timeouts().implicitlyWait(Duration.ofMillis(25));
        driver.manage().window().maximize();

        return driver;

    }


    public static void propertiesLoad() throws IOException {

        props = new Properties();
        reader = new FileReader(filePath);
        props.load(reader);

    }

    public static WebDriver getdriver() {
        return driver;

    }

    public static void tearDown() {
    	
    	driver.close();
    	
    }
    

}
