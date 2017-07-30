package com.mall.test.wx;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.omg.CORBA.Object;

public class DateTest {

	public List getNearlyYear() throws ParseException {
		java.util.Date date = new java.util.Date();
		
		String str1 = "2017-07-01";
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(format1.parse(str1));
		
		// -----------------------------------------------------------------
		// 当前月，年
		int monthTemp = date.getMonth() + 1;
		int yearTemp = date.getYear() + 1900;
		System.out.println(monthTemp);

		// 一年
		// LinkedHashMap按插入顺序的
		int[] yearArr = new int[12];
		int[] monthArr = new int[12];
		String[] concatDateArr = new String[12];
		String[] dateNameArr = new String[12];
		for (int i = 12; i > 0; i--) {
			if (monthTemp <= 0) {
				// 当月份到0时，重置为12，年份-1
				monthTemp = 12;
				yearTemp--;
				yearArr[12 - i] = yearTemp;
				monthArr[12 - i] = monthTemp;
				dateNameArr[12 - i] = yearTemp + "年" + monthTemp + "月";
				monthTemp--;

			} else {
				yearArr[12 - i] = yearTemp;
				monthArr[12 - i] = monthTemp;
				dateNameArr[12 - i] = yearTemp + "年" + monthTemp + "月";
				monthTemp--;

			}
		}
		System.out.println("拼接后的日期");
		for (int i = 0; i < 12; i++) {
			if (monthArr[i] < 10) {
				concatDateArr[i] = yearArr[i] + "-0" + monthArr[i] + "-" + "01";
			} else {
				concatDateArr[i] = yearArr[i] + "-" + monthArr[i] + "-" + "01";
			}
			System.out.println(concatDateArr[i]);
		}

		System.out.println("日期: ");
		for (int i = 0; i < 12; i++) {
			System.out.println(dateNameArr[i]);
		}

		List<String[]> list = new ArrayList<String[]>();
		list.add(0, dateNameArr);
		list.add(1, concatDateArr);

		return list;
	}

	public static void main(String[] args) throws ParseException {
		DateTest dateTest = new DateTest();
		List list = dateTest.getNearlyYear();
	}

}
