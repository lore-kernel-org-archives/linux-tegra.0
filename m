Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F740C47095
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C82D21707
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="Ed1pwWwz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgJGRRW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgJGRRW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 13:17:22 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44860C0613D4
        for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2020 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=i/7/g1PRkIJM6Xoc+sbE8KPMhR9f/37J5pomP1CswCk=; b=Ed1pwWwzW6Zx1PtkyT/4QHGTnV
        f5TSre8pywuy8yxr+lQ/8pj67bTD8++1euQlTpvXFezzQ/BzcTSSJREzQ6mJmhiiJjofA7QAgtLkc
        U3qD3jZ2sM0XGbXai7/lnaZCYTty2NxPZrblKqXIVsFquuom9XZphzbVjSNBOkexyk9r/VO8qIPO/
        E3QR7XR1OcBvNP3xF+411aiqrv9lk93AlRFiro1RZky25SasJUTHiv2WULteeRkLdJGBG3nxprr58
        6q4FhFYjux9TQbXmxRb77QlFWB5LWfjt0OIWtpIdu1cNWpfKp6gEroUiFQ/F5quhCxomP18Mzgp+e
        7WVK5mSw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kQD3z-0006P9-Ij; Wed, 07 Oct 2020 20:17:15 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 01/20] gpu: host1x: Use different lock classes for each client
Date:   Wed,  7 Oct 2020 20:12:19 +0300
Message-Id: <20201007171238.1795964-2-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
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
index e201f62d62c0..4101f64bd545 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -714,13 +714,14 @@ EXPORT_SYMBOL(host1x_driver_unregister);
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
@@ -741,7 +742,7 @@ int host1x_client_register(struct host1x_client *client)
 
 	return 0;
 }
-EXPORT_SYMBOL(host1x_client_register);
+EXPORT_SYMBOL(__host1x_client_register);
 
 /**
  * host1x_client_unregister() - unregister a host1x client
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 20c885d0bddc..f711fc0154f4 100644
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
2.28.0

