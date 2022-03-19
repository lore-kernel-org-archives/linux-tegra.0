Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C748C433EF
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Mar 2022 02:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbiCSCkA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Mar 2022 22:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbiCSCkA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Mar 2022 22:40:00 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13558E29C3;
        Fri, 18 Mar 2022 19:38:40 -0700 (PDT)
Received: from kwepemi100023.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KL4l61sFnzCqjV;
        Sat, 19 Mar 2022 10:36:34 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemi100023.china.huawei.com (7.221.188.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 19 Mar 2022 10:38:37 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Sat, 19 Mar
 2022 10:38:37 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH -next v2] usb: xhci: tegra:Fix PM usage reference leak of tegra_xusb_unpowergate_partitions
Date:   Sat, 19 Mar 2022 10:38:22 +0800
Message-ID: <20220319023822.145641-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: zhangqilong <zhangqilong3@huawei.com>

pm_runtime_get_sync will increment pm usage counter
even it failed. Forgetting to putting operation will
result in reference leak here. We fix it by replacing
it with pm_runtime_resume_and_get to keep usage counter
balanced.

Fixes:41a7426d25fa3 ("usb: xhci: tegra: Unlink power domain devices")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
v2:
- Fix commit id
---
 drivers/usb/host/xhci-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index c8af2cd2216d..996958a6565c 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1034,13 +1034,13 @@ static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
 	int rc;
 
 	if (tegra->use_genpd) {
-		rc = pm_runtime_get_sync(tegra->genpd_dev_ss);
+		rc = pm_runtime_resume_and_get(tegra->genpd_dev_ss);
 		if (rc < 0) {
 			dev_err(dev, "failed to enable XUSB SS partition\n");
 			return rc;
 		}
 
-		rc = pm_runtime_get_sync(tegra->genpd_dev_host);
+		rc = pm_runtime_resume_and_get(tegra->genpd_dev_host);
 		if (rc < 0) {
 			dev_err(dev, "failed to enable XUSB Host partition\n");
 			pm_runtime_put_sync(tegra->genpd_dev_ss);
-- 
2.31.1

