Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FC0C63798
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 11:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41F3822244
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 11:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="HhpZFbnR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgKTL0s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 06:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbgKTL0r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 06:26:47 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00BFC061A04
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Ra/ZvsJkYAeY7/hDP019mQWzrLWYo2XGYDwWgtpPdyI=; b=HhpZFbnRjz5V4pB8ibF/0qRq+l
        zPaHGAeRCJzBp6ImrAtp+pNqBttPajjBWtKgC39jVyxnTozJqErY8C2AXpSm0IfwO2NR7mvuhGsXj
        99ZcxWBFcfCURtlN0WSrUNLYgb+t26bQRYRz6sfAJwsRr5eCSYEUYVS+D4Q10Vtvq8HHPigSGbt54
        0exm50QYEQONt7McOt15qznqDE/62zmWKKu7btnZgUsNOruoMIh5+Sb1CQ3uVP46VbFna+WgWxH4A
        20VPuzNqvodT0O+1e+IQMn9YOpZvjRqg4W5923clFoDDUDJoFSrzYlZ4bTKEuSOezEI7rBdB83kVX
        z2geGkkA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kg4Yq-0003lG-Ip; Fri, 20 Nov 2020 13:26:40 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v4 04/21] gpu: host1x: Remove cancelled waiters immediately
Date:   Fri, 20 Nov 2020 13:25:43 +0200
Message-Id: <20201120112600.935082-5-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120112600.935082-1-mperttunen@nvidia.com>
References: <20201120112600.935082-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
2.29.2

