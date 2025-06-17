package stepdefination;

import base.Basefactory;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.opentelemetry.exporter.logging.SystemOutLogRecordExporter;
import org.openqa.selenium.By;

import java.io.IOException;
import java.util.Properties;

public class StepDefination extends Basefactory {
    public static Properties props;
    @Given("I Launch Browser")
    public void i_launch_browser(){
        // Write code here that turns the phrase above into concrete actions
        try {
            Basefactory.setUp();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


    @Then("I open URL")
    public void iOpenURL() {
        Basefactory.navigateToURL();
    }



    @And("I login using Username as {string}")
    public void iLoginUsingUsernameAs(String userName) {
        try {
            props= propertiesLoad();
            System.out.println(" props value"+props.getProperty(userName));


            driver.findElement(By.id("un")).sendKeys(props.getProperty(userName));

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @And("I login using Password as {string}")
    public void iLoginUsingPasswordAs(String Password) {
    }
}
