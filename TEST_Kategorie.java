package start;

import static org.junit.Assert.assertEquals;

import java.util.LinkedList;

import org.junit.Test;

public class TEST_Kategorie {

	Kategorie kt = new Kategorie("Kirche","strasse", "nummer", 12334, "ansprechpartner", "tel_ansprechpartner", "website", "kommentar","kinder,priester,menschen");
	
	@Test
	public void test_getTraeger() {
		assertEquals("Kirche",kt.getTraeger());
	}
	
	@Test
	public void test_getTagsZerlegung()
	{
		LinkedList<String> dummy = new LinkedList<String>();
		dummy.add("kinder");
		dummy.add("priester");
		dummy.add("menschen");
		for(int i = 0; i < dummy.size(); ++i)
		{
			assertEquals(dummy.get(i),kt.getTagsZerlegung().get(i));		
		}
	}

}
