Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FDFC43381
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 582B92225E
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbhAKNBL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jan 2021 08:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbhAKNBK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 08:01:10 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B93C06179F
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=U4LMapHebtqQLMY7HEgN7zFM2ivBVZziq+5m4D+W0WE=; b=astueCCDkN5AJ4VghQUXJtxvJ9
        CtOoLIj44JkIBsIM10T7e3PuVwJS15ZN1S8ZDc9u/Su2IFeWs8qrU3RttJGEimd6EcelOGOoATvR8
        km9FwagT7Pail0kEJ7XfhKviLTkwzt4x8LMcb42L7JWckfEfoP1haOYPadz/IVh7mRmo6Ym1w+ViQ
        dn6/OTbHuviBx0OVdDnGlRs11nX7O9ocnEIqcUS+qFzKA2lvCIWcINyOVIbVRvJViuRb0/dHKO78/
        QGEU1GvdHmNRyVnzBTgHbBNS8T7QPKLyTwlB4McwwOZH4nCep6aQwWKj9SQEymRok+7P7GwZVDI0Q
        TQ9RCVbw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kywo6-0002tl-F5; Mon, 11 Jan 2021 15:00:26 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 04/21] gpu: host1x: Remove cancelled waiters immediately
Date:   Mon, 11 Jan 2021 15:00:02 +0200
Message-Id: <20210111130019.3515669-5-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210111130019.3515669-1-mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
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
v5:
* Add parameter to flush, i.e. wait for all pending waiters to
  complete before returning. The reason this is not always true
  is that the pending waiter might be the place that is calling
  the put_ref.
---
 drivers/gpu/host1x/intr.c   | 23 +++++++++++++++++------
 drivers/gpu/host1x/intr.h   |  4 +++-
 drivers/gpu/host1x/syncpt.c |  2 +-
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 9245add23b5d..70e1096a4fe9 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -242,18 +242,29 @@ int host1x_intr_add_action(struct host1x *host, struct host1x_syncpt *syncpt,
 	return 0;
 }
 
-void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref)
+void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref,
+			 bool flush)
 {
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
+
+	if (flush) {
+		/* Wait until any concurrently executing handler has finished. */
+		while (atomic_read(&waiter->state) != WLS_HANDLED)
+			cpu_relax();
+	}
 
 	kref_put(&waiter->refcount, waiter_release);
 }
diff --git a/drivers/gpu/host1x/intr.h b/drivers/gpu/host1x/intr.h
index aac38194398f..6ea55e615e3a 100644
--- a/drivers/gpu/host1x/intr.h
+++ b/drivers/gpu/host1x/intr.h
@@ -74,8 +74,10 @@ int host1x_intr_add_action(struct host1x *host, struct host1x_syncpt *syncpt,
  * Unreference an action submitted to host1x_intr_add_action().
  * You must call this if you passed non-NULL as ref.
  * @ref the ref returned from host1x_intr_add_action()
+ * @flush wait until any pending handlers have completed before returning.
  */
-void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref);
+void host1x_intr_put_ref(struct host1x *host, unsigned int id, void *ref,
+			 bool flush);
 
 /* Initialize host1x sync point interrupt */
 int host1x_intr_init(struct host1x *host, unsigned int irq_sync);
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 5982fdf64e1c..e48b4595cf53 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -293,7 +293,7 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 		}
 	}
 
-	host1x_intr_put_ref(sp->host, sp->id, ref);
+	host1x_intr_put_ref(sp->host, sp->id, ref, true);
 
 done:
 	return err;
-- 
2.30.0

