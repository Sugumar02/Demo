package com.pib.esb;

public class ESBCommonUtils {

	public static String getEnvVar(final String envVariable) 
	{
		try {

			final String relativeDirectoryPath = System.getenv(envVariable);
		
			return relativeDirectoryPath;

		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
	}
}
