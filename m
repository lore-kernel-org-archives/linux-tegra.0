Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A745C48BE6
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Apr 2022 15:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240676AbiDAPPZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Apr 2022 11:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348869AbiDAOw7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Apr 2022 10:52:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F922B5187;
        Fri,  1 Apr 2022 07:42:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C3D1A60AC0;
        Fri,  1 Apr 2022 14:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69D4C2BBE4;
        Fri,  1 Apr 2022 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648824147;
        bh=QsLGF1AfyUMyqSOnet8s4XlUWwiSjJOJzE+S82WR1sM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jk7buF+y2hA5sGfZ7CpoYNT8paj93IGGEhY6e9fQmL88TYjzaBPsfYl/g9W5Yn61J
         xOk0JhKQ8AVRZA3ieKRkC3I0D3omOqZptFtfSDTp0mwQGK0Jva5WW1tCr9S2Juse/d
         JGGzjNm+J1LGDmDBR162Kw2OfJTemUsKO0f6RNvkk4I8rA3Pv2SW8fxnMK2G6BEynF
         ZyJMNayAT3FuvHq1kJF9JfqFZwupYlalRnbgOKnTwgUM22kK5kkxXIHq7rzf+UF6rb
         YH69D6rCX3ZN3MXmxutiwths78pfIQnu/Fgtm+8803Ft8J6ysJYFYPkFBcGSSYgxyi
         JeIX9GcJKeExg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wayne Chang <waynec@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, balbi@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        zhangqilong3@huawei.com, rikard.falkeborn@gmail.com,
        yangyingliang@huawei.com, jakobkoschel@gmail.com,
        chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 05/65] usb: gadget: tegra-xudc: Do not program SPARAM
Date:   Fri,  1 Apr 2022 10:41:06 -0400
Message-Id: <20220401144206.1953700-5-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401144206.1953700-1-sashal@kernel.org>
References: <20220401144206.1953700-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

[ Upstream commit 62fb61580eb48fc890b7bc9fb5fd263367baeca8 ]

According to the Tegra Technical Reference Manual, SPARAM
is a read-only register and should not be programmed in
the driver.

The change removes the wrong SPARAM usage.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Link: https://lore.kernel.org/r/20220107090443.149021-1-waynec@nvidia.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 57ee72fead45..1dd0d50c6b56 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -32,9 +32,6 @@
 #include <linux/workqueue.h>
 
 /* XUSB_DEV registers */
-#define SPARAM 0x000
-#define  SPARAM_ERSTMAX_MASK GENMASK(20, 16)
-#define  SPARAM_ERSTMAX(x) (((x) << 16) & SPARAM_ERSTMAX_MASK)
 #define DB 0x004
 #define  DB_TARGET_MASK GENMASK(15, 8)
 #define  DB_TARGET(x) (((x) << 8) & DB_TARGET_MASK)
@@ -3295,11 +3292,6 @@ static void tegra_xudc_init_event_ring(struct tegra_xudc *xudc)
 	unsigned int i;
 	u32 val;
 
-	val = xudc_readl(xudc, SPARAM);
-	val &= ~(SPARAM_ERSTMAX_MASK);
-	val |= SPARAM_ERSTMAX(XUDC_NR_EVENT_RINGS);
-	xudc_writel(xudc, val, SPARAM);
-
 	for (i = 0; i < ARRAY_SIZE(xudc->event_ring); i++) {
 		memset(xudc->event_ring[i], 0, XUDC_EVENT_RING_SIZE *
 		       sizeof(*xudc->event_ring[i]));
-- 
2.34.1

