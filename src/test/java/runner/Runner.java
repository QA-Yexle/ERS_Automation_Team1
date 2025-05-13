package runner;


import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"src/test/resources/featureFiles"}
        ,glue={"stepdefinition"},
        monochrome = true,
        plugin = {"pretty",
                "html:target/cucumber-reports/cucumber.html"}
)

public class Runner {


}
