using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks; //urmatoarele pachete sunt deja instalate si se regasesc in folder-ul Ecosia
using NUnit.Framework; //Utilizam NUnit pentru teste
using OpenQA.Selenium; //Selenium WebDriver pentru automatizare pagini de web
using OpenQA.Selenium.Chrome; //Selenium pentru Chrome
using OpenQA.Selenium.Firefox; //" Pentru Firefox
using OpenQA.Selenium.Edge; //" Pentru Edge
//using System.Net.Mail;
//using System.Text;


namespace TestSuite
{
    class Program
    {
        static void Main(string[] args)
        {
        }

        [Test]
        public void Google()
        {
            //AICI INCEPE SA SE RULEZE PRIMUL TEST
            IWebDriver chrome = new ChromeDriver(); //o noua instanta Chrome
            chrome.Manage().Window.Maximize(); //se maximizeaza fereastra
            chrome.Url = "http://ecosia.org"; //navigheaza pe Ecosia
            Console.WriteLine(chrome.Title); //scrie pe consola titlul paginii
            Assert.AreEqual("Ecosia - the search engine that plants trees", chrome.Title); //se asigura ca e corect
            chrome.FindElement(By.Name("q")).SendKeys("is ecosia really planting trees"); //in cautare scrie acest text
            chrome.FindElement(By.Name("q")).SendKeys(OpenQA.Selenium.Keys.Enter); //apasa Enter
            System.Threading.Thread.Sleep(1000); //asteapta ca rezultatele sa se afiseze
            chrome.FindElement(By.PartialLinkText("Unbiased Review")).Click(); //apasa pe linkul acesta
            System.Threading.Thread.Sleep(3000); //asteapta ca pagina sa se afiseze
            chrome.Quit(); //se inchide fereastra
        }

        [Test]

