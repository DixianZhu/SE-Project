package Project;

import java.io.*;

public class Search {
	static int process = 4;
	static int node = 14;
	static int serviceTypeNumber = 14;
	static int eachTypeServiceNumber = 500;
	static int serviceItemsNumber = 5;
	static int[] processMark;
	static boolean[][] searchNode;
	static boolean[] markService;
	static double[] stability;
	static double[] cost;
	static double[] serviceStability;
	static double[] serviceCost;

	public Search() {
		Search.searchNode = new boolean[Search.process][Search.node];
		Search.stability = new double[Search.process];
		Search.cost = new double[Search.process];
		Search.serviceStability = new double[Search.eachTypeServiceNumber
				* Search.serviceTypeNumber];
		Search.serviceCost = new double[Search.eachTypeServiceNumber
				* Search.serviceTypeNumber];
		Search.markService = new boolean[Search.node*Search.eachTypeServiceNumber];
	    Search.processMark = new int[process];
	}

	private static void GetData() {
		String routeP = "D:/SE/Lab1-data/PROCESS.txt";
		String routeR = "D:/SE/Lab1-data/REQ.txt";
		String routeS = "D:/SE/Lab1-data/SERVICE.txt";

		try {
			FileInputStream FI = new FileInputStream(routeP);
			BufferedReader BF = new BufferedReader(new InputStreamReader(FI));
			String tempString = null;
			int line = 0;
			while ((tempString = BF.readLine()) != null) {
				for (int i = 0; i < tempString.length(); i++) {
					int tempMark = (int) (tempString.charAt(i) - 'A');
					if (tempMark < Search.node && tempMark >= 0 && Search.searchNode[line][tempMark] == false) {
						Search.searchNode[line][tempMark] = true;
						Search.processMark[line]++;
					}
				}
				line++;
			}
			BF.close();
			FI.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

		}

		try {
			FileInputStream FI = new FileInputStream(routeR);
			BufferedReader BF = new BufferedReader(new InputStreamReader(FI));
			String tempString = null;
			int line = 0;
			while ((tempString = BF.readLine()) != null) {
				for (int i = 0; i < tempString.length(); i++) {
					String temp = null;
					temp = tempString.substring(1, 4); // For a certain format
					double dTemp = Double.parseDouble(temp);
					Search.stability[line] = dTemp;
					temp = tempString.substring(5, 7);
					dTemp = Double.parseDouble(temp);
					Search.cost[line] = dTemp;
				}
				line++;
			}
			BF.close();
			FI.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

		}

		try {
			FileInputStream FI = new FileInputStream(routeS);
			BufferedReader BF = new BufferedReader(new InputStreamReader(FI));
			String tempString = null;
			String wholeString = "";
			int tempNum = Search.serviceTypeNumber
					* Search.eachTypeServiceNumber * Search.serviceItemsNumber;
			String[] tempService = new String[tempNum + 1];
			while ((tempString = BF.readLine()) != null) {
				wholeString = wholeString.concat(tempString);
			}
			tempService = wholeString.split(" ");
			int indexStability = 0;
			int indexCost = 0;
			for (int i = 0; i < tempNum; i++) {
				if (i % 5 == 2) {
					Search.markService[indexStability] = true;
					Search.serviceStability[indexStability++] = Double
							.parseDouble(tempService[i]);
				}
				if (i % 5 == 4) {
					Search.serviceCost[indexCost++] = Double
							.parseDouble(tempService[i]);
				}
			}
			BF.close();
			FI.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

		}
	}

	// This function is created to make sure the data I read in the memory is
	// correct.
	private static void WatchData() throws IOException {
		int i, j;
		for (i = 0; i < Search.process; i++) {
			System.out.print(i);
			System.out.println("  case");
			System.out.print("Stability : ");
			System.out.println(Search.stability[i]);
			System.out.print("Cost : ");
			System.out.println(Search.cost[i]);
			for (j = 0; j < Search.node; j++) {
				if (Search.searchNode[i][j]) {
					System.out.print((char) (j + 'A'));
					System.out.println("  marked");
				}
			}
		}
		File fo = new File("D:/SE/Lab1-data/out.txt");
		BufferedWriter BW = new BufferedWriter(new FileWriter(fo));
		for (i = 0; i < Search.serviceTypeNumber * Search.eachTypeServiceNumber; i++) {
			if (Search.serviceCost[i] < 80) {
				BW.write((char) ((i / 500) + 'A'));
				BW.write("-");
				BW.write(Integer.toString((i % 500) + 1));
				BW.write(": Stability = ");
				BW.write(Double.toString(Search.serviceStability[i]));
				BW.write("  cost = ");
				BW.write(Double.toString(Search.serviceCost[i]));
				BW.write("\r\n");
			}
		}
		BW.close();
	}
	
    private static void GetAnswer(){
    	for(int i=Search.process-1;i>=0;i--){
    		for(int j=0;j<Search.node;j++){
    			if(Search.searchNode[i][j]){
    				for(int k=j*500;k<j*500+500;k++){
    					if(Search.markService[k]){
    						if(Search.cost[i]-Search.processMark[i]+1<=Search.serviceCost[k]){
    							Search.markService[k] = false;
    							
    						}
    					}
    				}
    			}
    		}

    	}
    }
    
	public static void main(String[] args) throws IOException {
		new Search();
		GetData();
		//WatchData();
		GetAnswer();
	}
}
