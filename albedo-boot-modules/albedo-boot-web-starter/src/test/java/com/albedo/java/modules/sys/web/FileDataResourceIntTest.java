/**
 * Copyright &copy; 2018 <a href="https://github.com/somewhereMrli/albedo-boot">albedo-boot</a> All rights reserved.
 */
package com.albedo.java.modules.sys.web;

import com.albedo.java.common.config.AlbedoProperties;
import com.albedo.java.common.persistence.DynamicSpecifications;
import com.albedo.java.common.persistence.SpecificationDetail;
import com.albedo.java.common.persistence.domain.BaseEntity;
import com.albedo.java.modules.sys.domain.FileData;
import com.albedo.java.modules.sys.repository.FileDataRepository;
import com.albedo.java.modules.sys.service.FileDataService;
import com.albedo.java.util.Json;
import com.albedo.java.util.base.Reflections;
import com.albedo.java.util.domain.QueryCondition;
import com.albedo.java.vo.sys.FileDataVo;
import com.albedo.java.web.rest.ExceptionTranslator;
import com.albedo.java.web.rest.TestUtil;
import com.baomidou.mybatisplus.mapper.Condition;
import com.google.common.collect.Lists;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.albedo.java.web.rest.TestUtil.createFormattingConversionService;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Test class for the FileDataResource REST controller.
 *
 * @see FileDataResource
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = com.albedo.java.AlbedoBootWebApp.class)
public class FileDataResourceIntTest {

    private String DEFAULT_API_URL;
	/** DEFAULT_NAME name_  :  名称 */
	private static final String DEFAULT_NAME = "A";
	/** UPDATED_NAME name_  :  名称 */
    private static final String UPDATED_NAME = "B";
	/** DEFAULT_PATH path_  :  路径 */
	private static final String DEFAULT_PATH = "A";
	/** UPDATED_PATH path_  :  路径 */
    private static final String UPDATED_PATH = "B";
	/** DEFAULT_SIZE size_  :  大小 */
	private static final String DEFAULT_SIZE = "A";
	/** UPDATED_SIZE size_  :  大小 */
    private static final String UPDATED_SIZE = "B";
	/** DEFAULT_TYPE type_  :  类型 */
	private static final String DEFAULT_TYPE = "A";
	/** UPDATED_TYPE type_  :  类型 */
    private static final String UPDATED_TYPE = "B";
	/** DEFAULT_DESCRIPTION description_  :  description_ */
	private static final String DEFAULT_DESCRIPTION = "A";
	/** UPDATED_DESCRIPTION description_  :  description_ */
    private static final String UPDATED_DESCRIPTION = "B";

    @Autowired
    private FileDataRepository fileDataRepository;

    @Autowired
    private FileDataService fileDataService;

    @Autowired
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

    @Autowired
    private ExceptionTranslator exceptionTranslator;

    @Autowired
    private AlbedoProperties albedoProperties;

    private MockMvc restFileDataMockMvc;

    private FileData fileData;

    @Before
    public void setup() {
        fileDataRepository.delete(null);
        DEFAULT_API_URL = albedoProperties.getAdminPath("/sys/fileData/");
        MockitoAnnotations.initMocks(this);
        final FileDataResource fileDataResource = new FileDataResource(fileDataService);
        this.restFileDataMockMvc = MockMvcBuilders.standaloneSetup(fileDataResource)
            .addPlaceholderValue("albedo.adminPath", albedoProperties.getAdminPath())
            .setControllerAdvice(exceptionTranslator)
            .setConversionService(createFormattingConversionService())
            .setMessageConverters(jacksonMessageConverter)
            .build();
        SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
        securityContext.setAuthentication(new UsernamePasswordAuthenticationToken("admin", "111111"));
        SecurityContextHolder.setContext(securityContext);
    }

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static FileData createEntity() {
        FileData fileData = Reflections.createObj(FileData.class, Lists.newArrayList(
		 FileData.F_NAME
		,FileData.F_PATH
		,FileData.F_SIZE
		,FileData.F_TYPE
		,FileData.F_DESCRIPTION
        ),

		 DEFAULT_NAME

		,DEFAULT_PATH

		,DEFAULT_SIZE

		,DEFAULT_TYPE






		,DEFAULT_DESCRIPTION

	);
        return fileData;
    }

