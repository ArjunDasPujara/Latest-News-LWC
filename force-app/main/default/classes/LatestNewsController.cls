/*
	@Auther          :     Arjun Das
	@BuiltDate       :     27 JUN 2022
	@ModifiedBy      :     Arjun Das
	@ModifiedDate    :     27 JUN 2022
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
		List<News_Category__mdt> newCatogryList = [
			SELECT MasterLabel,
				DeveloperName
			FROM News_Category__mdt
			ORDER BY MasterLabel
		];

		for(News_Category__mdt newsCategory : newCatogryList) {
			LatestNewsController.NewsCategory newsCategoryVar = new LatestNewsController.NewsCategory();
			newsCategoryVar.label = newsCategory.MasterLabel;
			newsCategoryVar.value = newsCategory.DeveloperName;
			newsCategoryList.add(newsCategoryVar);
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