        public void Mozilla()
        {
            IWebDriver firefox = new FirefoxDriver(); //o noua instanta Firefox
            firefox.Manage().Window.Maximize(); //se maximizeaza fereastra
            firefox.Url = "http://ecosia.org"; //navigheaza pe Ecosia
            Console.WriteLine(firefox.Title); //scrie pe consola titlul paginii
            Assert.AreEqual("Ecosia - the search engine that plants trees", firefox.Title); //se asigura ca e corect
            firefox.FindElement(By.Name("q")).SendKeys("is ecosia really planting trees"); //in cautare scrie acest text
            firefox.FindElement(By.Name("q")).SendKeys(OpenQA.Selenium.Keys.Enter); //apasa Enter
            System.Threading.Thread.Sleep(4000); //asteapta ca rezultatele sa se afiseze
            firefox.FindElement(By.PartialLinkText("Unbiased Review")).Click(); //apasa pe linkul acesta
            System.Threading.Thread.Sleep(3000); //asteapta ca pagina sa se afiseze
            firefox.Quit(); //SE INCHIDE FEREASTRA SI SE TERMINA RULAREA TESTELOR

            /*urmatorul cod este dezactivat pentru ca trimiterea unui mail prin smtp
            necesita setarea accesului aplicatiilor mai putin sigure la contul google (altfel error)
            si nu este vizibil spectatorilor :) */
            //SmtpClient client = new SmtpClient();
            //client.Port = 587;
            //client.Host = "smtp.gmail.com";
            //client.EnableSsl = true;
            //client.Timeout = 10000;
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.UseDefaultCredentials = false;
            //client.Credentials = new System.Net.NetworkCredential("testertesting557@gmail.com", "testers1@");
            //MailMessage mail = new MailMessage("testertesting557@gmail.com", "l3vi.sylvester@gmail.com", "Hello coder", "Nice job, all tests ran with no side effects");
            //mail.BodyEncoding = UTF8Encoding.UTF8;
            //mail.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            //client.Send(mail);

            //daca s-a ajuns pana aici, codul urmator trimite un email programatorului ca testele au reusit            
            IWebDriver driver = new ChromeDriver(); //o noua instanta Chrome
            driver.Url = "http://www.gmail.com"; //se deschide google mail
            driver.Manage().Window.Maximize(); //se maximizeaza fereastra
            driver.FindElement(By.Id("identifierId")).Click(); //click pe user
            driver.FindElement(By.Id("identifierId")).Clear(); //sterge daca e scris ceva
            driver.FindElement(By.Id("identifierId")).SendKeys("testertesting557@gmail.com"); //scrie user-ul
            driver.FindElement(By.Id("identifierId")).SendKeys(Keys.Enter); //apasa Enter
            System.Threading.Thread.Sleep(2000); //asteapta ca pagina cu parola sa se afiseze
            driver.FindElement(By.Name("password")).Click(); //click pe campul cu parola
            driver.FindElement(By.Name("password")).Clear(); //sterge daca este scris ceva
            driver.FindElement(By.Name("password")).SendKeys("testers1@"); //scrie parola
            driver.FindElement(By.Name("password")).SendKeys(Keys.Enter); //apasa Enter
            System.Threading.Thread.Sleep(8000); //asteapta ca pagina sa se afiseze corect, cauta si apasa butonul compunere
            driver.FindElement(By.XPath("(.//*[normalize-space(text()) and normalize-space(.)='Sign out'])[1]/following::div[29]")).Click();
            System.Threading.Thread.Sleep(3000); //asteapta sa se afiseze un email nou, si salveaza intr-o variabila campul dorit
            IWebElement to = driver.FindElement(By.XPath("(.//*[normalize-space(text()) and normalize-space(.)='To'])[1]/following::textarea[1]"));
            to.SendKeys("l3vi.sylvester@gmail.com"); //scrie adresa
            to.SendKeys(Keys.Enter); //apasa Enter
            System.Threading.Thread.Sleep(2000); //asteapta sa se salveze mesajul automat in draft, salveaza intr-o variabila campul dorit pentru a scrie mesajul
            IWebElement body = driver.FindElement(By.XPath("(.//*[normalize-space(text()) and normalize-space(.)='Loading rich text...'])[1]/preceding::input[23]"));
            //System.Threading.Thread.Sleep(2000);
            body.SendKeys("Hello coder, nice job, all tests ran with no side effects!"); //scrie un mesaj programatorului
            System.Threading.Thread.Sleep(3000);
            driver.FindElement(By.XPath("// html[1] / body[1] / div[26] / div[1] / div[1] / div[1] / div[1] / div[3] / div[1] / div[1] / div[1] / div[1] / div[1] / div[3] / div[1] / div[1] / div[4] / table[1] / tbody[1] / tr[1] / td[2] / table[1] / tbody[1] / tr[2] / td[1] / div[1] / div[1] / div[4] / table[1] / tbody[1] / tr[1] / td[1] / div[1] / div[2] / div[1]")).Click();
            System.Threading.Thread.Sleep(5000); //in randul de mai sus a dat click pe butonul trimitere, iar pe randul acesta asteapta ca mesajul sa se trimita
            driver.Quit(); //se inchide fereastra
            //AICI SE TERMINA PROGRAMUL
        }

        [Test]

        public void Microsoft()
        {
            IWebDriver edge = new EdgeDriver();  //o noua instanta Edge
            edge.Manage().Window.Maximize(); //se maximizeaza fereastra
            edge.Url = "http://ecosia.org"; //navigheaza pe Ecosia
            Console.WriteLine(edge.Title); //scrie pe consola titlul paginii
            Assert.AreEqual("Ecosia - the search engine that plants trees", edge.Title); //se asigura ca e corect
            edge.FindElement(By.Name("q")).SendKeys("is ecosia really planting trees"); //in cautare scrie acest text
            edge.FindElement(By.Name("q")).SendKeys(OpenQA.Selenium.Keys.Enter); //apasa Enter
            System.Threading.Thread.Sleep(3000); //asteapta ca rezultatele sa se afiseze
            edge.FindElement(By.PartialLinkText("Unbiased Review")).Click(); //apasa pe linkul acesta
            System.Threading.Thread.Sleep(7000); //asteapta ca pagina sa se afiseze
            edge.Quit(); //inchide fereastra
        }
    }
}
