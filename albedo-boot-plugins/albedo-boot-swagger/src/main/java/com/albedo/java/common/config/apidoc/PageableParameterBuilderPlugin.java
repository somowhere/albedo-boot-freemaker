package com.albedo.java.common.config.apidoc;

import com.albedo.java.util.domain.PageModel;
import com.fasterxml.classmate.ResolvedType;
import com.fasterxml.classmate.TypeResolver;
import com.google.common.base.Function;
import com.google.common.collect.Lists;
import org.springframework.data.domain.Pageable;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.schema.ModelReference;
import springfox.documentation.schema.ResolvedTypes;
import springfox.documentation.schema.TypeNameExtractor;
import springfox.documentation.service.Parameter;
import springfox.documentation.service.ResolvedMethodParameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.schema.contexts.ModelContext;
import springfox.documentation.spi.service.OperationBuilderPlugin;
import springfox.documentation.spi.service.contexts.OperationContext;
import springfox.documentation.spi.service.contexts.ParameterContext;

import java.lang.reflect.Type;
import java.util.Iterator;
import java.util.List;

public class PageableParameterBuilderPlugin implements OperationBuilderPlugin {
    private final TypeNameExtractor nameExtractor;
    private final TypeResolver resolver;
    private final ResolvedType pageableType;

    public PageableParameterBuilderPlugin(TypeNameExtractor nameExtractor, TypeResolver resolver) {
        this.nameExtractor = nameExtractor;
        this.resolver = resolver;
        this.pageableType = resolver.resolve(PageModel.class, new Type[0]);
    }

    public boolean supports(DocumentationType delimiter) {
        return DocumentationType.SWAGGER_2.equals(delimiter);
    }

    public void apply(OperationContext context) {
        List<Parameter> parameters = Lists.newArrayList();
        Iterator var3 = context.getParameters().iterator();

        while(var3.hasNext()) {
            ResolvedMethodParameter methodParameter = (ResolvedMethodParameter)var3.next();
            ResolvedType resolvedType = methodParameter.getParameterType();
            if (this.pageableType.equals(resolvedType)) {
                ParameterContext parameterContext = new ParameterContext(methodParameter, new ParameterBuilder(), context.getDocumentationContext(), context.getGenericsNamingStrategy(), context);
                parameters.add(this.createPageParameter(parameterContext));
                parameters.add(this.createSizeParameter(parameterContext));
                parameters.add(this.createConditionParameter(parameterContext));
                parameters.add(this.createSortParameter(parameterContext));
                context.operationBuilder().parameters(parameters);
            }
        }

    }

    protected String getPageName() {
        return "page";
    }

    protected String getSizeName() {
        return "size";
    }

    protected String getSortName() {
        return "sortName";
    }
    protected String getQueryConditionJson() {
        return "queryConditionJson";
    }


    protected Parameter createPageParameter(ParameterContext context) {
        ModelReference intModel = this.createModelRefFactory(context).apply(this.resolver.resolve(Integer.TYPE, new Type[0]));
        return (new ParameterBuilder()).name(this.getPageName()).parameterType("query").modelRef(intModel)
            .description("页码").build();
    }

    protected Parameter createSizeParameter(ParameterContext context) {
        ModelReference intModel = this.createModelRefFactory(context).apply(this.resolver.resolve(Integer.TYPE, new Type[0]));
        return (new ParameterBuilder()).name(this.getSizeName()).parameterType("query").modelRef(intModel)
            .description("分页条数").build();
    }
    //sortName: notice desc
    protected Parameter createSortParameter(ParameterContext context) {
        ModelReference stringModel = this.createModelRefFactory(context).apply(this.resolver.resolve(String.class, new Type[0]));
        return (new ParameterBuilder()).name(this.getSortName()).parameterType("query").modelRef(stringModel)
            .allowMultiple(true).description("格式: property (asc|desc). 默认 升序.").build();
    }

    protected Parameter createConditionParameter(ParameterContext context) {
        ModelReference stringModel = this.createModelRefFactory(context).apply(this.resolver.resolve(String.class, new Type[0]));
        return (new ParameterBuilder()).name(this.getQueryConditionJson()).parameterType("query").modelRef(stringModel)
            .allowMultiple(true).description("查询json [{\"fieldName\":\"orgId\",\"attrType\":\"String\",\"operate\":\"like\",\"value\":\"a\"}]").build();
    }

    protected Function<ResolvedType, ModelReference> createModelRefFactory(ParameterContext context) {
        ModelContext modelContext = ModelContext.inputParam(context.getGroupName(), context.resolvedMethodParameter().getParameterType(), context.getDocumentationType(), context.getAlternateTypeProvider(), context.getGenericNamingStrategy(), context.getIgnorableParameterTypes());
        return ResolvedTypes.modelRefFactory(modelContext, this.nameExtractor);
    }

    TypeResolver getResolver() {
        return this.resolver;
    }

    TypeNameExtractor getNameExtractor() {
        return this.nameExtractor;
    }
}
