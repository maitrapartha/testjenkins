package com.partha.helloservice.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = HelloController.class)
public class HelloControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testResource_available() throws Exception {
        MvcResult mvcResult = mockMvc.perform(
                get("/greeting")
        ).andExpect(
                status().isOk()
        ).andReturn();
        assertTrue(mvcResult.getResponse().getContentAsString().equals("welcome"));
    }
}
