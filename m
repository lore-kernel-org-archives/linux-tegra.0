Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71068C47095
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 09:55:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BD01613AC
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 09:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238375AbhFIJ5w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 05:57:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4354 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235105AbhFIJ5v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 9 Jun 2021 05:57:51 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1599pb9X004155;
        Wed, 9 Jun 2021 09:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=L//vh03jvVMqGgHOzHK1+tPjaco74jX8OD89zhumWiM=;
 b=cEHv606LBOZ6Bw7CgVdmm+YTujjX05DSu1owPGO//SbBCOzyujWPh72NGF+FaQFnogMs
 yYfLSqMveZtvOxRysRqKMr4T1ng/y76XaEqinSsmLkZQNb5QIqsLEP7/8hmNJUb6PZFI
 goMxyhZXZO3uHAc2oD5z+Bdp0RzWi/cpjWFAhBaVmAyw/GJ9VYtBH+Gl7TiW5d/KOFwT
 qbximvVzKRY9Eq8nAhuaS1H2zY2KZucPh/yiorVNovMYGaPP48qSButy99PpDIJkgw4m
 nsQFZQ5nXUxt6reX0AMJtJr7i2FgsKWh+OYPXplLi69Ec0SYQMF4E3H+X3HL9zxDPyOh Rg== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 392jmw06hp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Jun 2021 09:55:40 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 1599ptcp007593;
        Wed, 9 Jun 2021 09:55:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 3922wug9s6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Jun 2021 09:55:40 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1599tdSN028423;
        Wed, 9 Jun 2021 09:55:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 3922wug9qn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Jun 2021 09:55:39 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1599tZ2Z017238;
        Wed, 9 Jun 2021 09:55:36 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Jun 2021 02:55:34 -0700
Date:   Wed, 9 Jun 2021 12:55:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] memory: tegra: Delete dead debugfs checking code
Message-ID: <YMCQDTSyG8UuQoh0@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-GUID: NPQdwU7L2BzZOVsbblldW1BSodma4iMi
X-Proofpoint-ORIG-GUID: NPQdwU7L2BzZOVsbblldW1BSodma4iMi
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The debugfs_create_dir() function does not return NULL, it returns error
pointers.  But in normal situations like this where the caller is not
dereferencing "emc->debugfs.root" then we are not supposed to check the
return.  So instead of fixing these checks, we should delete them.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/memory/tegra/tegra124-emc.c      | 4 ----
 drivers/memory/tegra/tegra20-emc.c       | 4 ----
 drivers/memory/tegra/tegra210-emc-core.c | 4 ----
 drivers/memory/tegra/tegra30-emc.c       | 4 ----
 4 files changed, 16 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index a21ca8e0841a..908f8d5392b2 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1269,10 +1269,6 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 	}
 
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
-	if (!emc->debugfs.root) {
-		dev_err(dev, "failed to create debugfs directory\n");
-		return;
-	}
 
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root, emc,
 			    &tegra_emc_debug_available_rates_fops);
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index a534197a5fb2..c3462dbc8c22 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -776,10 +776,6 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 	}
 
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
-	if (!emc->debugfs.root) {
-		dev_err(emc->dev, "failed to create debugfs directory\n");
-		return;
-	}
 
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root,
 			    emc, &tegra_emc_debug_available_rates_fops);
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index 5f224796e32e..06c0f17fa429 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1759,10 +1759,6 @@ static void tegra210_emc_debugfs_init(struct tegra210_emc *emc)
 	}
 
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
-	if (!emc->debugfs.root) {
-		dev_err(dev, "failed to create debugfs directory\n");
-		return;
-	}
 
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root, emc,
 			    &tegra210_emc_debug_available_rates_fops);
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 63e1983f8a0d..7e21a852f2e1 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1354,10 +1354,6 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 	}
 
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
-	if (!emc->debugfs.root) {
-		dev_err(emc->dev, "failed to create debugfs directory\n");
-		return;
-	}
 
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root,
 			    emc, &tegra_emc_debug_available_rates_fops);
-- 
2.30.2

