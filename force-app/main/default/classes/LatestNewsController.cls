public class LatestNewsController {
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

	public class NewsCategory {
		@AuraEnabled
		public String label {get; set;}

		@AuraEnabled
		public String value {get; set;}
	}
}
