#没通过稳健性检验的
adf.test(diff(X$工业生产者出厂价格指数.上年同月.100._当期))
adf.test(diff(X$货币和准货币.M2._期末同比增速))
adf.test(diff(X$进出口总额.美元._当期同比增速))
adf.test(diff(X$人民币兑美元期末汇率))
adf.test(diff(X$进口商品价格指数.上年同月.100._当期))
adf.test(diff(X$国房景气指数_当期))
adf.test(diff(X$社会融资规模增量_当期))
adf.test(diff(X$社会融资规模增量_人民币贷款_当期))
adf.test(diff(X$社会融资规模增量_外币贷款.折合人民币._当期))

#协整检验
jj <- ca.jo(dsdata_sub, type = c("eigen", "trace"), ecdet = c("none", "const", "trend"), K = 2,spec=c("longrun", "transitory"), season = NULL, dumvar = NULL)
summary(jj)