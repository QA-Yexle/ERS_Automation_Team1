package stepdefinition;

import java.io.IOException;

import base.Basefactory;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import junit.framework.Assert;
import pages.LoginPage;

public class StepDefinition {

	//WebDriver driver;
	
	public LoginPage loginpage;
	
	String userName = "";
	String password = "";
	

	@Given("Launch the Browser")
	public void launch_the_browser() throws IOException {
	    
		Basefactory.setUp();
	}

	@When("Navigate to ERS Login page")
	public void navigate_to_ers_login_page() {
		Basefactory.navigateToURL();
	}

	@When("Enter valid username and Valid password for login")
	public void enter_valid_username_and_valid_password() {
		
		loginpage = new LoginPage(Basefactory.getdriver());

		userName = Basefactory.props.getProperty("ERS_recruiterUsername1");
		password = Basefactory.props.getProperty("ERS_recruiterUsername1_password");

		System.out.println("Username is -> " + userName + "Password is -> " + password);
		loginpage.login(userName, password);

	}

	@SuppressWarnings("deprecation")
	@Then("I validate the homepage title")
	public void i_validate_the_homepage_title() throws InterruptedException {
		Thread.sleep(3000);
		loginpage = new LoginPage(Basefactory.getdriver());
		
		String actualHomePageTitle=Basefactory.getdriver().getTitle();
		
		Assert.assertEquals(loginpage.expectedHomePageTitle(), actualHomePageTitle);
		
	}


}
