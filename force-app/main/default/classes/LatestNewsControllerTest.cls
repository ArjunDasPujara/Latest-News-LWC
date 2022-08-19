/*
	@Auther          :     Arjun Das
	@BuiltDate       :     27 JUN 2022
	@ModifiedBy      :     Arjun Das
	@ModifiedDate    :     27 JUN 2022
	@Description     :     Test class for LatestNewsController
*/
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