function thresh = estimate_thresh(adaptor):
if adaptor.mult
    thresh = exp(mean(log(estimate_list(adaptor))))
else
    thresh = mean(estimate_list(adatpor))
end