    @Before
    public void initTest() {
        fileData = createEntity();
    }

    @Test
    @Transactional
    public void createFileData() throws Exception {
        int databaseSizeBeforeCreate = fileDataService.findAll().size();
        FileDataVo fileDataVo = fileDataService.copyBeanToVo(fileData);
        // Create the FileData
        restFileDataMockMvc.perform(post(DEFAULT_API_URL+"edit")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(fileDataVo)))
            .andExpect(status().isOk());
        ;
        // Validate the FileData in the database
        List<FileData> fileDataList = fileDataService.findAll(
            Condition.create().orderBy(FileData.F_CREATEDDATE, true)

        );
        assertThat(fileDataList).hasSize(databaseSizeBeforeCreate + 1);
        FileData testFileData = fileDataList.get(fileDataList.size() - 1);
		assertThat(testFileData.getName()).isEqualTo(DEFAULT_NAME);
		assertThat(testFileData.getPath()).isEqualTo(DEFAULT_PATH);
		assertThat(testFileData.getSize()).isEqualTo(DEFAULT_SIZE);
		assertThat(testFileData.getType()).isEqualTo(DEFAULT_TYPE);
		assertThat(testFileData.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
    }

    @Test
    @Transactional
    public void checkSizeIsRequired() throws Exception {
        int databaseSizeBeforeTest = fileDataService.findAll().size();
        // set the field null
        fileData.setSize(null);

        // Create the FileData, which fails.

        restFileDataMockMvc.perform(post(DEFAULT_API_URL+"edit")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(fileData)))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.status").value(equalTo(2)))
            .andExpect(jsonPath("$.statusName").value(equalToIgnoringCase("MSG_TYPE_WARNING")));


