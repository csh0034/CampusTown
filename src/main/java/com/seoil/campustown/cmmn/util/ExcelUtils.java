package com.seoil.campustown.cmmn.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtils {

	// Excel -> List
	public static List<Map<String, Object>> excelToMapList(String filePath) {

		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map;
		String value = "";
		FileInputStream fis = null;
		Workbook workbook = null;
		Sheet curSheet = null;
		Row curRow = null;
		Cell curCell = null;

		try {

			fis = new FileInputStream(filePath);

			if (filePath.toUpperCase().endsWith(".XLS")) {
				workbook = new HSSFWorkbook(fis);
			} else if (filePath.toUpperCase().endsWith(".XLSX")) {
				workbook = new XSSFWorkbook(fis);
			}

			curSheet = workbook.getSheetAt(0);

			for (int rowcount = 0; rowcount <= curSheet.getLastRowNum(); rowcount++) {

				curRow = curSheet.getRow(rowcount);
				map = new HashMap<>();

				if (curRow != null) {

					for (int cellcount = 0; cellcount < curRow.getLastCellNum(); cellcount++) {

						curCell = curRow.getCell(cellcount);

						if (curCell != null) {

							switch (curCell.getCellType()) {
							case Cell.CELL_TYPE_FORMULA:
								value = curCell.getCellFormula();
								break;
							case Cell.CELL_TYPE_NUMERIC:
								value = curCell.getNumericCellValue() + "";
								break;
							case Cell.CELL_TYPE_STRING:
								value = curCell.getStringCellValue() + "";
								break;
							case Cell.CELL_TYPE_BLANK:
								value = curCell.getBooleanCellValue() + "";
								break;
							case Cell.CELL_TYPE_ERROR:
								value = curCell.getErrorCellValue() + "";
								break;
							default:
								value = new String();
								break;
							}

							map.put(CellReference.convertNumToColString(cellcount).toUpperCase(), value);
						}
					}
					list.add(map);
				} else {
					list.add(map);
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	// Excel -> Map
	public static Map<String, Object> excelToMap(String filePath) {

		Map<String, Object> map = new HashMap<>();
		;
		String value = "";
		FileInputStream fis = null;
		Workbook workbook = null;
		Sheet curSheet = null;
		Row curRow = null;
		Cell curCell = null;

		try {

			fis = new FileInputStream(filePath);

			if (filePath.toUpperCase().endsWith(".XLS")) {
				workbook = new HSSFWorkbook(fis);
			} else if (filePath.toUpperCase().endsWith(".XLSX")) {
				workbook = new XSSFWorkbook(fis);
			}

			curSheet = workbook.getSheetAt(0);

			for (int rowcount = 0; rowcount <= curSheet.getLastRowNum(); rowcount++) {

				curRow = curSheet.getRow(rowcount);

				if (curRow != null) {

					for (int cellcount = 0; cellcount < curRow.getLastCellNum(); cellcount++) {

						curCell = curRow.getCell(cellcount);

						if (curCell != null) {

							switch (curCell.getCellType()) {
							case Cell.CELL_TYPE_FORMULA:
								value = curCell.getCellFormula();
								break;
							case Cell.CELL_TYPE_NUMERIC:
								value = curCell.getNumericCellValue() + "";
								break;
							case Cell.CELL_TYPE_STRING:
								value = curCell.getStringCellValue() + "";
								break;
							case Cell.CELL_TYPE_BLANK:
								value = curCell.getBooleanCellValue() + "";
								break;
							case Cell.CELL_TYPE_ERROR:
								value = curCell.getErrorCellValue() + "";
								break;
							default:
								value = new String();
								break;
							}

							map.put(CellReference.convertNumToColString(cellcount).toUpperCase() + (rowcount + 1),
									value);
						}
					}
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

}
