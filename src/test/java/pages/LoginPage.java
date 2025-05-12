package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;
import base.BasePage;

public class LoginPage extends BasePage{
	
	
	@FindBy(xpath = "//input[@id='un']")
	@CacheLookup
	private WebElement username;
	@FindBy(xpath = "//input[@id='pw']")
	@CacheLookup
	private WebElement password;
	@FindBy(xpath = "//input[@value='Sign In']")
	@CacheLookup
	private WebElement signIn;
	
	
	
	public LoginPage(WebDriver driver) {
		super(driver);

	}

	public void login(String userName, String Password) {

		// username.click();
		
		username.sendKeys(userName);
		password.sendKeys(Password);
		signIn.click();

	}
	
	public String expectedHomePageTitle() {
		
		
	 String homePageExpectedTitlePage = "Dashboard - Employee Recruitment System";
		
		return homePageExpectedTitlePage;
		
		
	}

}
