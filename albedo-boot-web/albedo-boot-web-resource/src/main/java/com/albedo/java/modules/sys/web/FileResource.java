package com.albedo.java.modules.sys.web;

import com.albedo.java.common.config.AlbedoProperties;
import com.albedo.java.common.security.SecurityUtil;
import com.albedo.java.modules.sys.domain.FileData;
import com.albedo.java.modules.sys.service.FileDataService;
import com.albedo.java.util.BeanVoUtil;
import com.albedo.java.util.base.Assert;
import com.albedo.java.vo.sys.FileDataResultVo;
import com.albedo.java.vo.sys.FileDataVo;
import com.albedo.java.web.rest.ResultBuilder;
import com.albedo.java.web.rest.base.BaseResource;
import com.google.common.collect.Lists;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * @author somewhere
 */
@Controller
@RequestMapping(value = "${albedo.adminPath}/file")
public class FileResource extends BaseResource {

    private final AlbedoProperties albedoProperties;
    private final FileDataService fileDataService;

    public FileResource(AlbedoProperties albedoProperties, FileDataService fileDataService) {
        this.albedoProperties = albedoProperties;
        this.fileDataService = fileDataService;
    }

    /**
     * @param files
     * @return
     */
    /**
     * @param files
     * @return
     */
    @ApiOperation(value = "文件上传", response = FileDataResultVo.class)
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ResponseEntity upload(@RequestParam("uploadFile") MultipartFile[] files) {
        String directory = albedoProperties.getStaticFileDirectory();
        String dir = mkdirs(directory);
        List<FileData> fileDataList = Lists.newLinkedList();FileData fileData;
        for (int i = 0; i < files.length; i++) {
            String originalFilename = files[i].getOriginalFilename();
            String extension = FilenameUtils.getExtension(originalFilename);
            String fileName = new StringBuilder().append(dir).append(UUID.randomUUID().toString().replaceAll("-", "")).append(".")
                .append(extension).toString();
            try {
                FileCopyUtils.copy(files[i].getBytes(), new FileOutputStream(fileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            fileData = new FileData();
            fileData.setName(originalFilename);
            fileData.setPath(fileName.replace(directory, ""));
            fileData.setSize(files[i].getSize());
            fileData.setType(extension);
            fileDataList.add(fileData);
        }
        fileDataService.save(fileDataList);
        return ResultBuilder.buildDataOk(fileDataList.stream()
            .map(item->BeanVoUtil.copyPropertiesByClass(item, FileDataResultVo.class)).collect(Collectors.toList()));
    }

    /**
     * @param response
     * @param id
     */
    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    public void get(HttpServletResponse response, @PathVariable String id) {
        FileData fileData = fileDataService.findOne(id);
        Assert.assertIsTrue(fileData!=null, "无法获取文件信息");
        try {
            String path = albedoProperties.getStaticFileDirectory(fileData.getPath());
            File file = FileUtils.getFile(path);
            byte[] bytes = FileCopyUtils.copyToByteArray(file);
            String contentType = new MimetypesFileTypeMap().getContentType(file);
            response.setContentType(contentType);
            response.setHeader("Content-disposition", "attachment; filename=\"" + fileData.getName() + "\"");
            FileCopyUtils.copy(bytes, response.getOutputStream());
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }
//    /**
//     * @param files
//     * @return
//     */
//    @RequestMapping(value = "/upload", method = RequestMethod.POST)
//    public ResponseEntity upload(@RequestParam("uploadFile") MultipartFile[] files) {
//        List<String> fileList = new LinkedList<>();
//        String directory = SecurityUtil.albedoProperties.getStaticFileDirectory();
//        String dir = mkdirs(directory);
//
//        for (int i = 0; i < files.length; i++) {
//            String fileName = new StringBuilder().append(dir).append(UUID.randomUUID().toString().replaceAll("-", "")).append(".")
//                    .append(FilenameUtils.getExtension(files[i].getOriginalFilename())).toString();
//            try {
//                FileCopyUtils.copy(files[i].getBytes(), new FileOutputStream(fileName));
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//
//            fileList.add(fileName.replaceAll(directory, ""));
//        }
//        return ResultBuilder.buildDataOk(StringUtils.join(fileList, ","));
//    }
//
    private String mkdirs(String directory) {
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH) + 1;
        int day = now.get(Calendar.DAY_OF_MONTH);
        String dir = new StringBuilder().append(directory).append("/").append(year).append("/").append(month).append("/").append(day).append("/").toString();
        File file = new File(dir);
        if (!file.exists()) {
            file.mkdirs();
        }
        return dir;
    }
//
//    /**
//     * @param response
//     * @param year
//     * @param month
//     * @param day
//     * @param fileName
//     */
//    @RequestMapping(value = "/get/{year}/{month}/{day}/{fileName:.+}", method = RequestMethod.GET)
//    public void get(HttpServletResponse response, @PathVariable String year, @PathVariable String month, @PathVariable String day, @PathVariable String fileName) {
//        try {
//            String directory = SecurityUtil.albedoProperties.getStaticFileDirectory();
//            String dir = new StringBuilder().append(directory).append("/").append(year).append("/").append(month).append("/").append(day).toString();
//            File file = FileUtils.getFile(dir, fileName);
//            byte[] bytes = FileCopyUtils.copyToByteArray(file);
//            String contentType = new MimetypesFileTypeMap().getContentType(file);
//            response.setContentType(contentType);
//            response.setHeader("Content-disposition", "attachment; filename=\"" + file.getName() + "\"");
//            FileCopyUtils.copy(bytes, response.getOutputStream());
//        } catch (IOException e) {
//            logger.error(e.getMessage());
//        }
//    }
}
