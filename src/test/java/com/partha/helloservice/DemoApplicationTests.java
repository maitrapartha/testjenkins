package com.partha.helloservice;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
class DemoApplicationTests {

	@Test
	void contextLoads() {
		DemoApplication.main(new String[]{});
		String somethingToTest = "somethingToTest";
		assertEquals("somethingToTest", somethingToTest);
	}

}
