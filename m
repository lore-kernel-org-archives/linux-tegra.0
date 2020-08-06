Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36D1C433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:18:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CF54221E4
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:18:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7IVeb5V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgHFQSm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 12:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgHFQRX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 12:17:23 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21368C0F26C6
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:47:36 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id di22so28323888edb.12
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nLq3/R3B/Bs7i1xyWXouD50ckZ3IdU6H73XFc0RzNqU=;
        b=r7IVeb5V3rQ7PjXDc5E09ALkqa3y28KDU1C+uk6A9EOwxpSael7R1V78JihJThNKbc
         fGZuY1dUVCGKkMTWemiMcapVQ03l9R/nAG2W2MmZpQdF7bdcO2mu5FvLRwtPWT7bTuOw
         3yDUYuOSRgOtllBZfztbYUKBoOexBTfk+txrM3W9LaaBJCOUyeO2gftMfNALAmqfO8md
         3Oq9piRTEckH1pUbojbW/u7WD1SwCN5puNLRAzuSe6y2SG9aHC3OQi3+OMOXDqKUnAft
         6km7Z0OAsNLJUi9EL9oYhtl0YLiWP3hvqXhL6665Jesju2IePu3LZfEXP2sQHmPwtZRU
         NAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nLq3/R3B/Bs7i1xyWXouD50ckZ3IdU6H73XFc0RzNqU=;
        b=SbAzgZS65pChl5CfCEI/cD92GfK/5tOu4WD336gCtNFRf9iF/ZkZBBFbOc0ffYNZnB
         Hjk1uURlcPe801FaGgZax+TcHOB39I0bHe7m4W5E7LWnQG+u0JKKeqk7PcLlsF3WN3sJ
         evaO3EqHevcLCgjbyL1dlcpRj2IH0t5z/IaxfuB4zixAC6Q0ZIHNdf0r1IdAmMXVB4iS
         /YB7Nygb1pns//hCqkGamlsitSVF0TI5xSVTLK1IZHe4oMBAAYXhQ7aNrpwVwfmraiIS
         mV1UrqN31H4AcUGzrM148PVipuR5dAczJD1FX1YenkyHIqClmIsgzQp2hqiST1Z/iqX3
         BKkA==
X-Gm-Message-State: AOAM5336DHJqOwNULt6xVh/dWmtoKoUNHszt8ZAFtFjYlzCEl9AEabKi
        ZfxLcbro+wyoUeS3VwRLcSA=
X-Google-Smtp-Source: ABdhPJz+QIzxLt9aaDspcJbe9CqTN90TYeRKWfqHikZphwICsiTy8nTYschoDetBTLUSxzk5kwA4Nw==
X-Received: by 2002:a05:6402:308e:: with SMTP id de14mr4573955edb.344.1596728854859;
        Thu, 06 Aug 2020 08:47:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id qp16sm4064854ejb.89.2020.08.06.08.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:47:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: Properly reference count the DDC I2C adapter
Date:   Thu,  6 Aug 2020 17:47:31 +0200
Message-Id: <20200806154731.3935679-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the of_get_i2c_adapter_by_node(), which is similar to the existing
call to of_find_i2c_adapter_by_node() except that it also takes a
reference to the owner module of the I2C adapter. In order to properly
balance this out, call i2c_put_adapter() to release the reference to the
I2C adapter and its owner module.

For the special case where the DDC comes from the DPAUX, care must be
taken to perform the same steps (i.e. get_device() and module_get()) so
that the reference counts are all balanced.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/output.c | 4 ++--
 drivers/gpu/drm/tegra/sor.c    | 7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index e36e5e7c2f69..03382550f7d9 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -112,7 +112,7 @@ int tegra_output_probe(struct tegra_output *output)
 
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
 	if (ddc) {
-		output->ddc = of_find_i2c_adapter_by_node(ddc);
+		output->ddc = of_get_i2c_adapter_by_node(ddc);
 		if (!output->ddc) {
 			err = -EPROBE_DEFER;
 			of_node_put(ddc);
@@ -173,7 +173,7 @@ void tegra_output_remove(struct tegra_output *output)
 		free_irq(output->hpd_irq, output);
 
 	if (output->ddc)
-		put_device(&output->ddc->dev);
+		i2c_put_adapter(output->ddc);
 }
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 45b5258c77a2..e88a17c2937f 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3728,7 +3728,12 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		if (!sor->aux)
 			return -EPROBE_DEFER;
 
-		sor->output.ddc = &sor->aux->ddc;
+		if (get_device(&sor->aux->ddc.dev)) {
+			if (try_module_get(sor->aux->ddc.owner))
+				sor->output.ddc = &sor->aux->ddc;
+			else
+				put_device(&sor->aux->ddc.dev);
+		}
 	}
 
 	if (!sor->aux) {
-- 
2.27.0

