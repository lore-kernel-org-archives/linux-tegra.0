Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB007C2D0A3
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 13:31:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 885282085B
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 13:31:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgKLNb5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Nov 2020 08:31:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7219 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbgKLNb4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Nov 2020 08:31:56 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CX2Z501t4zkjk8;
        Thu, 12 Nov 2020 21:31:41 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 12 Nov 2020
 21:31:48 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH] usb: gadget: tegra-xudc: Fix PM disable depth imbalance on error path
Date:   Thu, 12 Nov 2020 21:35:33 +0800
Message-ID: <20201112133533.1793971-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The pm_runtime_enable will increase power disable depth. Imbalance
depth will resulted in enabling runtime PM of device fails later.
Thus a pairing decrement must be needed on the error handling path
to keep it balanced.

Fixes: 49db427232fe2 ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 580bef8eb4cb..ad205e178033 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3861,6 +3861,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	return 0;
 
 free_eps:
+	pm_runtime_disable(&pdev->dev);
 	tegra_xudc_free_eps(xudc);
 free_event_ring:
 	tegra_xudc_free_event_ring(xudc);
-- 
2.25.4

