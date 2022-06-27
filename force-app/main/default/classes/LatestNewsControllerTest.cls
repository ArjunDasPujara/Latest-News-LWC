@isTest
private class LatestNewsControllerTest {

	@isTest
	static void testgetNewsCategory_returnListOfCategorys() {
		//When
		List<LatestNewsController.NewsCategory> NewsCategoryList = LatestNewsController.getNewsCategory();
		
		//Then
		System.assert(NewsCategoryList.size() > 0);
	}
}