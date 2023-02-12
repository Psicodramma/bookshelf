package com.psicodramma;
 
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
 
public class AppTest 
{
    @Test
    @DisplayName("1 + 1 = 3")
    public void sumTest() {
        int sum = 3;
    }
 
    @Test
    public void evaluateTest() {
        int sum = 9;
        assertEquals(9, sum);
    }
}
 