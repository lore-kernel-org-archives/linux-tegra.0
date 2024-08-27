Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7661A2555;
	Tue, 27 Aug 2024 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758701; cv=none; b=AmBMyLdCuhGWan0bFBMEfkkDT46/Pq3coDIqI+sZlwS4Gjp4aUlJTlFjr83jOCIC3itMHdwgYMnq4AmpQ5eOyeNM9nEenL52SNIlyHagk4YeUUy34lr9hsbloznDxEwEIO6P7QTdPo1IYb2Gs8549jEQpOPgZbF0lXlHsGZErE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758701; c=relaxed/simple;
	bh=1h1JbHSB4nat3IP75xhbkJxU9Sy9WszaXRLMmsy1xYM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZXlfMG8/m5cY+OWVnjDoBvSBLMOyHo3OOVw4BqEHVhsomm/WLwqK1seuYuuxo4K6a2SVIvmadWgogonA39X/NJH0kH+LkQrKgQSWdIm7guliMqYXHozs50+lDs8B5KGLp9wg+yYaZz/w4O78w/lPDgMh9rxsIDISR+Gre8dB2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WtQQw5RZxzQqtk;
	Tue, 27 Aug 2024 19:33:28 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 7504F18007C;
	Tue, 27 Aug 2024 19:38:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <andrew@lunn.ch>, <sebastian.hesselbarth@gmail.com>,
	<gregory.clement@bootlin.com>, <herve.codina@bootlin.com>,
	<qiang.zhao@nxp.com>, <christophe.leroy@csgroup.eu>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <nm@ti.com>,
	<ssantosh@kernel.org>, <petlozup@nvidia.com>, <pshete@nvidia.com>,
	<ruanjinjie@huawei.com>, <christophe.jaillet@wanadoo.fr>,
	<ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-tegra@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
Subject: [PATCH -next 8/8] soc: ti: knav_qmss_queue: Simplify with scoped for each OF child loop
Date: Tue, 27 Aug 2024 19:46:07 +0800
Message-ID: <20240827114607.4019972-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827114607.4019972-1-ruanjinjie@huawei.com>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

And use the dev_err_probe() helper to simplify error handling during
probe. This also handle scenario, when EDEFER is returned and useless
error is printed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 57 ++++++++++----------------------
 1 file changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index a15eaa1900ab..5126863ed647 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -1080,17 +1080,13 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
 {
 	struct device *dev = kdev->dev;
 	struct knav_region *region;
-	struct device_node *child;
 	u32 temp[2];
 	int ret;
 
-	for_each_child_of_node(regions, child) {
+	for_each_child_of_node_scoped(regions, child) {
 		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
-		if (!region) {
-			of_node_put(child);
-			dev_err(dev, "out of memory allocating region\n");
-			return -ENOMEM;
-		}
+		if (!region)
+			return dev_err_probe(dev, -ENOMEM, "out of memory allocating region\n");
 
 		region->name = knav_queue_find_name(child);
 		of_property_read_u32(child, "id", &region->id);
@@ -1116,10 +1112,8 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
 		INIT_LIST_HEAD(&region->pools);
 		list_add_tail(&region->list, &kdev->regions);
 	}
-	if (list_empty(&kdev->regions)) {
-		dev_err(dev, "no valid region information found\n");
-		return -ENODEV;
-	}
+	if (list_empty(&kdev->regions))
+		return dev_err_probe(dev, -ENODEV, "no valid region information found\n");
 
 	/* Next, we run through the regions and set things up */
 	for_each_region(kdev, region)
@@ -1313,10 +1307,8 @@ static int knav_setup_queue_pools(struct knav_device *kdev,
 	}
 
 	/* ... and barf if they all failed! */
-	if (list_empty(&kdev->queue_ranges)) {
-		dev_err(kdev->dev, "no valid queue range found\n");
-		return -ENODEV;
-	}
+	if (list_empty(&kdev->queue_ranges))
+		return dev_err_probe(kdev->dev, -ENODEV, "no valid queue range found\n");
 	return 0;
 }
 
@@ -1388,17 +1380,13 @@ static int knav_queue_init_qmgrs(struct knav_device *kdev,
 {
 	struct device *dev = kdev->dev;
 	struct knav_qmgr_info *qmgr;
-	struct device_node *child;
 	u32 temp[2];
 	int ret;
 
-	for_each_child_of_node(qmgrs, child) {
+	for_each_child_of_node_scoped(qmgrs, child) {
 		qmgr = devm_kzalloc(dev, sizeof(*qmgr), GFP_KERNEL);
-		if (!qmgr) {
-			of_node_put(child);
-			dev_err(dev, "out of memory allocating qmgr\n");
-			return -ENOMEM;
-		}
+		if (!qmgr)
+			return dev_err_probe(dev, -ENOMEM, "out of memory allocating qmgr\n");
 
 		ret = of_property_read_u32_array(child, "managed-queues",
 						 temp, 2);
@@ -1490,15 +1478,11 @@ static int knav_queue_init_pdsps(struct knav_device *kdev,
 {
 	struct device *dev = kdev->dev;
 	struct knav_pdsp_info *pdsp;
-	struct device_node *child;
 
-	for_each_child_of_node(pdsps, child) {
+	for_each_child_of_node_scoped(pdsps, child) {
 		pdsp = devm_kzalloc(dev, sizeof(*pdsp), GFP_KERNEL);
-		if (!pdsp) {
-			of_node_put(child);
-			dev_err(dev, "out of memory allocating pdsp\n");
-			return -ENOMEM;
-		}
+		if (!pdsp)
+			return dev_err_probe(dev, -ENOMEM, "out of memory allocating pdsp\n");
 		pdsp->name = knav_queue_find_name(child);
 		pdsp->iram =
 			knav_queue_map_reg(kdev, child,
@@ -1755,16 +1739,12 @@ static int knav_queue_probe(struct platform_device *pdev)
 	u32 temp[2];
 	int ret;
 
-	if (!node) {
-		dev_err(dev, "device tree info unavailable\n");
-		return -ENODEV;
-	}
+	if (!node)
+		return dev_err_probe(dev, -ENODEV, "device tree info unavailable\n");
 
 	kdev = devm_kzalloc(dev, sizeof(struct knav_device), GFP_KERNEL);
-	if (!kdev) {
-		dev_err(dev, "memory allocation failed\n");
-		return -ENOMEM;
-	}
+	if (!kdev)
+		return dev_err_probe(dev, -ENOMEM, "memory allocation failed\n");
 
 	if (device_get_match_data(dev))
 		kdev->version = QMSS_66AK2G;
@@ -1781,8 +1761,7 @@ static int knav_queue_probe(struct platform_device *pdev)
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
 		pm_runtime_disable(&pdev->dev);
-		dev_err(dev, "Failed to enable QMSS\n");
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to enable QMSS\n");
 	}
 
 	if (of_property_read_u32_array(node, "queue-range", temp, 2)) {
-- 
2.34.1

