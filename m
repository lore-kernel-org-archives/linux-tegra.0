Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53603C4332F
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Feb 2022 13:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352011AbiBGNq2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Feb 2022 08:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355420AbiBGNmC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Feb 2022 08:42:02 -0500
X-Greylist: delayed 1319 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 05:42:00 PST
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40251C043188
        for <linux-tegra@vger.kernel.org>; Mon,  7 Feb 2022 05:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=dHg/vhDPEuP5iogqPGsue7712DGBhW3650gIFC1Qb+E=; b=UqQGnHOU9YM+5BMtZNfiecBhWW
        eRdcJv6NQBSYivUNOVEQrM2aPfgo8s03Lxggz0aX+7IchPggvo5+B6KbZMsHrwSqbU921kMxirC5/
        umhDBnN9oy+b725nLdA2zGQnN+IfBjsaA2456mv5FKEuaiUYiAdR+cLxyJoocuUL0muoNF/i1E4Ak
        AzgmplJO4/xBME1q9OkMmCZE6Z6/MpwzmFFfXTobD56bXbhY4snYSJYa/Fu+mF7pxaHdKtwJSLBed
        iY8AzERFcqqpSF7V37sEJEkekLu3YRX4enkOAFVAA9OtiN/4SdvQO6+h1zeJuGMA4RNVBNbp5gKuV
        jGp5jIIQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1nH3vx-0007xv-Nd; Mon, 07 Feb 2022 15:19:57 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 2/2] gpu: host1x: Fix refcount leak in buffer cache
Date:   Mon,  7 Feb 2022 15:19:32 +0200
Message-Id: <20220207131932.2164560-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220207131932.2164560-1-mperttunen@nvidia.com>
References: <20220207131932.2164560-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The recently introduced buffer cache is causing cached BOs to leak, as
cache entries are dropped when a BO's refcount goes to zero but the
cache itself keeps a reference to each cache BO, causing a circular
reference.

Fix this by not taking a reference to the cached BOs within the cache
itself.

Fixes: 1f39b1dfa53c ("drm/tegra: Implement buffer object cache")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
NOTE

As is, applying this patch reveals a BO refcounting issue in the
DC driver. A fix for that bug should be applied before applying
this patch. I believe Thierry will be posting a fix for that
shortly.
---
 drivers/gpu/host1x/bus.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index bdee16a0bb8e..66ba04501c94 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -938,9 +938,6 @@ struct host1x_bo_mapping *host1x_bo_pin(struct device *dev, struct host1x_bo *bo
 		mapping->cache = cache;
 
 		list_add_tail(&mapping->entry, &cache->mappings);
-
-		/* bump reference count to track the copy in the cache */
-		kref_get(&mapping->ref);
 	}
 
 unlock:
-- 
2.35.0

