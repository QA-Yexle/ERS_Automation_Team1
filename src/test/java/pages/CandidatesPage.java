package pages;

import base.BasePage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.CacheLookup;
import org.openqa.selenium.support.FindBy;

public class CandidatesPage extends BasePage {

    @FindBy(css ="span[class='SizedText---medium SizedText---predefined']")
    @CacheLookup
    private WebElement candidateTab;

    //Create Candidate details
    @FindBy(xpath = " //*[@class='Button---btn Button---default_direction Button---primary Button---small appian-context-first-in-list appian-context-last-in-list Button---icon_start']']")
    @CacheLookup
    private WebElement createCandidate;

    @FindBy(xpath = "//input[@id='1fde0fed083e5a47a6246d2b2db7a0ac']")
    @CacheLookup
    private WebElement firstName;

    @FindBy(xpath = "//input[@id='98384f36c96f0dee97fa0af7c1d262b3']")
    @CacheLookup
    private WebElement lastName;

    public CandidatesPage(WebDriver driver) {
        super(driver);        //call main
    }
}
