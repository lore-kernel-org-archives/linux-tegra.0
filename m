Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2BEC47093
	for <linux-tegra@archiver.kernel.org>; Sun, 30 May 2021 12:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AA3260E0C
	for <linux-tegra@archiver.kernel.org>; Sun, 30 May 2021 12:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhE3MYB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 30 May 2021 08:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhE3MYB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 30 May 2021 08:24:01 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E25C061760
        for <linux-tegra@vger.kernel.org>; Sun, 30 May 2021 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=FhHStfdgwg8Q58twTXVwRWuP64Y7FfcxZREy57jDy14=; b=Et17haPNNdouyYy2osrb5xJJ9j
        Di2DW1G182J9W/m04hom5wBvph8OjNpQSjYl98A7WiogLhBIetcQ2SVeIwn5V8OCm8Ejqfq9Ps7uy
        l5nhEoGyWGxjxSMVerJMLbJ5iTCTr55vMW/nGgFDtsvsfQm9gfIA3YuQJXFc9QYlutY9QTa4IuqJ8
        qTCmbjriFqZnfqXrv71tBx+DZBOBNNaq6fJoJe3Z2YNdWU3K5GVe/VdHgYRGPkaqrTmatsIJV61xb
        QLM7lWvP9ZxOMbYiRCgR4xbTWgJVxEYnIKNaNJx8DBuHnmw6VKa0cTFySx85sW1k77hxytBHpaxLs
        w03AFTtA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lnKSQ-000775-NX; Sun, 30 May 2021 15:22:18 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 14/14] drm/tegra: Bump driver version
Date:   Sun, 30 May 2021 15:21:56 +0300
Message-Id: <20210530122156.3292479-15-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210530122156.3292479-1-mperttunen@nvidia.com>
References: <20210530122156.3292479-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Bump driver version to 1.0.0 to allow userspace to detect
availability of new interfaces.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 59f04431cae0..f568bb4c3345 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -27,7 +27,7 @@
 #define DRIVER_NAME "tegra"
 #define DRIVER_DESC "NVIDIA Tegra graphics"
 #define DRIVER_DATE "20120330"
-#define DRIVER_MAJOR 0
+#define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 #define DRIVER_PATCHLEVEL 0
 
-- 
2.30.1

