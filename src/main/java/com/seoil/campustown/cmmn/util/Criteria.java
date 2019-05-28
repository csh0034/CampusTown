package com.seoil.campustown.cmmn.util;

import lombok.ToString;

@ToString
public class Criteria {

	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;
	private int category;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 8;
	}

	public void setPage(int page) {

		if (page <= 0) {
			this.page = 1;
			return;
		}

		this.page = page;
	}

	public int getPage() {
		return page;
	}

	public void setPerPageNum(int perPageNum) {

		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}

		this.perPageNum = perPageNum;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}
}
