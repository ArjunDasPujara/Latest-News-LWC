/*
	@Auther          :     Arjun Das
	@BuiltDate       :     27 JUN 2022
	@ModifiedBy      :     Arjun Das
	@ModifiedDate    :     19 Aug 2022
	@Description     :     A controller for get requreid data for latestNews LWC component.
*/

public class LatestNewsController {
	/*
	 * This Method is used to get the available category
	 * @return LatestNewsController.NewsCategory Wapper.
	 */
	@AuraEnabled
	public static List<LatestNewsController.NewsCategory> getNewsCategory() {
		List<LatestNewsController.NewsCategory> newsCategoryList = new List<LatestNewsController.NewsCategory>();
		
		try {
			List<News_Category__mdt> newCatogryList = News_Category__mdt.getAll().values();
	
			for(News_Category__mdt newsCategory : newCatogryList) {
				LatestNewsController.NewsCategory newsCategoryVar = new LatestNewsController.NewsCategory();
				newsCategoryVar.label = newsCategory.MasterLabel;
				newsCategoryVar.value = newsCategory.DeveloperName;
				newsCategoryList.add(newsCategoryVar);
			}
		} catch(Exception exp) {
			throw new AuraHandledException(exp.getMessage());
		}
		return newsCategoryList;
	}

	/**
	 * NewsCategory Wapper
	 */
	public class NewsCategory {
		@AuraEnabled
		public String label {get; set;}

		@AuraEnabled
		public String value {get; set;}
	}
}