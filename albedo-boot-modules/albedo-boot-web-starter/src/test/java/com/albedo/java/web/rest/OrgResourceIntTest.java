package com.albedo.java.web.rest;

import com.albedo.java.AlbedoBootWebApp;
import com.albedo.java.common.config.AlbedoProperties;
import com.albedo.java.common.persistence.DynamicSpecifications;
import com.albedo.java.common.persistence.SpecificationDetail;
import com.albedo.java.common.persistence.domain.BaseEntity;
import com.albedo.java.modules.sys.domain.Org;
import com.albedo.java.modules.sys.service.OrgService;
import com.albedo.java.modules.sys.web.OrgResource;
import com.albedo.java.util.Json;
import com.albedo.java.util.base.Reflections;
import com.albedo.java.util.domain.QueryCondition;
import com.albedo.java.vo.sys.OrgVo;
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
 * Test class for the OrgResource REST controller.
 *
 * @see OrgResource
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = AlbedoBootWebApp.class)
public class OrgResourceIntTest {

    private String DEFAULT_API_URL;

    private static final String DEFAULT_NAME = "AAAAAAAAAA";
    private static final String UPDATED_NAME = "BBBBBBBBBB";

    private static final String DEFAULT_CODE = "AAAAAAAAAA";
    private static final String UPDATED_CODE = "BBBBBBBBBB1";

    private static final String DEFAULT_EN = "AAAAAAAAAA";
    private static final String UPDATED_EN = "BBBBBBBBBB";

    private static final String DEFAULT_TYPE = "AAAAAAAAAA";
    private static final String UPDATED_TYPE = "BBBBBBBBBB";

    private static final int DEFAULT_SORT = 1;
    private static final int UPDATED_SORT = 2;

    private static final String DEFAULT_GRADE = "AAAAAAAAAA";
    private static final String UPDATED_GRADE = "BBBBBBBBBB";

    private static final String DEFAULT_PARENTID = "AAAAAAAAAA";
    private static final String UPDATED_PARENTID = "BBBBBBBBBB";


    private static final String DEFAULT_DESCRIPTION = "AAAAAAAAAA";
    private static final String UPDATED_DESCRIPTION = "BBBBBBBBBB";

    @Autowired
    private OrgService orgService;

    @Autowired
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

//    @Autowired
//    private PageableHandlerMethodArgumentResolver pageableArgumentResolver;

    @Autowired
    private ExceptionTranslator exceptionTranslator;


    @Autowired
    private AlbedoProperties albedoProperties;

    private MockMvc restOrgMockMvc;

    private Org org;

    @Before
    public void setup() {
        DEFAULT_API_URL = albedoProperties.getAdminPath("/sys/org/");
        MockitoAnnotations.initMocks(this);
        final OrgResource orgResource = new OrgResource(orgService);
        this.restOrgMockMvc = MockMvcBuilders.standaloneSetup(orgResource)
            .addPlaceholderValue("albedo.adminPath", albedoProperties.getAdminPath())
//            .setCustomArgumentResolvers(pageableArgumentResolver)
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
    public static Org createEntity() {
        Org org = Reflections.createObj(Org.class, Lists.newArrayList(
            Org.F_NAME, Org.F_CODE, Org.F_SORT, Org.F_TYPE, Org.F_PARENTID, Org.F_EN, Org.F_GRADE, Org.F_DESCRIPTION
        ), DEFAULT_NAME, DEFAULT_CODE,DEFAULT_SORT,DEFAULT_TYPE,DEFAULT_PARENTID,DEFAULT_EN,DEFAULT_GRADE,DEFAULT_DESCRIPTION);
        return org;
    }

    @Before
    public void initTest() {
        org = createEntity();
    }

    @Test
    @Transactional
    public void createOrg() throws Exception {
        long databaseSizeBeforeCreate = orgService.findAll().size();
        OrgVo orgVo = orgService.copyBeanToVo(org);
        // Create the Org
        restOrgMockMvc.perform(post(DEFAULT_API_URL+"edit")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(orgVo)))
            .andExpect(status().isOk());
        ;
        long databaseSizeAfterCreate = orgService.findAll().size();
        assertThat(databaseSizeBeforeCreate).isEqualTo(databaseSizeAfterCreate - 1);
        SpecificationDetail<Org> orgSpecificationDetail = new SpecificationDetail<>();
        orgSpecificationDetail.orderASC(Org.F_CREATEDDATE);
        // Validate the Org in the database new Sort(Sort.Direction.ASC, Org.F_CREATEDDATE)
        List<Org> orgList = orgService.findAll(orgSpecificationDetail);
        Org testOrg = orgList.get(orgList.size() - 1);
        assertThat(testOrg.getName()).isEqualTo(DEFAULT_NAME);
        assertThat(testOrg.getCode()).isEqualTo(DEFAULT_CODE);
        assertThat(testOrg.getEn()).isEqualTo(DEFAULT_EN);
        assertThat(testOrg.getGrade()).isEqualTo(DEFAULT_GRADE);
        assertThat(testOrg.getType()).isEqualTo(DEFAULT_TYPE);
        assertThat(testOrg.getParentId()).isEqualTo(DEFAULT_PARENTID);
        assertThat(testOrg.getSort()).isEqualTo(DEFAULT_SORT);
        assertThat(testOrg.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
    }

    @Test
    @Transactional
    public void createOrgWithExistingCode() throws Exception {
        orgService.save(org);
        int databaseSizeBeforeCreate = orgService.findAll().size();

        // Create the Org with an existing ID
        OrgVo orgVo = Reflections.createObj(OrgVo.class, Lists.newArrayList(OrgVo.F_ID, OrgVo.F_CODE),
            null, org.getCode());

        // An entity with an existing ID cannot be created, so this API call must fail
        restOrgMockMvc.perform(post(DEFAULT_API_URL+"edit")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(orgVo)))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.status").value(equalTo(2)))
            .andExpect(jsonPath("$.statusName").value(equalToIgnoringCase("MSG_TYPE_WARNING")));

        // Validate the Org in the database
        List<Org> orgList = orgService.findAll();
        assertThat(orgList).hasSize(databaseSizeBeforeCreate);
    }

