Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A5ECA0FE1
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Sep 2023 07:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbjIAHbP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Sep 2023 03:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348524AbjIAHbO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Sep 2023 03:31:14 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019B51705
        for <linux-tegra@vger.kernel.org>; Fri,  1 Sep 2023 00:31:04 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RcV5s1nzPzrRh6;
        Fri,  1 Sep 2023 15:29:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 1 Sep
 2023 15:31:02 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <linux-tegra@vger.kernel.org>, <iommu@lists.linux.dev>,
        <baolu.lu@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH v2] iommu/tegra-smmu: Drop unnecessary error check for  for debugfs_create_dir()
Date:   Fri, 1 Sep 2023 15:30:56 +0800
Message-ID: <20230901073056.1364755-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The debugfs_create_dir() function returns error pointers.
It never returns NULL.

As Baolu suggested, this patch removes the error checking for
debugfs_create_dir in tegra-smmu.c. This is because the DebugFS kernel API
is developed in a way that the caller can safely ignore the errors that
occur during the creation of DebugFS nodes. The debugfs APIs have
a IS_ERR() judge in start_creating() which can handle it gracefully. So
these checks are unnecessary.

Fixes: d1313e7896e9 ("iommu/tegra-smmu: Add debugfs support")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Baolu Lu <baolu.lu@linux.intel.com>
---
v2:
- Remove the err check instead of using IS_ERR to replace NULL check.
- Update the commit message and title.
---
 drivers/iommu/tegra-smmu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 1cbf063ccf14..2137040b7efa 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1056,8 +1056,6 @@ DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
 static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
 {
 	smmu->debugfs = debugfs_create_dir("smmu", NULL);
-	if (!smmu->debugfs)
-		return;
 
 	debugfs_create_file("swgroups", S_IRUGO, smmu->debugfs, smmu,
 			    &tegra_smmu_swgroups_fops);
-- 
2.34.1

