Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C470C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 11:00:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0520E60F55
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 11:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbhHKLAg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Aug 2021 07:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhHKLAg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Aug 2021 07:00:36 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09958C061765
        for <linux-tegra@vger.kernel.org>; Wed, 11 Aug 2021 04:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=/iSSop4GWowGNsB9IrG4EdmqJF+wZV8rC2gmBJlZQTM=; b=wCe2tmsN0HZMl2FTgBq/C91F9j
        IkvDQDJziVxF3uZuJy4IFYLyuwy9Gj2zl4JgUi41KXlRZdXMPqtk4hf8GRzJMtbseUY2/qIC1UKL7
        DGL+Z7q6mm0Z8vrxBCVMtpirX/+FhKvM6It0lWRWUOPgcnASKC074KLEcMHf3Y4QA71OH8ug+4B4a
        oI2Vx/NKpJxdwsaVrJsaka+kkyDutqZDzh+/cjaNOTYD0FrMxuMXbiE9mx77mbjHeG/7ELFGxibPK
        i/zyI5J9zSK1qHeX//dd74ST+6l8PhVqlO/ktCdAJV79DsW85l7DT+HdtmoDLlPXGeYS4XO06NgNx
        7wRT78gA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1mDlxt-0001Er-T2; Wed, 11 Aug 2021 14:00:05 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH] drm/tegra: vic: Use autosuspend
Date:   Wed, 11 Aug 2021 13:59:54 +0300
Message-Id: <20210811105954.3537773-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When going idle, it's not unlikely that more work will follow.
As such, use autosuspend with a 500ms suspend delay.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c02010ff2b7f..0204cfbe6694 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -482,6 +482,8 @@ static int vic_probe(struct platform_device *pdev)
 		if (err < 0)
 			goto unregister_client;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+	pm_runtime_use_autosuspend(&pdev->dev);
 
 	return 0;
 
-- 
2.32.0

