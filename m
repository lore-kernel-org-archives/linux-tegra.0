Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F211A0B06;
	Tue, 27 Aug 2024 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758701; cv=none; b=jKW3mr+nVm6p8+g9z8lPqWiej7RRQ3JlK4XdlQvXVS3RAj57ChU1SJ8o7s6iIFVUmJbT29oseQoNv5PXJP65BNsu0GPsMupJn/cI6mCPW9t7tf9+NmoWRTJd6B5fAbmNv8v8SgBr+MyQgHZDRC6L0oQJXZbViYNhn13jeaN3q+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758701; c=relaxed/simple;
	bh=6T2kzFjrqJ2pB9Lcw9tN+yUCT9Pmdj7Kk9oVwNRcnS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b6rTEJJaJRzm6aHT/R3ILaDDlicFHRqAiFk1SCczWI2SgZzLad2mfw/m5TjCIHhDG8NWjmNQhWJc90rHTNstIy/gc5dLeErjJMUl1kQSgBVwTZbCdrGAOUPAp1bflIZGDmOG9zeECFmh9+5tCrbPdV67C/KISNrOc61v36KWhDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WtQWY6Vpgz14GKW;
	Tue, 27 Aug 2024 19:37:29 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id C5510140202;
	Tue, 27 Aug 2024 19:38:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 19:38:15 +0800
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
Subject: [PATCH -next 7/8] soc: ti: knav_dma: Simplify with scoped for each OF child loop
Date: Tue, 27 Aug 2024 19:46:06 +0800
Message-ID: <20240827114607.4019972-8-ruanjinjie@huawei.com>
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
 drivers/soc/ti/knav_dma.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
index fb0746d8caad..eeec422a46f0 100644
--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -706,20 +706,15 @@ static int knav_dma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
-	struct device_node *child;
 	int ret = 0;
 
-	if (!node) {
-		dev_err(&pdev->dev, "could not find device info\n");
-		return -EINVAL;
-	}
+	if (!node)
+		return dev_err_probe(&pdev->dev, -EINVAL, "could not find device info\n");
 
 	kdev = devm_kzalloc(dev,
 			sizeof(struct knav_dma_pool_device), GFP_KERNEL);
-	if (!kdev) {
-		dev_err(dev, "could not allocate driver mem\n");
-		return -ENOMEM;
-	}
+	if (!kdev)
+		return dev_err_probe(dev, -ENOMEM, "could not allocate driver mem\n");
 
 	kdev->dev = dev;
 	INIT_LIST_HEAD(&kdev->list);
@@ -732,10 +727,9 @@ static int knav_dma_probe(struct platform_device *pdev)
 	}
 
 	/* Initialise all packet dmas */
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		ret = dma_init(node, child);
 		if (ret) {
-			of_node_put(child);
 			dev_err(&pdev->dev, "init failed with %d\n", ret);
 			break;
 		}
-- 
2.34.1

