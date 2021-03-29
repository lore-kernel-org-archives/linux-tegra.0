Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C31DC433F1
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4057B61970
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbhC2Njk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 09:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhC2NjO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 09:39:14 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E73C0613DB
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=JLOSMVR8LfedWevAhZde1oneGtthA8mtFBZ7uba8HqY=; b=zqzb8eOT0v9XIf3DbV/SGkJpjF
        72YTpIbUpajFKg5PQ4YDLE/U+qBXt58ZHlypQudPR5776jWTAj89kTFhI2WWqMlWc4XYB3T0ICUvj
        OrHMNpiBj7PKOz4q2Q1vrUr9nX76QeV19Baq104BFVSwgm/FvZOFQjKbEuv2sj0hHblMVNB9Gu1d8
        LW2DvgODCiY2JbKfkPhouKGJyYurLldajmfrw1ZqbBxwZ4scJzLVzR/2y8NHQe1WxJpOtQJoUxYPA
        0X1ywmExX+fMH6DXKpaPOO8TJ8H5xxp4UamFpEbK1zmwCWHlzmO+xO8j1KLrF4CLfyyj8V3/foRiz
        +hLc1igg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lQs6n-0000Yj-TH; Mon, 29 Mar 2021 16:39:09 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 10/10] gpu: host1x: Fix Tegra194 syncpt interrupt threshold
Date:   Mon, 29 Mar 2021 16:38:36 +0300
Message-Id: <20210329133836.2115236-11-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329133836.2115236-1-mperttunen@nvidia.com>
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Jon Hunter <jonathanh@nvidia.com>

Syncpoint interrupts are not working as expected on Tegra194. The
problem is that the syncpoint interrupt threshold being used is the
global interrupt threshold and not the virtual interrupt threshold.
Fix this by using the virtual interrupt threshold which aligns with
downstream.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/hw_host1x07_vm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/hw/hw_host1x07_vm.h b/drivers/gpu/host1x/hw/hw_host1x07_vm.h
index 3058b3c9a91d..b766851d5b83 100644
--- a/drivers/gpu/host1x/hw/hw_host1x07_vm.h
+++ b/drivers/gpu/host1x/hw/hw_host1x07_vm.h
@@ -29,6 +29,6 @@
 #define HOST1X_SYNC_SYNCPT_THRESH_INT_ENABLE_CPU0(x)	(0x652c + 4 * (x))
 #define HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE(x)	(0x6590 + 4 * (x))
 #define HOST1X_SYNC_SYNCPT(x)				(0x8080 + 4 * (x))
-#define HOST1X_SYNC_SYNCPT_INT_THRESH(x)		(0x8d00 + 4 * (x))
+#define HOST1X_SYNC_SYNCPT_INT_THRESH(x)		(0x9980 + 4 * (x))
 #define HOST1X_SYNC_SYNCPT_CH_APP(x)			(0xa604 + 4 * (x))
 #define HOST1X_SYNC_SYNCPT_CH_APP_CH(v)			(((v) & 0x3f) << 8)
-- 
2.30.1