    @Test
    @Transactional
    public void checkNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = orgService.findAll().size();
        // set the field null
        org.setName(null);

        // Create the Org, which fails.

        restOrgMockMvc.perform(post(DEFAULT_API_URL+"edit")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(org)))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.status").value(equalTo(2)))
            .andExpect(jsonPath("$.statusName").value(equalToIgnoringCase("MSG_TYPE_WARNING")));

        List<Org> orgList = orgService.findAll();
        assertThat(orgList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void getAllOrgs() throws Exception {
        // Initialize the database
        orgService.save(org);

        // Get all the orgList
        restOrgMockMvc.perform(get(DEFAULT_API_URL+"page"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.data.[*].id").value(hasItem(org.getId())))
            .andExpect(jsonPath("$.data.[*].name").value(hasItem(DEFAULT_NAME.toString())))
            .andExpect(jsonPath("$.data.[*].code").value(hasItem(DEFAULT_CODE.toString())))
            .andExpect(jsonPath("$.data.[*].en").value(hasItem(DEFAULT_EN.toString())))
            .andExpect(jsonPath("$.data.[*].type").value(hasItem(DEFAULT_TYPE.toString())))
            .andExpect(jsonPath("$.data.[*].grade").value(hasItem(DEFAULT_GRADE.toString())))
            .andExpect(jsonPath("$.data.[*].sort").value(hasItem(DEFAULT_SORT)))
            .andExpect(jsonPath("$.data.[*].description").value(hasItem(DEFAULT_DESCRIPTION.toString())));
    }

    @Test
    @Transactional
    public void getOrg() throws Exception {
        // Initialize the database
        orgService.save(org);

        // Get the org
        restOrgMockMvc.perform(get(DEFAULT_API_URL+"{id}", org.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.data.id").value(org.getId()))
            .andExpect(jsonPath("$.data.name").value(DEFAULT_NAME.toString()))
            .andExpect(jsonPath("$.data.code").value(DEFAULT_CODE.toString()))
            .andExpect(jsonPath("$.data.en").value(DEFAULT_EN.toString()))
            .andExpect(jsonPath("$.data.type").value(DEFAULT_TYPE.toString()))
            .andExpect(jsonPath("$.data.grade").value(DEFAULT_GRADE.toString()))
            .andExpect(jsonPath("$.data.sort").value(DEFAULT_SORT))
            .andExpect(jsonPath("$.data.description").value(DEFAULT_DESCRIPTION.toString()));
    }

    @Test
    @Transactional
    public void getAllOrgsBySortIsEqualToSomething() throws Exception {
        // Initialize the database
        orgService.save(org);

        // Get all the orgList where sort equals to DEFAULT_SORT
        defaultOrgShouldBeFound(QueryCondition.eq(Org.F_SORT, DEFAULT_SORT));

        // Get all the orgList where sort equals to UPDATED_SORT
        defaultOrgShouldNotBeFound(QueryCondition.eq(Org.F_SORT, UPDATED_SORT));
    }

    @Test
    @Transactional
    public void getAllOrgsBySortIsInShouldWork() throws Exception {
        // Initialize the database
        orgService.save(org);

        // Get all the orgList where sort in DEFAULT_SORT or UPDATED_SORT
        defaultOrgShouldBeFound(QueryCondition.in(Org.F_SORT, Lists.newArrayList(DEFAULT_SORT, UPDATED_SORT)));

        // Get all the orgList where sort equals to UPDATED_SORT
        defaultOrgShouldNotBeFound(QueryCondition.in(Org.F_SORT, Lists.newArrayList(UPDATED_SORT)));
    }

    @Test
    @Transactional
    public void getAllOrgsBySortIsNullOrNotNull() throws Exception {
        // Initialize the database
        orgService.save(org);

        // Get all the orgList where sort is not null
        defaultOrgShouldBeFound(QueryCondition.isNotNull(Org.F_SORT));

        // Get all the orgList where sort is null
        defaultOrgShouldNotBeFound(QueryCondition.isNull(Org.F_SORT));
    }

    @Test
    @Transactional
    public void getAllOrgsBySortIsGreaterThanOrEqualToSomething() throws Exception {
        // Initialize the database
        orgService.save(org);

        // Get all the orgList where sort greater than or equals to DEFAULT_SORT
        defaultOrgShouldBeFound(QueryCondition.eq(Org.F_ID, org.getId()), QueryCondition.ge(Org.F_SORT, DEFAULT_SORT));

        // Get all the orgList where sort greater than or equals to UPDATED_SORT
        defaultOrgShouldNotBeFound(QueryCondition.eq(Org.F_ID, org.getId()), QueryCondition.ge(Org.F_SORT, UPDATED_SORT));
    }

    @Test
    @Transactional
    public void getAllOrgsBySortIsLessThanSomething() throws Exception {
        // Initialize the database
        orgService.save(org);

        // Get all the orgList where sort less than or equals to DEFAULT_SORT
        defaultOrgShouldNotBeFound(QueryCondition.eq(Org.F_ID, org.getId()), QueryCondition.lt(Org.F_SORT, DEFAULT_SORT));

        // Get all the orgList where sort less than or equals to UPDATED_SORT
        defaultOrgShouldBeFound(QueryCondition.eq(Org.F_ID, org.getId()), QueryCondition.lt(Org.F_SORT, UPDATED_SORT));
    }


    @Test
    @Transactional
    public void getAllOrgsByDescptionIsEqualToSomething() throws Exception {
        // Initialize the database
        orgService.save(org);

        // Get all the orgList where descption equals to DEFAULT_DESCPTION
        defaultOrgShouldBeFound(QueryCondition.eq(Org.F_DESCRIPTION, DEFAULT_DESCRIPTION));

        // Get all the orgList where descption equals to UPDATED_DESCPTION
        defaultOrgShouldNotBeFound(QueryCondition.eq(Org.F_DESCRIPTION, UPDATED_DESCRIPTION));
    }

    @Test
    @Transactional
    public void getAllOrgsByDescptionIsInShouldWork() throws Exception {
        // Initialize the database
        orgService.save(org);

        // Get all the orgList where descption in DEFAULT_DESCPTION or UPDATED_DESCPTION
        defaultOrgShouldBeFound(QueryCondition.in(Org.F_DESCRIPTION, Lists.newArrayList(DEFAULT_DESCRIPTION, UPDATED_DESCRIPTION)));

        // Get all the orgList where descption equals to UPDATED_DESCPTION
        defaultOrgShouldNotBeFound(QueryCondition.in(Org.F_DESCRIPTION, Lists.newArrayList(UPDATED_DESCRIPTION)));
    }

    @Test
    @Transactional
    public void getAllOrgsByDescptionIsNullOrNotNull() throws Exception {
        // Initialize the database
        orgService.save(org);
        ;
        // Get all the orgList where descption is not null
        defaultOrgShouldBeFound(QueryCondition.isNotNull(Org.F_DESCRIPTION));

        // Get all the orgList where descption is null
        defaultOrgShouldNotBeFound(QueryCondition.eq(Org.F_ID, org.getId()), QueryCondition.isNull(Org.F_DESCRIPTION));
    }
    /**
     * Executes the search, and checks that the default entity is returned
     */
    private void defaultOrgShouldBeFound(QueryCondition... queryCondition) throws Exception {
        restOrgMockMvc.perform(get(DEFAULT_API_URL+"page").param("queryConditionJson", Json.toJSONString(Lists.newArrayList(queryCondition))))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.data").isArray())
            .andExpect(jsonPath("$.data.[*].id").value(hasItem(org.getId())))
            .andExpect(jsonPath("$.data.[*].name").value(hasItem(DEFAULT_NAME.toString())))
            .andExpect(jsonPath("$.data.[*].code").value(hasItem(DEFAULT_CODE.toString())))
            .andExpect(jsonPath("$.data.[*].en").value(hasItem(DEFAULT_EN.toString())))
            .andExpect(jsonPath("$.data.[*].type").value(hasItem(DEFAULT_TYPE.toString())))
            .andExpect(jsonPath("$.data.[*].grade").value(hasItem(DEFAULT_GRADE.toString())))
            .andExpect(jsonPath("$.data.[*].sort").value(hasItem(DEFAULT_SORT)))
            .andExpect(jsonPath("$.data.[*].description").value(hasItem(DEFAULT_DESCRIPTION.toString())));
    }

    /**
     * Executes the search, and checks that the default entity is not returned
     */
    private void defaultOrgShouldNotBeFound(QueryCondition... queryCondition) throws Exception {
        restOrgMockMvc.perform(get(DEFAULT_API_URL+"page").param("queryConditionJson", Json.toJSONString(Lists.newArrayList(queryCondition))))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.data").isArray())
            .andExpect(jsonPath("$.data").isEmpty());
    }


    @Test
    @Transactional
    public void getNonExistingOrg() throws Exception {
        // Get the org
        restOrgMockMvc.perform(get(DEFAULT_API_URL+"{id}", Long.MAX_VALUE))
            .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateOrg() throws Exception {
//        orgService.deleteAll();
        // Initialize the database
        orgService.save(org);
        List<Org> all = orgService.findAll();
        long databaseSizeBeforeUpdate = orgService.findAll().size();

        // Update the org
        Org updatedOrg = orgService.findOne(org.getId());
        // Disconnect from session so that the updates on updatedOrg are not directly saved in db
//        em.detach(updatedOrg);
        Reflections.updateObj(updatedOrg, Lists.newArrayList(
            Org.F_NAME, Org.F_CODE, Org.F_SORT, Org.F_TYPE, Org.F_PARENTID, Org.F_EN, Org.F_GRADE, Org.F_DESCRIPTION
        ), UPDATED_NAME, UPDATED_CODE,UPDATED_SORT,UPDATED_TYPE,UPDATED_PARENTID,UPDATED_EN,UPDATED_GRADE,UPDATED_DESCRIPTION);

        OrgVo orgVo = orgService.copyBeanToVo(updatedOrg);
        restOrgMockMvc.perform(post(DEFAULT_API_URL+"edit")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(orgVo)))
            .andExpect(status().isOk());

        // Validate the Org in the database
        List<Org> orgList = orgService.findAll();
        long databaseSizeAfterUpdate = orgService.findAll().size();
        assertThat(databaseSizeAfterUpdate).isEqualTo(databaseSizeBeforeUpdate);


        Org testOrg = orgList.stream().filter(item->org.getId().equals(item.getId())).findAny().get();
        assertThat(testOrg.getName()).isEqualTo(UPDATED_NAME);
        assertThat(testOrg.getCode()).isEqualTo(UPDATED_CODE);
        assertThat(testOrg.getSort()).isEqualTo(UPDATED_SORT);
        assertThat(testOrg.getType()).isEqualTo(UPDATED_TYPE);
        assertThat(testOrg.getParentId()).isEqualTo(UPDATED_PARENTID);
        assertThat(testOrg.getEn()).isEqualTo(UPDATED_EN);
        assertThat(testOrg.getGrade()).isEqualTo(UPDATED_GRADE);
        assertThat(testOrg.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
    }


    @Test
    @Transactional
    public void deleteOrg() throws Exception {
        // Initialize the database
        orgService.save(org);
        SpecificationDetail<Org> spec = DynamicSpecifications.bySearchQueryCondition(
            QueryCondition.ne(BaseEntity.F_STATUS, BaseEntity.FLAG_DELETE));
//        spec.setPersistentClass(Org.class);
        long databaseSizeBeforeDelete = orgService.findAll(spec).size();

        // Get the org
        restOrgMockMvc.perform(post(DEFAULT_API_URL+"delete/{id}", org.getId())
            .accept(TestUtil.APPLICATION_JSON_UTF8))
            .andExpect(status().isOk());

        // Validate the database is empty
        long databaseSizeAfterDelete = orgService.findAll(spec).size();
        assertThat(databaseSizeBeforeDelete).isEqualTo(databaseSizeAfterDelete+1);
    }

    @Test
    @Transactional
    public void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(Org.class);
        Org org1 = new Org();
        org1.setId("id1");
        Org org2 = new Org();
        org2.setId(org1.getId());
        assertThat(org1).isEqualTo(org2);
        org2.setId("id2");
        assertThat(org1).isNotEqualTo(org2);
        org1.setId(null);
        assertThat(org1).isNotEqualTo(org2);
    }
}
