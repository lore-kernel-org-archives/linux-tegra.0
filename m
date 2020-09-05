Return-Path: <SRS0=vF+y=CO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210FEC2D0E4
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Sep 2020 10:36:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E355E20757
	for <linux-tegra@archiver.kernel.org>; Sat,  5 Sep 2020 10:36:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="SPd7YTbp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgIEKgN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 5 Sep 2020 06:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728381AbgIEKgJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Sep 2020 06:36:09 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB19CC061262
        for <linux-tegra@vger.kernel.org>; Sat,  5 Sep 2020 03:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=G0qJuXob1DSXWdY1RiQruheMQunVJ/ybhzxu/lTK9ys=; b=SPd7YTbpBuA7ogF8d3BXRsLhFa
        FH98nyQF8C21c8D+E31XxIRmqb3XdsZlzX5+yr7NMMeqL/RdtbLcrZh+ydHRrnYSPdKt+xpcnR5Sy
        2S9hqbaMEWh58WZ/YQi4PEaD3WzlLsa9H1YW48uCJhspxLpMQ5DjFZEK7P1BMaJcvA0wrxGzR54CT
        E3t+OLB1Y6qnrchjd7Q1mBNs8wxTe1h7AIot0jQ7TS9hLH2Md750gdDwb5DLUoQS5w+J+pdn8xUqJ
        98DXYhSue2Ekk+0Jqra4AbGfRJuTv41MnvBupBkeUMWKlPbaswwdNKxrtCL2TdKYcMZ9DdSLkT3JJ
        /YyV8M8w==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kEVXw-0003SS-SP; Sat, 05 Sep 2020 13:35:48 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [RFC PATCH v2 04/17] gpu: host1x: Remove cancelled waiters immediately
Date:   Sat,  5 Sep 2020 13:34:07 +0300
Message-Id: <20200905103420.3021852-5-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Before this patch, cancelled waiters would only be cleaned up
once their threshold value was reached. Make host1x_intr_put_ref
process the cancellation immediately to fix this.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/intr.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 9245add23b5d..5d328d20ce6d 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -247,13 +247,17 @@ void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref)
 	struct host1x_waitlist *waiter = ref;
 	struct host1x_syncpt *syncpt;
 
-	while (atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED) ==
-	       WLS_REMOVED)
-		schedule();
+	atomic_cmpxchg(&waiter->state, WLS_PENDING, WLS_CANCELLED);
 
 	syncpt = host->syncpt + id;
-	(void)process_wait_list(host, syncpt,
-				host1x_syncpt_load(host->syncpt + id));
+
+	spin_lock(&syncpt->intr.lock);
+	if (atomic_cmpxchg(&waiter->state, WLS_CANCELLED, WLS_HANDLED) ==
+	    WLS_CANCELLED) {
+		list_del(&waiter->list);
+		kref_put(&waiter->refcount, waiter_release);
+	}
+	spin_unlock(&syncpt->intr.lock);
 
 	kref_put(&waiter->refcount, waiter_release);
 }
-- 
2.28.0

