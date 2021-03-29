Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A33BC433C1
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 257E861554
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 13:40:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhC2Njh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 09:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbhC2NjO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 09:39:14 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA034C061765
        for <linux-tegra@vger.kernel.org>; Mon, 29 Mar 2021 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Y8sw1XxK06mKxaePjeh8dSuXLB2jOtsRYHlBVaplXoY=; b=0zcoaLuHynfgkl5yGndMKm4Ois
        YDJRQs1OnIyQIYafZvC+Gd3grfCjJr+uyUVmzZHrGzoij6KqfBx6WVVeCq60+vUCJzywYhpn/4Xkk
        FPLZBih1twYzkKtqGt3RTFkcOgeEiRusATGlspuae9dr0MHtwzN+Z9rdUTPxaSZtrgNBDZjvVd2g8
        nhc8UczV8FrxhE+Pp1iMAKrBFd3qQLB4ElTL2IuhLB+pz4Bj7sJSEdySoxi3icn15Eid/ec5arHVg
        1j5cpx9xdhgszNaX7OHClBvVaOnsXuCnrNTLpwrOjbnRkHwlJCF4/go40t1KB5Kk1XiIHfZ5a0hvg
        als17awg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lQs6n-0000Yj-Dy; Mon, 29 Mar 2021 16:39:09 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 02/10] gpu: host1x: Allow syncpoints without associated client
Date:   Mon, 29 Mar 2021 16:38:28 +0300
Message-Id: <20210329133836.2115236-3-mperttunen@nvidia.com>
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

Syncpoints don't need to be associated with any client,
so remove the property, and expose host1x_syncpt_alloc.
This will allow allocating syncpoints without prior knowledge
of the engine that it will be used with.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
* Add kerneldoc
* Return error if a NULL name was specified
v3:
* Clean up host1x_syncpt_alloc signature to allow specifying
  a name for the syncpoint.
* Export the function.
---
 drivers/gpu/host1x/syncpt.c | 37 +++++++++++++++++++++++++------------
 drivers/gpu/host1x/syncpt.h |  1 -
 include/linux/host1x.h      |  3 +++
 3 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index fce7892d5137..9a113016d482 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -42,13 +42,28 @@ static void host1x_syncpt_base_free(struct host1x_syncpt_base *base)
 		base->requested = false;
 }
 
-static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
-						 struct host1x_client *client,
-						 unsigned long flags)
+/**
+ * host1x_syncpt_alloc() - allocate a syncpoint
+ * @host: host1x device data
+ * @flags: bitfield of HOST1X_SYNCPT_* flags
+ * @name: name for the syncpoint for use in debug prints
+ *
+ * Allocates a hardware syncpoint for the caller's use. The caller then has
+ * the sole authority to mutate the syncpoint's value until it is freed again.
+ *
+ * If no free syncpoints are available, or a NULL name was specified, returns
+ * NULL.
+ */
+struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
+					  unsigned long flags,
+					  const char *name)
 {
 	struct host1x_syncpt *sp = host->syncpt;
+	char *full_name;
 	unsigned int i;
-	char *name;
+
+	if (!name)
+		return NULL;
 
 	mutex_lock(&host->syncpt_mutex);
 
@@ -64,13 +79,11 @@ static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 			goto unlock;
 	}
 
-	name = kasprintf(GFP_KERNEL, "%02u-%s", sp->id,
-			 client ? dev_name(client->dev) : NULL);
-	if (!name)
+	full_name = kasprintf(GFP_KERNEL, "%u-%s", sp->id, name);
+	if (!full_name)
 		goto free_base;
 
-	sp->client = client;
-	sp->name = name;
+	sp->name = full_name;
 
 	if (flags & HOST1X_SYNCPT_CLIENT_MANAGED)
 		sp->client_managed = true;
@@ -87,6 +100,7 @@ static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 	mutex_unlock(&host->syncpt_mutex);
 	return NULL;
 }
+EXPORT_SYMBOL(host1x_syncpt_alloc);
 
 /**
  * host1x_syncpt_id() - retrieve syncpoint ID
@@ -401,7 +415,7 @@ int host1x_syncpt_init(struct host1x *host)
 	host1x_hw_syncpt_enable_protection(host);
 
 	/* Allocate sync point to use for clearing waits for expired fences */
-	host->nop_sp = host1x_syncpt_alloc(host, NULL, 0);
+	host->nop_sp = host1x_syncpt_alloc(host, 0, "reserved-nop");
 	if (!host->nop_sp)
 		return -ENOMEM;
 
@@ -423,7 +437,7 @@ struct host1x_syncpt *host1x_syncpt_request(struct host1x_client *client,
 {
 	struct host1x *host = dev_get_drvdata(client->host->parent);
 
-	return host1x_syncpt_alloc(host, client, flags);
+	return host1x_syncpt_alloc(host, flags, dev_name(client->dev));
 }
 EXPORT_SYMBOL(host1x_syncpt_request);
 
@@ -447,7 +461,6 @@ void host1x_syncpt_free(struct host1x_syncpt *sp)
 	host1x_syncpt_base_free(sp->base);
 	kfree(sp->name);
 	sp->base = NULL;
-	sp->client = NULL;
 	sp->name = NULL;
 	sp->client_managed = false;
 
diff --git a/drivers/gpu/host1x/syncpt.h b/drivers/gpu/host1x/syncpt.h
index 8e1d04dacaa0..3aa6b25b1b9c 100644
--- a/drivers/gpu/host1x/syncpt.h
+++ b/drivers/gpu/host1x/syncpt.h
@@ -33,7 +33,6 @@ struct host1x_syncpt {
 	const char *name;
 	bool client_managed;
 	struct host1x *host;
-	struct host1x_client *client;
 	struct host1x_syncpt_base *base;
 
 	/* interrupt data */
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9eb77c87a83b..7137ce0e35d4 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -154,6 +154,9 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 struct host1x_syncpt *host1x_syncpt_request(struct host1x_client *client,
 					    unsigned long flags);
 void host1x_syncpt_free(struct host1x_syncpt *sp);
+struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
+					  unsigned long flags,
+					  const char *name);
 
 struct host1x_syncpt_base *host1x_syncpt_get_base(struct host1x_syncpt *sp);
 u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
-- 
2.30.1

