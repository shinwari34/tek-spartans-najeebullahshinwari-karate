package runner;

public class TestRunner {

    @Karate.Test
    Karate runTest() {
        return Karate
                .run("classpath:features")
                .karateEnv("dev")
                .tags("@End2EndAccount");
    }
}
