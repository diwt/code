package com.kaishengit.util;

import java.util.Arrays;

import org.apache.commons.codec.digest.DigestUtils;

public class CheckUtil {
	private static final String token="kaishengit";
	public static boolean checkSignature(String signature,String timestamp,String nonce,String echostr){
		String[]arr = new String[]{token,timestamp,nonce};
		//����
		Arrays.sort(arr);
		
		//�����ַ���
		StringBuffer content = new StringBuffer();
		for (int i = 0; i < arr.length; i++) {
			content.append(arr[i]);
		}
		//sha1����
		String temp = DigestUtils.sha1Hex(content.toString());
		return temp.equals(signature);
		
	}
}
