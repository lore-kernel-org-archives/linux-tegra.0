Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71235C4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 09:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F48A6127A
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Jul 2021 09:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236030AbhG0J3M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Jul 2021 05:29:12 -0400
Received: from mx21.baidu.com ([220.181.3.85]:39928 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235946AbhG0J3M (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Jul 2021 05:29:12 -0400
Received: from BC-Mail-Ex10.internal.baidu.com (unknown [172.31.51.50])
        by Forcepoint Email with ESMTPS id 2AB83FEB2AB2D61C11CE;
        Tue, 27 Jul 2021 17:29:01 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex10.internal.baidu.com (172.31.51.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 27 Jul 2021 17:29:00 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 27 Jul 2021 17:29:00 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH V2] media: uvcvideo: Remove unused including <linux/version.h>
Date:   Tue, 27 Jul 2021 17:28:53 +0800
Message-ID: <20210727092854.1006-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex23.internal.baidu.com (172.31.51.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove including <linux/version.h> that don't need it.

V1->V2: Split the patch in two.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9a791d8ef200..b1b055784f8d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -16,7 +16,6 @@
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
-#include <linux/version.h>
 #include <asm/unaligned.h>
 
 #include <media/v4l2-common.h>
-- 
2.25.1

