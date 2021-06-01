Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663FEC47080
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50669613BD
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234649AbhFASAQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhFASAP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:00:15 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF06CC061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 10:58:32 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id b17so18547203ede.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QZjJ1Jj43kcB8s7MAuwlEr9IF+Uv4/q6F49ZYEymJc4=;
        b=DI6RVVtcr9D/rN61x9YRQ4baVSQj+szKZWc2EpLjb7BBszxWHSjZIuIcTn7Xs8jHWc
         dtht2l9UD4WH0UU4HNFmW8fTlGL16ualeSdRTUjQY0Xh74mVMF4BZALA3fZTYD/8Bogg
         CtKAm8EjJwfwb+8/GCgAOxOdvJrTEvdy7160D7yUmnVv3WX3rkraEvV6hsdO02yZ7Czb
         jhvxcHH+MpNtmtV3jvoYPtxSBtlplZGC7Qd/K30oY2nUrjvruMoI9eVm1RQs9SB4lE2K
         zoTPH44MrrndRFJjO0yZXVAolsn5IKl1kqY11tTxGLvJuMatb9TrC5FTjpeF5sfRs/zY
         QaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QZjJ1Jj43kcB8s7MAuwlEr9IF+Uv4/q6F49ZYEymJc4=;
        b=ojzOWT+egcrdXZ/XdvfTRU+a66ltl5FSdtT7TeZN8vyv82VDsgZffrhs8QfxarXqgm
         8bqwpk3NYGM22KYsQBEem4lnchtglsaXGV9UZO8MP5eFCrCVQIk98hGQum5RATAAzb0p
         kJbBUJREYIS4QgAcEDqv/iGhzDaLGp9S4CZvD/nKx0mGG5PFxT4fFFwc/XrkDYcNcL0b
         GS9Zu4EfjDIkhkjgSaXB7p6vtNLY3CJyEo3EaoJ5vYz2myBHQrZueJwT7/Z7GLZ8jND3
         UIl7AFtuiw15fMdgaDz6o8cz08HRECCb0z6N5akr7bcxz1af+3XCdYBS0ymZwdE9tFIz
         Hh/Q==
X-Gm-Message-State: AOAM5324aC3R9jaHrRIlIFdwTeK8SyGbiPmVaBo09jxjjRNv0XFu7YG8
        UJyGmBF2gjUrrd2bchNtIuU=
X-Google-Smtp-Source: ABdhPJyM87r0TnO/x9r5tHSaV217YJSbs7lDsrBxYyOeQhrQnmF2pZ87Lbb4t5EhY9N2mLzGf08Nng==
X-Received: by 2002:aa7:c7cd:: with SMTP id o13mr34384552eds.269.1622570311497;
        Tue, 01 Jun 2021 10:58:31 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i2sm8477160edc.96.2021.06.01.10.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:58:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/12] memory: tegra: Make IRQ support opitonal
Date:   Tue,  1 Jun 2021 19:59:38 +0200
Message-Id: <20210601175942.1920588-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601175942.1920588-1-thierry.reding@gmail.com>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Make IRQ support optional to help unify the Tegra186 memory controller
driver with this one.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- new patch

 drivers/memory/tegra/mc.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6725df851079..b14b0333b623 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -750,20 +750,22 @@ static int tegra_mc_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	mc->irq = platform_get_irq(pdev, 0);
-	if (mc->irq < 0)
-		return mc->irq;
+	if (mc->soc->ops && mc->soc->ops->handle_irq) {
+		mc->irq = platform_get_irq(pdev, 0);
+		if (mc->irq < 0)
+			return mc->irq;
 
-	WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
+		WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
-	mc_writel(mc, mc->soc->intmask, MC_INTMASK);
+		mc_writel(mc, mc->soc->intmask, MC_INTMASK);
 
-	err = devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq, 0,
-			       dev_name(&pdev->dev), mc);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
-			err);
-		return err;
+		err = devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq, 0,
+				       dev_name(&pdev->dev), mc);
+		if (err < 0) {
+			dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
+				err);
+			return err;
+		}
 	}
 
 	err = tegra_mc_reset_setup(mc);
-- 
2.31.1

