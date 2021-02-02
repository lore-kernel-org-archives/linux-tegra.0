Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9F5C433E0
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 12:38:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E4DA64F45
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 12:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231357AbhBBMiV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Feb 2021 07:38:21 -0500
Received: from mail-m17640.qiye.163.com ([59.111.176.40]:43740 "EHLO
        mail-m17640.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbhBBMiT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Feb 2021 07:38:19 -0500
X-Greylist: delayed 552 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Feb 2021 07:37:55 EST
Received: from ubuntu.localdomain (unknown [157.0.31.124])
        by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 032F7540228;
        Tue,  2 Feb 2021 20:27:55 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Subject: [PATCH] drm/tegra: remove unneeded variable: "ret"
Date:   Tue,  2 Feb 2021 04:27:48 -0800
Message-Id: <20210202122748.15597-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZS0gfGBgdQhpCH0pIVkpNSklJTUNDTE1JSUxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MD46ITo4Pj8KHzYIMioDLhAt
        PAsKCz1VSlVKTUpJSU1DQ0xNTkxMVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSU9ZV1kIAVlBSkJPQjcG
X-HM-Tid: 0a7762b6b183d995kuws032f7540228
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

remove unneeded variable: "ret".

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 105fb9cdbb3b..b8abd55f3ef8 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -279,7 +279,6 @@ static void tegra_dpaux_hotplug(struct work_struct *work)
 static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 {
 	struct tegra_dpaux *dpaux = data;
-	irqreturn_t ret = IRQ_HANDLED;
 	u32 value;
 
 	/* clear interrupts */
@@ -296,7 +295,7 @@ static irqreturn_t tegra_dpaux_irq(int irq, void *data)
 	if (value & DPAUX_INTR_AUX_DONE)
 		complete(&dpaux->complete);
 
-	return ret;
+	return IRQ_HANDLED;
 }
 
 enum tegra_dpaux_functions {
-- 
2.29.0

