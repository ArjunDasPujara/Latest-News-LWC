import { LightningElement, track } from 'lwc';
import getNewsCategorys from '@salesforce/apex/LatestNewsController.getNewsCategory';
import READ_MORE from '@salesforce/label/c.ReadMoreLink';
import SOMTHING_WENT_WRONG_ERROR from '@salesforce/label/c.SomethingWentWrongPleaseTryAgainError';

const API_URL = 'https://inshorts.deta.dev/news?category=';

export default class LatestNews extends LightningElement {
	
	category = 'all';
	isLoding = true;
	isContentReady = false;
	isError = false;
	isLinkTypeText = true;
	
	allnews = [];
	options = [];

	labels = {
		READ_MORE,
		SOMTHING_WENT_WRONG_ERROR
	}

	async connectedCallback() {
		await this.getNewsCategorys();
		await this.getDataFromAPI();
	}

	async getDataFromAPI() {
		let newsData = await fetch(
			this.api_url_for_call, {
			method: "GET",
			headers: {
				"Content-Type": "application/json",
				}
			}
		).then((response) => {
				return response.json();
		}).catch(() => {
			this.isError = true;
		});

		this.allnews = newsData.data.map((news) => {
			return {
				author: news.author,
				imageUrl: news.imageUrl,
				readMoreUrl: news.readMoreUrl,
				title: news.title,
				content: news.content,
			}
		});

		let topDiv = this.template.querySelector('.news-box')
		if(topDiv) {
			topDiv.scrollTop = 0;
		}

		if(!this.isError) {
			this.isContentReady = true;
		}
		this.isLoding = false;
	}

	async getNewsCategorys() {
		getNewsCategorys().then(result => {
			this.options = [...result];
		}).catch(() => {
			this.isError = true;
		});
	}

	handleCategoryChange(event) {
		this.isLoding = true;
		this.category = event.detail.value;
		this.getDataFromAPI();
	}

	handleLinkClick() {
		this.isLoding = true;
		this.getDataFromAPI();
	}

	get api_url_for_call() {
		return API_URL + this.category;
	}
}