package examples.macfit.runner;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate login() {
        return Karate.run( "../login/login").relativeTo(getClass());
    }

    @Karate.Test()
    Karate profile() {
        return Karate.run("../profile/profile").relativeTo(getClass());
    }     


    @Karate.Test()
    Karate caller() {
        return Karate.run("../caller/loginCaller").relativeTo(getClass());
    }
    
    @Karate.Test()
    Karate members() {
        return Karate.run("../members/members").relativeTo(getClass());
    }      
    @Karate.Test()
    Karate activity() {
        return Karate.run("../activity/activity").relativeTo(getClass());
    }     

    @Karate.Test
    Karate runAllTests() {
        return Karate.run(
                "../profile/profile",
               "../members/members",
               "../activity/activity"
        ).relativeTo(getClass());
    }
}

