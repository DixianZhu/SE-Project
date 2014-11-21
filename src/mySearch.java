import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.analysis.cn.smart.*;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Scorer;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.QueryScorer;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Formatter;

import com.opensymphony.xwork2.ActionSupport;

public class mySearch extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String passWord;
	private String myQuery;
	private ArrayList<String[]> res = new ArrayList<String[]>();
	public ArrayList<String[]> getRes() {
		return res;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserName() {
		return userName;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getPassWord() {
		return passWord;
	}
	
	public void setMyQuery(String myQuery){
		this.myQuery=myQuery;
	}
	public String getMyQuery(){
		return myQuery;
	}
	public String execute() throws Exception {
		String index = "D:\\luceneIndex";
		IndexReader reader = IndexReader
				.open(FSDirectory.open(new File(index)));
		IndexSearcher searcher = new IndexSearcher(reader);
		Analyzer analyzer = new SmartChineseAnalyzer(Version.LUCENE_36);
		String[] fields = {"title","content"};
		QueryParser parser = new MultiFieldQueryParser(Version.LUCENE_36, fields, analyzer);
		Query query = parser.parse(myQuery);
		System.out.println("Searching for: " + query.toString());
		TopDocs results = searcher.search(query, 100);
		ScoreDoc[] hits = results.scoreDocs;
		int numTotalHits = results.totalHits;
		System.out.println(numTotalHits + " total matching documents");
		//SimpleHTMLFormatter formatter = new SimpleHTMLFormatter("<font color='red'>","</font>");
        //QueryScorer fragmentScore = new QueryScorer(query);
        //Highlighter highlighter = new Highlighter(formatter,fragmentScore);
        //Fragmenter fragmenter = new SimpleFragmenter(100);
        //highlighter.setTextFragmenter(fragmenter);
		for (int i = 0; i < hits.length; i++) {
			Document doc = searcher.doc(hits[i].doc);
			String []temp = new String[3];
			String path = doc.get("path");
			String content = doc.get("content");
			temp[0]=path;
			if (path != null) {
				System.out.println((i + 1) + ". " + path);
				String title = doc.get("title");
				//String highlighterTitle = highlighter.getBestFragment(analyzer, "title", title);
				//String highlighterContent = highlighter.getBestFragment(analyzer, "content", content);
				temp[1]=title;
				temp[2]=content;
				res.add(temp);
				if (title == null) {
					System.out.println("   Title: " + title);
					System.out.println("   Content: " + content);
				}
			} else {
				System.out
						.println((i + 1) + ". " + "No path for this document");
			}
		}
		reader.close();
        searcher.close();
		return SUCCESS;
	}
}