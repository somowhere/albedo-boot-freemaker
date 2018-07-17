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
    public static final String DEFAULT_PAGE_NAME = "page";
    public static final String PAGE_TYPE = "query";
    public static final String PAGE_DESCRIPTION = "Page number of the requested page";
    public static final String DEFAULT_SIZE_NAME = "size";
    public static final String SIZE_TYPE = "query";
    public static final String SIZE_DESCRIPTION = "Size of a page";
    public static final String DEFAULT_SORT_NAME = "sort";
    public static final String SORT_TYPE = "query";
    public static final String SORT_DESCRIPTION = "Sorting criteria in the format: property(,asc|desc). Default sort order is ascending. Multiple sort criteria are supported.";
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
        return "sort";
    }

    protected Parameter createPageParameter(ParameterContext context) {
        ModelReference intModel = (ModelReference)this.createModelRefFactory(context).apply(this.resolver.resolve(Integer.TYPE, new Type[0]));
        return (new ParameterBuilder()).name(this.getPageName()).parameterType("query").modelRef(intModel).description("Page number of the requested page").build();
    }

    protected Parameter createSizeParameter(ParameterContext context) {
        ModelReference intModel = (ModelReference)this.createModelRefFactory(context).apply(this.resolver.resolve(Integer.TYPE, new Type[0]));
        return (new ParameterBuilder()).name(this.getSizeName()).parameterType("query").modelRef(intModel).description("Size of a page").build();
    }

    protected Parameter createSortParameter(ParameterContext context) {
        ModelReference stringModel = (ModelReference)this.createModelRefFactory(context).apply(this.resolver.resolve(List.class, new Type[]{String.class}));
        return (new ParameterBuilder()).name(this.getSortName()).parameterType("query").modelRef(stringModel).allowMultiple(true).description("Sorting criteria in the format: property(,asc|desc). Default sort order is ascending. Multiple sort criteria are supported.").build();
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
