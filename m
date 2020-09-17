Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EFBC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC94F208DB
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tQSs3303"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgIQKIh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgIQKIe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263E6C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z1so1421634wrt.3
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TiJR36A6WzVMF6xqdDOcepS7F4dEZ9OVgowRWFZ1uks=;
        b=tQSs3303aEdukcfpHyNesIC7F63IBi+loPYOYanS55q/KqNEMlKQyZJOqWW+PDaIdy
         Hzl3dmK1CsDW3oNj4JMtelUVB2zs2H+s2LfZFYJ8a1BAp3lVK0SlCl3LKFcr1Rg7ectM
         QkdA535G27LaZOykS9/XPKmtEJkM52bEgyitkf8ubOYdWMAjTu9zqftA5WbZ4aXOaLj+
         2W2+r58U0BMhzBzrRCwwhxGQjSRFZx1MC83qMtwkOw2V46YrAzqqCFOLRCKzO4cEq/5g
         oI86hCCnPTqZtN82QvnmAt/wb3RBr/FbyVi464WaR/JxJy6q1nUfzm8TcdLHGQA9+B9+
         ORFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TiJR36A6WzVMF6xqdDOcepS7F4dEZ9OVgowRWFZ1uks=;
        b=Ky0mqEOjdhUO7upbcEX+RBxd0NJA9/P/R6k/yrquk+L/+jBpo7VZqSgYXxt2MwxVtl
         fAp911/omKzCHdHKirCpnIx5mN6TUF4SQSQAyJu6y/oOGqaoo8v3lKz/jGClppamKCGd
         OZJcDBpL4nUxjq7M87GxKBfl76z8HzBrgA3P5JgHsIeh//VinD/AivLqWJS8J7/khuz/
         ZyU5ANVzEXsWG9qf4gW/40VziAPk1zAU+iBl42V/0K3VsMtT21ECwPqvdPYfJX10KQfQ
         ER5OW9u4NWectW7aujFONjL+gu+dpcloeNzAmJn+UJs6+Q+wv9uNNRg5PvdGdezYWqCh
         9F+g==
X-Gm-Message-State: AOAM530jXylom+bPLQ5f+Hx0AhPozrwXn38P3/OhA8IkfODjikP/y6R8
        juLMIlndpZi7i9mL63Wdy6M=
X-Google-Smtp-Source: ABdhPJzKfbB/ieqKnYMMtGHW2A1dx/j0OzK0xW4LCwmh8FFA4m8tRA17CVIdhPuORy0L8AIxISw+kA==
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr26392211wrc.93.1600337312861;
        Thu, 17 Sep 2020 03:08:32 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id h76sm11507895wme.10.2020.09.17.03.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 13/14] firmware: tegra: Enable BPMP support on Tegra234
Date:   Thu, 17 Sep 2020 12:07:51 +0200
Message-Id: <20200917100752.3516153-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Enable support for the BPMP on Tegra234 to avoid relying on Tegra194
being enabled to pull in the needed OF device ID table entry.

On simulation platforms the BPMP hasn't booted up yet by the time we
probe the BPMP driver and the BPMP hasn't had a chance to mark the
doorbell as ringable by the CCPLEX. This corresponding check in the
BPMP driver will therefore fail. Work around this by disabling the
check on simulation platforms.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 3 ++-
 drivers/mailbox/tegra-hsp.c   | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 4d93d8925e14..0742a90cb844 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -856,7 +856,8 @@ static const struct tegra_bpmp_soc tegra210_soc = {
 
 static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 834b35dc3b13..e07091d71986 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -13,6 +13,8 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 
+#include <soc/tegra/fuse.h>
+
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 
 #include "mailbox.h"
@@ -322,7 +324,12 @@ static int tegra_hsp_doorbell_startup(struct mbox_chan *chan)
 	if (!ccplex)
 		return -ENODEV;
 
-	if (!tegra_hsp_doorbell_can_ring(db))
+	/*
+	 * On simulation platforms the BPMP hasn't had a chance yet to mark
+	 * the doorbell as ringable by the CCPLEX, so we want to skip extra
+	 * checks here.
+	 */
+	if (tegra_is_silicon() && !tegra_hsp_doorbell_can_ring(db))
 		return -ENODEV;
 
 	spin_lock_irqsave(&hsp->lock, flags);
-- 
2.28.0

