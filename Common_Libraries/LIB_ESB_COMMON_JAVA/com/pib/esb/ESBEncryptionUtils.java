package com.pib.esb;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import com.ibm.misc.BASE64Decoder;
import com.ibm.misc.BASE64Encoder;


public class ESBEncryptionUtils {
	private static final String ALGORITHM = "AES";
	private static final byte[] keyValue = 
	    new byte[] { 'T', 'h', 'i', 's', 'I', 's', 'A', 'S', 'e', 'c', 'r', 'e', 't', 'K', 'e', 'y' };

	public static String encrypt(String valueToEnc) {
		SecretKey key = null;
		try {
			key = generateKey();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    Cipher c = null;
		try {
			c = Cipher.getInstance(ALGORITHM);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    try {
			c.init(Cipher.ENCRYPT_MODE, key);
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    byte[] encValue = null;
		try {
			encValue = c.doFinal(valueToEnc.getBytes());
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    String encryptedValue = new BASE64Encoder().encode(encValue);
	    return encryptedValue;
	}

	public static String decrypt(String encryptedValue) {
		SecretKey key = generateKey();
	    Cipher c = null;
		try {
			c = Cipher.getInstance(ALGORITHM);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    try {
			c.init(Cipher.DECRYPT_MODE, key);
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    byte[] decordedValue = null;
		try {
			decordedValue = new BASE64Decoder().decodeBuffer(encryptedValue);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    byte[] decValue = null;
		try {
			decValue = c.doFinal(decordedValue);
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    String decryptedValue = new String(decValue);
	    return decryptedValue;
	}

	private static SecretKey generateKey() {
		SecretKey key = new SecretKeySpec(keyValue, ALGORITHM);
	    return key;
	}



}
