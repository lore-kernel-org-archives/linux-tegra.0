Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E743FC4332E
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB7742225E
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 13:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbhAKNBM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jan 2021 08:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbhAKNBL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 08:01:11 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B2DC061795
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=OqxRZuGq+nQxSIuVBHS0l6WB/KvjVmglKennV/SG5As=; b=K/cT9NU3J3dt72xY1G/YTZukcU
        nNxY1uaYR1K3I5lkYLQwgul/QsxMEeJrtjDUR3wrX5L1P8fNwz8jJCftbI6HJd4yp2rcMqfMdxq8N
        HL2JhvfO+jiQ0/Cudv+Wan6cPd0uGquKFXoxuPWsuKwZq46drnozoJnSJ5fK7DQk7eSL5st9h0ygy
        +wltiVw6NKQT9/ooiEKP9nEy4PbbL4Y+WOTgUVVglqirQUadMd8lOhTVIA/oV+ruSdtqxFk/Syk0b
        pcr29F6XvveZiQNxJSnyQnbk28IWQtVQR8j9qus4mvI7MgJjSP6TReeCE6sQBoCDeZSMXkGAGltaE
        q9rwSUdQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kywo6-0002tl-8F; Mon, 11 Jan 2021 15:00:26 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each client
Date:   Mon, 11 Jan 2021 14:59:59 +0200
Message-Id: <20210111130019.3515669-2-mperttunen@nvidia.com>
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

To avoid false lockdep warnings, give each client lock a different
lock class, passed from the initialization site by macro.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 7 ++++---
 include/linux/host1x.h   | 9 ++++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 347fb962b6c9..8fc79e9cb652 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -715,13 +715,14 @@ EXPORT_SYMBOL(host1x_driver_unregister);
  * device and call host1x_device_init(), which will in turn call each client's
  * &host1x_client_ops.init implementation.
  */
-int host1x_client_register(struct host1x_client *client)
+int __host1x_client_register(struct host1x_client *client,
+			   struct lock_class_key *key)
 {
 	struct host1x *host1x;
 	int err;
 
 	INIT_LIST_HEAD(&client->list);
-	mutex_init(&client->lock);
+	__mutex_init(&client->lock, "host1x client lock", key);
 	client->usecount = 0;
 
 	mutex_lock(&devices_lock);
@@ -742,7 +743,7 @@ int host1x_client_register(struct host1x_client *client)
 
 	return 0;
 }
-EXPORT_SYMBOL(host1x_client_register);
+EXPORT_SYMBOL(__host1x_client_register);
 
 /**
  * host1x_client_unregister() - unregister a host1x client
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index ce59a6a6a008..9eb77c87a83b 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -320,7 +320,14 @@ static inline struct host1x_device *to_host1x_device(struct device *dev)
 int host1x_device_init(struct host1x_device *device);
 int host1x_device_exit(struct host1x_device *device);
 
-int host1x_client_register(struct host1x_client *client);
+int __host1x_client_register(struct host1x_client *client,
+			     struct lock_class_key *key);
+#define host1x_client_register(class) \
+	({ \
+		static struct lock_class_key __key; \
+		__host1x_client_register(class, &__key); \
+	})
+
 int host1x_client_unregister(struct host1x_client *client);
 
 int host1x_client_suspend(struct host1x_client *client);
-- 
2.30.0

