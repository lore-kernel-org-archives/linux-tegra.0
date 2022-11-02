Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72FAC4332F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Nov 2022 01:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiKBB6o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Nov 2022 21:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiKBB6n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Nov 2022 21:58:43 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E73013E0F
        for <linux-tegra@vger.kernel.org>; Tue,  1 Nov 2022 18:58:42 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N290R2cK9zRnsS;
        Wed,  2 Nov 2022 09:53:43 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 09:58:40 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 2 Nov
 2022 09:58:39 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
CC:     <yangyingliang@huawei.com>, JC Kuo <jckuo@nvidia.com>,
        "Kishon Vijay Abraham I" <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] phy: tegra: xusb: fix error handing in tegra_xusb_{pad|port}_init()
Date:   Wed, 2 Nov 2022 09:57:32 +0800
Message-ID: <20221102015732.1332099-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If device_add() is not called successful, it can not call
device_unregister(), it will lead a kernel crash because
of deleting not added device. Fix these by using put_device()
instead.

Fixes: 53d2a715c240 ("phy: Add Tegra XUSB pad controller support")
Cc: JC Kuo <jckuo@nvidia.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/phy/tegra/xusb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 95091876c422..65e15dcde02f 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -165,16 +165,16 @@ int tegra_xusb_pad_init(struct tegra_xusb_pad *pad,
 
 	err = dev_set_name(&pad->dev, "%s", pad->soc->name);
 	if (err < 0)
-		goto unregister;
+		goto put_dev;
 
 	err = device_add(&pad->dev);
 	if (err < 0)
-		goto unregister;
+		goto put_dev;
 
 	return 0;
 
-unregister:
-	device_unregister(&pad->dev);
+put_dev:
+	put_device(&pad->dev);
 	return err;
 }
 
@@ -542,16 +542,16 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
 
 	err = dev_set_name(&port->dev, "%s-%u", name, index);
 	if (err < 0)
-		goto unregister;
+		goto put_dev;
 
 	err = device_add(&port->dev);
 	if (err < 0)
-		goto unregister;
+		goto put_dev;
 
 	return 0;
 
-unregister:
-	device_unregister(&port->dev);
+put_dev:
+	put_device(&port->dev);
 	return err;
 }
 
-- 
2.25.1

