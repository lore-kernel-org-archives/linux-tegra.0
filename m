Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34D5C433E5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 816876193A
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhC2Nji (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 09:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbhC2NjO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 09:39:14 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D52C061762
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=f9Inzt/UTHwcOAChqdBpMG3c7gbBJxghJWvMshOIwhc=; b=TEPxHAumcI31jCdHBuLNxHA20d
        qXPFOZ8vcutiX28Ly8/7oo818uNyoARdAaOTkiPznkmK6ei+Dq+i3c9C1levuGE0UM+2x8uz0etqL
        GrwTp3s4eLMVLnmjvzoEoL5Iy2x2616FxqIEU9iyZZRdEBaMmBUxLJYKKkXHwsYnTt2e8hyEhVXxn
        x6YhneFD5tWWz2DCGg49ndgaJw32ZLKxnTQm6BVCJni0RHwHPWCZWIDQJpa0HzTUDoRSiNJvJUfnp
        AKBEDRPIC2pwVSLd9mMuE+e1jKvqQEFBKM+m7y5KoynQNRZyAZ+FtKyg/Tw6wafo0WOILiBDDaJuq
        1ZrgV44g==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lQs6n-0000Yj-HR; Mon, 29 Mar 2021 16:39:09 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 04/10] gpu: host1x: Remove cancelled waiters immediately
Date:   Mon, 29 Mar 2021 16:38:30 +0300
Message-Id: <20210329133836.2115236-5-mperttunen@nvidia.com>
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

Before this patch, cancelled waiters would only be cleaned up
once their threshold value was reached. Make host1x_intr_put_ref
process the cancellation immediately to fix this.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
* Call schedule instead of cpu_relax while waiting for pending
  interrupt processing
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
index 9245add23b5d..69b0e8e41466 100644
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
+			schedule();
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
index 9a113016d482..f061dfd5bbc7 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -308,7 +308,7 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 		}
 	}
 
-	host1x_intr_put_ref(sp->host, sp->id, ref);
+	host1x_intr_put_ref(sp->host, sp->id, ref, true);
 
 done:
 	return err;
-- 
2.30.1