        List<FileData> fileDataList = fileDataService.findAll();
        assertThat(fileDataList).hasSize(databaseSizeBeforeTest);
    }


    @Test
    @Transactional
    public void getAllFileDatas() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList
        restFileDataMockMvc.perform(get(DEFAULT_API_URL+"page"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.data.[*].id").value(hasItem(fileData.getId())))
                    .andExpect(jsonPath("$.data.[*].path").value(hasItem(DEFAULT_PATH)))
                    .andExpect(jsonPath("$.data.[*].type").value(hasItem(DEFAULT_TYPE)))
                                    .andExpect(jsonPath("$.data.[*].description").value(hasItem(DEFAULT_DESCRIPTION)))
        ;
    }

    @Test
    @Transactional
    public void getFileData() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get the fileData
        restFileDataMockMvc.perform(get(DEFAULT_API_URL+"{id}", fileData.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.data.id").value(fileData.getId()))
                    .andExpect(jsonPath("$.data.path").value(DEFAULT_PATH))
                    .andExpect(jsonPath("$.data.type").value(DEFAULT_TYPE))
                                    .andExpect(jsonPath("$.data.description").value(DEFAULT_DESCRIPTION))
        ;
    }
    @Test
    @Transactional
    public void getAllFileDatasByNameIsEqualToSomething() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where name equals to DEFAULT_NAME
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
        QueryCondition.eq(FileData.F_NAME, DEFAULT_NAME)
        );

        // Get all the fileDataList where name equals to UPDATED_NAME
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
        QueryCondition.eq(FileData.F_NAME, UPDATED_NAME)
        );
    }

    @Test
    @Transactional
    public void getAllFileDatasByNameIsInShouldWork() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where name in DEFAULT_NAME or UPDATED_NAME
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
         QueryCondition.in(FileData.F_NAME, Lists.newArrayList(DEFAULT_NAME, DEFAULT_NAME))
        );

        // Get all the fileDataList where name equals to UPDATED_NAME
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
         QueryCondition.in(FileData.F_NAME, Lists.newArrayList(UPDATED_NAME))
        );
    }

    @Test
    @Transactional
    public void getAllFileDatasByNameIsNullOrNotNull() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where name is not null
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()), QueryCondition.isNotNull(FileData.F_NAME));

        // Get all the fileDataList where name is null
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()), QueryCondition.isNull(FileData.F_NAME));
    }
    @Test
    @Transactional
    public void getAllFileDatasByPathIsEqualToSomething() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where path equals to DEFAULT_PATH
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
        QueryCondition.eq(FileData.F_PATH, DEFAULT_PATH)
        );

        // Get all the fileDataList where path equals to UPDATED_PATH
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
        QueryCondition.eq(FileData.F_PATH, UPDATED_PATH)
        );
    }

    @Test
    @Transactional
    public void getAllFileDatasByPathIsInShouldWork() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where path in DEFAULT_PATH or UPDATED_PATH
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
         QueryCondition.in(FileData.F_PATH, Lists.newArrayList(DEFAULT_PATH, DEFAULT_PATH))
        );

        // Get all the fileDataList where path equals to UPDATED_PATH
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
         QueryCondition.in(FileData.F_PATH, Lists.newArrayList(UPDATED_PATH))
        );
    }

    @Test
    @Transactional
    public void getAllFileDatasByPathIsNullOrNotNull() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where path is not null
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()), QueryCondition.isNotNull(FileData.F_PATH));

        // Get all the fileDataList where path is null
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()), QueryCondition.isNull(FileData.F_PATH));
    }
    @Test
    @Transactional
    public void getAllFileDatasByTypeIsEqualToSomething() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where type equals to DEFAULT_TYPE
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
        QueryCondition.eq(FileData.F_TYPE, DEFAULT_TYPE)
        );

        // Get all the fileDataList where type equals to UPDATED_TYPE
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
        QueryCondition.eq(FileData.F_TYPE, UPDATED_TYPE)
        );
    }

    @Test
    @Transactional
    public void getAllFileDatasByTypeIsInShouldWork() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where type in DEFAULT_TYPE or UPDATED_TYPE
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
         QueryCondition.in(FileData.F_TYPE, Lists.newArrayList(DEFAULT_TYPE, DEFAULT_TYPE))
        );

        // Get all the fileDataList where type equals to UPDATED_TYPE
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
         QueryCondition.in(FileData.F_TYPE, Lists.newArrayList(UPDATED_TYPE))
        );
    }

    @Test
    @Transactional
    public void getAllFileDatasByTypeIsNullOrNotNull() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where type is not null
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()), QueryCondition.isNotNull(FileData.F_TYPE));

        // Get all the fileDataList where type is null
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()), QueryCondition.isNull(FileData.F_TYPE));
    }
    @Test
    @Transactional
    public void getAllFileDatasByDescriptionIsEqualToSomething() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where description equals to DEFAULT_DESCRIPTION
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
        QueryCondition.eq(FileData.F_DESCRIPTION, DEFAULT_DESCRIPTION)
        );

        // Get all the fileDataList where description equals to UPDATED_DESCRIPTION
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
        QueryCondition.eq(FileData.F_DESCRIPTION, UPDATED_DESCRIPTION)
        );
    }

    @Test
    @Transactional
    public void getAllFileDatasByDescriptionIsInShouldWork() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where description in DEFAULT_DESCRIPTION or UPDATED_DESCRIPTION
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
         QueryCondition.in(FileData.F_DESCRIPTION, Lists.newArrayList(DEFAULT_DESCRIPTION, DEFAULT_DESCRIPTION))
        );

        // Get all the fileDataList where description equals to UPDATED_DESCRIPTION
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()),
         QueryCondition.in(FileData.F_DESCRIPTION, Lists.newArrayList(UPDATED_DESCRIPTION))
        );
    }

    @Test
    @Transactional
    public void getAllFileDatasByDescriptionIsNullOrNotNull() throws Exception {
        // Initialize the database
        fileDataRepository.insert(fileData);

        // Get all the fileDataList where description is not null
        defaultFileDataShouldBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()), QueryCondition.isNotNull(FileData.F_DESCRIPTION));

        // Get all the fileDataList where description is null
        defaultFileDataShouldNotBeFound(QueryCondition.eq(FileData.F_ID, fileData.getId()), QueryCondition.isNull(FileData.F_DESCRIPTION));
    }

    /**
     * Executes the search, and checks that the default entity is returned
     */
    private void defaultFileDataShouldBeFound(QueryCondition... queryCondition) throws Exception {
        restFileDataMockMvc.perform(get(DEFAULT_API_URL+"page").param("queryConditionJson", Json.toJSONString(Lists.newArrayList(queryCondition))))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.data").isArray())
            .andExpect(jsonPath("$.data.[*].id").value(hasItem(fileData.getId())))
                    .andExpect(jsonPath("$.data.[*].path").value(hasItem(DEFAULT_PATH)))
                    .andExpect(jsonPath("$.data.[*].type").value(hasItem(DEFAULT_TYPE)))
                                    .andExpect(jsonPath("$.data.[*].description").value(hasItem(DEFAULT_DESCRIPTION)))
        ;
    }

    /**
     * Executes the search, and checks that the default entity is not returned
     */
    private void defaultFileDataShouldNotBeFound(QueryCondition... queryCondition) throws Exception {
        restFileDataMockMvc.perform(get(DEFAULT_API_URL+"page").param("queryConditionJson", Json.toJSONString(Lists.newArrayList(queryCondition))))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.data").isArray())
            .andExpect(jsonPath("$.data").isEmpty());
    }


    @Test
    @Transactional
    public void getNonExistingFileData() throws Exception {
        // Get the fileData
        restFileDataMockMvc.perform(get(DEFAULT_API_URL+"{id}", Long.MAX_VALUE))
            .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateFileData() throws Exception {
        // Initialize the database
        fileDataService.save(fileData);

        int databaseSizeBeforeUpdate = fileDataService.findAll().size();

        // Update the fileData
        FileData updatedFileData = fileDataService.findOne(fileData.getId());
        // Disconnect from session so that the updates on updatedFileData are not directly saved in db
        Reflections.updateObj(updatedFileData, Lists.newArrayList(
		 FileData.F_NAME
		,FileData.F_PATH
		,FileData.F_SIZE
		,FileData.F_TYPE
		,FileData.F_DESCRIPTION
        ),

		 UPDATED_NAME

		,UPDATED_PATH

		,UPDATED_SIZE

		,UPDATED_TYPE






		,UPDATED_DESCRIPTION

	);

        FileDataVo fileDataVo = fileDataService.copyBeanToVo(updatedFileData);
        restFileDataMockMvc.perform(post(DEFAULT_API_URL+"edit")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(fileDataVo)))
            .andExpect(status().isOk());

        // Validate the FileData in the database
        List<FileData> fileDataList = fileDataService.findAll();
        assertThat(fileDataList).hasSize(databaseSizeBeforeUpdate);

        FileData testFileData = fileDataList.stream().filter(item->fileData.getId().equals(item.getId())).findAny().get();
		assertThat(testFileData.getName()).isEqualTo(UPDATED_NAME);
		assertThat(testFileData.getPath()).isEqualTo(UPDATED_PATH);
		assertThat(testFileData.getSize()).isEqualTo(UPDATED_SIZE);
		assertThat(testFileData.getType()).isEqualTo(UPDATED_TYPE);
		assertThat(testFileData.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
    }


    @Test
    @Transactional
    public void deleteFileData() throws Exception {
        // Initialize the database
        fileDataService.save(fileData);
        SpecificationDetail<FileData> spec = DynamicSpecifications.bySearchQueryCondition(
            QueryCondition.ne(BaseEntity.F_STATUS, BaseEntity.FLAG_DELETE));
        int databaseSizeBeforeDelete = fileDataService.findAll(spec).size();

        // Get the fileData
        restFileDataMockMvc.perform(post(DEFAULT_API_URL+"delete/{id}", fileData.getId())
            .accept(TestUtil.APPLICATION_JSON_UTF8))
            .andExpect(status().isOk());

        // Validate the database is empty
        List<FileData> fileDataList = fileDataService.findAll(spec);
        assertThat(fileDataList).hasSize(databaseSizeBeforeDelete - 1);
    }

    @Test
    @Transactional
    public void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(FileData.class);
        FileData fileData1 = new FileData();
        fileData1.setId("id1");
        FileData fileData2 = new FileData();
        fileData2.setId(fileData1.getId());
        assertThat(fileData1).isEqualTo(fileData2);
        fileData2.setId("id2");
        assertThat(fileData1).isNotEqualTo(fileData2);
        fileData1.setId(null);
        assertThat(fileData1).isNotEqualTo(fileData2);
    }

}
