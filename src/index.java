import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.NumericField;
import org.apache.lucene.index.FieldInfo.IndexOptions;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

/**
 * This class demonstrate the process of creating index with Lucene for text
 * files
 */
public class index {
	private static long count=0;
	public static void main() throws Exception {
		// indexDir is the directory that hosts Lucene's index files
		File indexDir = new File("D:\\luceneIndex");
		// dataDir is the directory that hosts the text files that to be indexed
		File dataDir = new File("D:\\luceneData");
		Analyzer luceneAnalyzer = new SmartChineseAnalyzer(Version.LUCENE_36);
		Directory dir = FSDirectory.open(indexDir);
		IndexWriterConfig iwc = new IndexWriterConfig(Version.LUCENE_36,
				luceneAnalyzer);
		IndexWriter indexWriter = new IndexWriter(dir, iwc);
		long startTime = new Date().getTime();
		indexDocs(indexWriter, dataDir);

		// NOTE: if you want to maximize search performance,
		// you can optionally call forceMerge here. This can be
		// a terribly costly operation, so generally it's only
		// worth it when your index is relatively static (ie
		// you're done adding documents to it):
		//
		// writer.forceMerge(1);

		indexWriter.close();
		long endTime = new Date().getTime();

		System.out.println("It takes " + (endTime - startTime)
				+ " milliseconds to create index for the files in directory "
				+ dataDir.getPath());
		System.out.println(count+" files");
	}

	static void indexDocs(IndexWriter writer, File file) throws IOException {
		// do not try to index files that cannot be read
		if (file.canRead()) {
			if (file.isDirectory()) {
				String[] files = file.list();
				// an IO error could occur
				if (files != null) {
					for (int i = 0; i < files.length; i++) {
						indexDocs(writer, new File(file, files[i]));
					}
				}
			} else {
				count++;
				FileInputStream fis;
				try {
					fis = new FileInputStream(file);
				} catch (FileNotFoundException fnfe) {
					// at least on windows, some temporary files raise this
					// exception with an "access denied" message
					// checking if the file can be read doesn't help
					return;
				}

				try {

					// make a new, empty document
					Document doc = new Document();

					// Add the path of the file as a field named "path". Use a
					// field that is indexed (i.e. searchable), but don't
					// tokenize
					// the field into separate words and don't index term
					// frequency
					// or positional information:
					Field pathField = new Field("path", file.getPath(),
							Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS);
					pathField.setIndexOptions(IndexOptions.DOCS_ONLY);
					doc.add(pathField);

					// Add the last modified date of the file a field named
					// "modified".
					// Use a NumericField that is indexed (i.e. efficiently
					// filterable with
					// NumericRangeFilter). This indexes to milli-second
					// resolution, which
					// is often too fine. You could instead create a number
					// based on
					// year/month/day/hour/minutes/seconds, down the resolution
					// you require.
					// For example the long value 2011021714 would mean
					// February 17, 2011, 2-3 PM.
					NumericField modifiedField = new NumericField("modified");
					modifiedField.setLongValue(file.lastModified());
					doc.add(modifiedField);
					// Add the contents of the file to a field named "contents".
					// Specify a Reader,
					// so that the text of the file is tokenized and indexed,
					// but not stored.
					// Note that FileReader expects the file to be in UTF-8
					// encoding.
					// If that's not the case searching for special characters
					// will fail.
					BufferedReader br=new BufferedReader(
							new InputStreamReader(fis, "UTF-8"));
					String tempContent="";
					String tempTitle="";
					String line = "";
					if((line = br.readLine()) != null){
						tempTitle=line;
					}
					while ((line = br.readLine()) != null) {
						tempContent=tempContent+line; 
					}
					Field contentField = new Field("content", tempContent,
							Field.Store.YES, Field.Index.ANALYZED);		
					doc.add(contentField);
					Field titleField = new Field("title", tempTitle,
							Field.Store.YES, Field.Index.ANALYZED);		
					doc.add(titleField);
					if (writer.getConfig().getOpenMode() == OpenMode.CREATE) {
						// New index, so we just add the document (no old
						// document can be there):
						System.out.println("adding " + file);
						writer.addDocument(doc);
					} else {
						// Existing index (an old copy of this document may have
						// been indexed) so
						// we use updateDocument instead to replace the old one
						// matching the exact
						// path, if present:
						System.out.println("updating " + file);
						writer.updateDocument(new Term("path", file.getPath()),
								doc);
					}
					br.close();

				} finally {
					fis.close();
					
				}
			}
		}
	}

}
