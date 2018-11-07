# Preoperative and postoperative prediction of long-term meningioma outcomes
#
# Efstathios D Gennatas MBBS PhD; egenn.github.io

# [ Libraries ] ====
library(rtemis)

# [ ALL DATA ] ====
men <- readRDS("./Data/meningioma_prepost.rds")
outpath <- "./Results/Multivariate"
dir.create(outpath, recursive = TRUE)

# [ RESAMPLER ] ====
resampler <- rtSet.resampler("strat.sub", 100, seed = 4221)

# [ PREOPERATIVE LF ] ====
# GLM
preop.lf.glm.100ss <- elevate(men$preop.lf, mod = "glm",
                              params = list(upsample = TRUE),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/preop.lf_100ss/preop.lf_glm.100ss"))

# GLMNET
preop.lf.glmnet.100ss <- elevate(men$preop.lf, mod = "glmnet",
                                 params = list(upsample = TRUE),
                                 resampler.rtSet = resampler, save.mods = FALSE,
                                 outdir = paste0(outpath, "/preop.lf_100ss/preop.lf_glmnet.100ss"))

# SVM
preop.lf.svm.100ss <- elevate(men$preop.lf, mod = "svm",
                              params = list(upsample = TRUE,
                                            gamma = c(1/17, 1/17*.1, 1/17*.01)),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/preop.lf_100ss/preop.lf_svm.100ss"))

# CART
preop.lf.cart.100ss <- elevate(men$preop.lf, mod = "cart",
                               params = list(upsample = TRUE, maxdepth = 30,
                                             prune.cp = c(.1, .05, .01)),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/preop.lf_100ss/preop.lf_cart.100ss"))

# MDB
preop.lf.mdb.100ss <- elevate(men$preop.lf, mod = "mdb",
                              params = list(upsample = TRUE,
                                            gamma = seq(.6, 1, .2),
                                            max.depth = 30,
                                            min.hessian = .001),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/preop.lf_100ss/preop.lf_mdb.100ss"))

# RF
preop.lf.rf.100ss <- elevate(men$preop.lf, mod = "ranger",
                             params = list(upsample = TRUE),
                             resampler.rtSet = resampler, save.mods = FALSE,
                             outdir = paste0(outpath, "/preop.lf_100ss/preop.lf_rf.100ss"))

# GBM
preop.lf.gbm.100ss <- elevate(men$preop.lf, mod = "gbm",
                              params = list(upsample = TRUE,
                                            interaction.depth = 1:2,
                                            n.minobsinnode = 2),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/preop.lf_100ss/preop.lf_gbm.100ss"))

# [ CONVENTIONAL LF ] ====
# GLM
postop.lf.glm.100ss <- elevate(men$postop.lf, mod = "glm",
                               params = list(upsample = TRUE),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/postop.lf_100ss/postop.lf_glm.100ss"))

# GLMNET
postop.lf.glmnet.100ss <- elevate(men$postop.lf, mod = "glmnet",
                                  params = list(upsample = TRUE),
                                  resampler.rtSet = resampler, save.mods = FALSE,
                                  outdir = paste0(outpath, "/postop.lf_100ss/postop.lf_glmnet.100ss"))

# SVM
postop.lf.svm.100ss <- elevate(men$postop.lf, mod = "svm",
                               params = list(upsample = TRUE,
                                             gamma = c(1/6, 1/6*.1, 1/6*.01)),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/postop.lf_100ss/postop.lf_svm.100ss"))

# CART
postop.lf.cart.100ss <- elevate(men$postop.lf, mod = "cart",
                                params = list(upsample = TRUE, maxdepth = 30,
                                              prune.cp = c(.1, .05, .01)),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/postop.lf_100ss/postop.lf_cart.100ss"))

# MDB
postop.lf.mdb.100ss <- elevate(men$postop.lf, mod = "mdb",
                               params = list(upsample = TRUE,
                                             gamma = seq(.6, 1, .2),
                                             max.depth = 30,
                                             min.hessian = .001),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/postop.lf_100ss/postop.lf_mdb.100ss"))

# RF
postop.lf.rf.100ss <- elevate(men$postop.lf, mod = "ranger",
                              params = list(upsample = TRUE),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/postop.lf_100ss/postop.lf_rf.100ss"))

# GBM
postop.lf.gbm.100ss <- elevate(men$postop.lf, mod = "gbm",
                               params = list(upsample = TRUE,
                                             interaction.depth = 1:2,
                                             n.minobsinnode = 2),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/postop.lf_100ss/postop.lf_gbm.100ss"))

# [ INTEGRATED LF ] ====
# GLM
prepost.lf.glm.100ss <- elevate(men$prepost.lf, mod = "glm",
                                params = list(upsample = TRUE),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/prepost.lf_100ss/prepost.lf_glm.100ss"))

# GLMNET
prepost.lf.glmnet.100ss <- elevate(men$prepost.lf, mod = "glmnet",
                                   params = list(upsample = TRUE),
                                   resampler.rtSet = resampler, save.mods = FALSE,
                                   outdir = paste0(outpath, "/prepost.lf_100ss/prepost.lf_glmnet.100ss"))

# SVM
prepost.lf.svm.100ss <- elevate(men$prepost.lf, mod = "svm",
                                params = list(upsample = TRUE,
                                              gamma = c(1/20, 1/20*.1, 1/20*.01)),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/prepost.lf_100ss/prepost.lf_svm.100ss"))

# CART
prepost.lf.cart.100ss <- elevate(men$prepost.lf, mod = "cart",
                                 params = list(upsample = TRUE, maxdepth = 30,
                                               prune.cp = c(.1, .05, .01)),
                                 resampler.rtSet = resampler, save.mods = FALSE,
                                 outdir = paste0(outpath, "/prepost.lf_100ss/prepost.lf_cart.100ss"))

# MDB
prepost.lf.mdb.100ss <- elevate(men$prepost.lf, mod = "mdb",
                                params = list(upsample = TRUE,
                                              gamma = seq(.6, 1, .2),
                                              max.depth = 30,
                                              min.hessian = .001),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/prepost.lf_100ss/prepost.lf_mdb.100ss"))

# RF
prepost.lf.rf.100ss <- elevate(men$prepost.lf, mod = "ranger",
                               params = list(upsample = TRUE),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/prepost.lf_100ss/prepost.lf_rf.100ss"))

# GBM
prepost.lf.gbm.100ss <- elevate(men$prepost.lf, mod = "gbm",
                                params = list(upsample = TRUE,
                                              interaction.depth = 1:2,
                                              n.minobsinnode = 2),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/prepost.lf_100ss/prepost.lf_gbm.100ss"))

# [ PREOPERATIVE OS ] ====
# GLM
preop.os.glm.100ss <- elevate(men$preop.os, mod = "glm",
                              params = list(upsample = TRUE),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/preop.os_100ss/preop.os_glm.100ss"))

# GLMNET
preop.os.glmnet.100ss <- elevate(men$preop.os, mod = "glmnet",
                                 params = list(upsample = TRUE),
                                 resampler.rtSet = resampler, save.mods = FALSE,
                                 outdir = paste0(outpath, "/preop.os_100ss/preop.os_glmnet.100ss"))

# SVM
preop.os.svm.100ss <- elevate(men$preop.os, mod = "svm",
                              params = list(upsample = TRUE,
                                            gamma = c(1/17, 1/17*.1, 1/17*.01)),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/preop.os_100ss/preop.os_svm.100ss"))

# CART
preop.os.cart.100ss <- elevate(men$preop.os, mod = "cart",
                               params = list(upsample = TRUE, maxdepth = 30,
                                             prune.cp = c(.1, .05, .01)),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/preop.os_100ss/preop.os_cart.100ss"))

# MDB
preop.os.mdb.100ss <- elevate(men$preop.os, mod = "mdb",
                              params = list(upsample = TRUE,
                                            gamma = seq(.6, 1, .2),
                                            max.depth = 30,
                                            min.hessian = .001),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/preop.os_100ss/preop.os_mdb.100ss"))

# RF
preop.os.rf.100ss <- elevate(men$preop.os, mod = "ranger",
                             params = list(upsample = TRUE),
                             resampler.rtSet = resampler, save.mods = FALSE,
                             outdir = paste0(outpath, "/preop.os_100ss/preop.os_rf.100ss"))

# GBM
preop.os.gbm.100ss <- elevate(men$preop.os, mod = "gbm",
                              params = list(upsample = TRUE,
                                            interaction.depth = 1:2,
                                            n.minobsinnode = 2),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/preop.os_100ss/preop.os_gbm.100ss"))

# [ CONVENTIONAL OS ] ====
# GLM
postop.os.glm.100ss <- elevate(men$postop.os, mod = "glm",
                               params = list(upsample = TRUE),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/postop.os_100ss/postop.os_glm.100ss"))

# GLMNET
postop.os.glmnet.100ss <- elevate(men$postop.os, mod = "glmnet",
                                  params = list(upsample = TRUE),
                                  resampler.rtSet = resampler, save.mods = FALSE,
                                  outdir = paste0(outpath, "/postop.os_100ss/postop.os_glmnet.100ss"))

# SVM
postop.os.svm.100ss <- elevate(men$postop.os, mod = "svm",
                               params = list(upsample = TRUE,
                                             gamma = c(1/6, 1/6*.1, 1/6*.01)),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/postop.os_100ss/postop.os_svm.100ss"))

# CART
postop.os.cart.100ss <- elevate(men$postop.os, mod = "cart",
                                params = list(upsample = TRUE, maxdepth = 30,
                                              prune.cp = c(.1, .05, .01)),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/postop.os_100ss/postop.os_cart.100ss"))

# MDB
postop.os.mdb.100ss <- elevate(men$postop.os, mod = "mdb",
                               params = list(upsample = TRUE,
                                             gamma = seq(.6, 1, .2),
                                             max.depth = 30,
                                             min.hessian = .001),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/postop.os_100ss/postop.os_mdb.100ss"))

# RF
postop.os.rf.100ss <- elevate(men$postop.os, mod = "ranger",
                              params = list(upsample = TRUE),
                              resampler.rtSet = resampler, save.mods = FALSE,
                              outdir = paste0(outpath, "/postop.os_100ss/postop.os_rf.100ss"))

# GBM
postop.os.gbm.100ss <- elevate(men$postop.os, mod = "gbm",
                               params = list(upsample = TRUE,
                                             interaction.depth = 1:2,
                                             n.minobsinnode = 2),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/postop.os_100ss/postop.os_gbm.100ss"))

# [ INTEGRATED OS ] ====
# GLM
prepost.os.glm.100ss <- elevate(men$prepost.os, mod = "glm",
                                params = list(upsample = TRUE),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/prepost.os_100ss/prepost.os_glm.100ss"))

# GLMNET
prepost.os.glmnet.100ss <- elevate(men$prepost.os, mod = "glmnet",
                                   params = list(upsample = TRUE),
                                   resampler.rtSet = resampler, save.mods = FALSE,
                                   outdir = paste0(outpath, "/prepost.os_100ss/prepost.os_glmnet.100ss"))

# SVM
prepost.os.svm.100ss <- elevate(men$prepost.os, mod = "svm",
                                params = list(upsample = TRUE,
                                              gamma = c(1/20, 1/20*.1, 1/20*.01)),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/prepost.os_100ss/prepost.os_svm.100ss"))

# CART
prepost.os.cart.100ss <- elevate(men$prepost.os, mod = "cart",
                                 params = list(upsample = TRUE, maxdepth = 30,
                                               prune.cp = c(.1, .05, .01)),
                                 resampler.rtSet = resampler, save.mods = FALSE,
                                 outdir = paste0(outpath, "/prepost.os_100ss/prepost.os_cart.100ss"))

# MDB
prepost.os.mdb.100ss <- elevate(men$prepost.os, mod = "mdb",
                                params = list(upsample = TRUE,
                                              gamma = seq(.6, 1, .2),
                                              max.depth = 30,
                                              min.hessian = .001),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/prepost.os_100ss/prepost.os_mdb.100ss"))

# RF
prepost.os.rf.100ss <- elevate(men$prepost.os, mod = "ranger",
                               params = list(upsample = TRUE),
                               resampler.rtSet = resampler, save.mods = FALSE,
                               outdir = paste0(outpath, "/prepost.os_100ss/prepost.os_rf.100ss"))

# GBM
prepost.os.gbm.100ss <- elevate(men$prepost.os, mod = "gbm",
                                params = list(upsample = TRUE,
                                              interaction.depth = 1:2,
                                              n.minobsinnode = 2),
                                resampler.rtSet = resampler, save.mods = FALSE,
                                outdir = paste0(outpath, "/prepost.os_100ss/prepost.os_gbm.100ss"))
