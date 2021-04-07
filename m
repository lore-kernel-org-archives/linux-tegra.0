Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126EBC433ED
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Apr 2021 09:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0D17613A9
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Apr 2021 09:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbhDGJ0W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Apr 2021 05:26:22 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15941 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbhDGJ0V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Apr 2021 05:26:21 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFf8w31tyzyNbZ;
        Wed,  7 Apr 2021 17:24:00 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 17:26:08 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH -next] usb: gadget: tegra-xudc: Fix possible use-after-free in tegra_xudc_remove()
Date:   Wed, 7 Apr 2021 17:29:47 +0800
Message-ID: <20210407092947.3271507-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This driver's remove path calls cancel_delayed_work(). However, that
function does not wait until the work function finishes. This means
that the callback function may still be running after the driver's
remove function has finished, which would result in a use-after-free.

Fix by calling cancel_delayed_work_sync(), which ensures that
the work is properly cancelled, no longer running, and unable
to re-schedule itself.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 580bef8eb4cb..2319c9737c2b 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3883,7 +3883,7 @@ static int tegra_xudc_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(xudc->dev);
 
-	cancel_delayed_work(&xudc->plc_reset_work);
+	cancel_delayed_work_sync(&xudc->plc_reset_work);
 	cancel_work_sync(&xudc->usb_role_sw_work);
 
 	usb_del_gadget_udc(&xudc->gadget);
-- 
2.25.1

