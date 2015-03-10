function thresh = estimate_sd(adaptor):
if adaptor.mult
    thresh = exp(std(log(estimate_list(adaptor))))
else
    thresh = std(estimate_list(adatpor))
end