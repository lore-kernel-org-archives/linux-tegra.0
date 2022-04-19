Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A717CC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Apr 2022 14:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353385AbiDSOcF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Apr 2022 10:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353388AbiDSOb6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Apr 2022 10:31:58 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A263969D
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:15 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id c6so21504663edn.8
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Xaf32XQyDZ8QYQCnwiTlgKZWDM1IMpdpv//PRxZMXk=;
        b=GCARkzT4fK+7wMOJVBhua/HKDHTNgwFfSq/EVlETHWevvSHOMUtFII2DjrorFPHzNL
         EIrUhZ1xOkrwVikMFQ5ks5VnUyV3coqSMGUqVAifke8DNXsNn+01UlsyKNpXmPA0DyOE
         ru2H2ki/wyCzK7bOvECWsdwHPOz3zkWudNZt0VQF7keQaLd0jkSTf/mmbWpG+1typVSh
         kLYX9v5GvTTGjTY4X7XdY0LPiOHGtoEcNaHCjrWNZarjF2TYn2j/tC1yJ+Z5AW7m87Ig
         +VpAhR4jmMxs1ammvXynVTavkuA/ASm2nvHKXryHqn8KSuszW85Psp8J43nsJEjW7tkf
         5xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Xaf32XQyDZ8QYQCnwiTlgKZWDM1IMpdpv//PRxZMXk=;
        b=IqfRkui4qRdZ/zbY9aQ4ubdJq1IJGzf9OLMl4rXCoD/nwkcSvBCWUnjnRzczIt9ttA
         FIVm8qO1PAbhtrYXdL7yIpR+782l7tBWgmX0Y2wj1b4qHcwjiQAWpEGy2yGgi7lSEv9I
         53amIqoz97ujHc9UEnHYk/ueB0hXWqoI6LTtYWqt0oFUFUlkcN8K5dfizVjTRX5W43Bs
         27n8pMvM71GOPbkITzeCWRwxJVO+2nmGTcc/5YCk+80ci6VPhX38u8LDfs7/ybquCsba
         vwUGcDIQCPNithG92KO7X+h6b9HMOSoCDx/QS41deZp9Go0kCQs3tvuhyJ2dV8VYdiAv
         OknA==
X-Gm-Message-State: AOAM531Jucyc8GTyf/pVekfWNTEtepPflBqj5EeZuCZGSzLsd5l9dYsg
        eH3SFnRWLyuPf8bQkxGGxwhoNw==
X-Google-Smtp-Source: ABdhPJxhoR39yBkgFdAmsTZlfj1q7CBAj5277XMOoRYvTDCepjkbTVC3aYKFRBXGkw4xOpDRtV/Ygw==
X-Received: by 2002:aa7:c789:0:b0:413:605d:8d17 with SMTP id n9-20020aa7c789000000b00413605d8d17mr17766287eds.100.1650378553673;
        Tue, 19 Apr 2022 07:29:13 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906b10a00b006e1004406easm5761884ejy.93.2022.04.19.07.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 07:29:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Markus Mayer <mmayer@broadcom.com>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 6/7] memory: brcmstb_dpfe: simplify platform_get_resource_byname()
Date:   Tue, 19 Apr 2022 16:28:58 +0200
Message-Id: <20220419142859.380566-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419142859.380566-1-krzysztof.kozlowski@linaro.org>
References: <20220419142859.380566-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource_byname() instead of
platform_get_resource_byname() and devm_ioremap_resource().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/brcmstb_dpfe.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
index 14412002775d..76c82e9c8fce 100644
--- a/drivers/memory/brcmstb_dpfe.c
+++ b/drivers/memory/brcmstb_dpfe.c
@@ -857,7 +857,6 @@ static int brcmstb_dpfe_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct brcmstb_dpfe_priv *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -869,22 +868,19 @@ static int brcmstb_dpfe_probe(struct platform_device *pdev)
 	mutex_init(&priv->lock);
 	platform_set_drvdata(pdev, priv);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dpfe-cpu");
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource_byname(pdev, "dpfe-cpu");
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "couldn't map DCPU registers\n");
 		return -ENODEV;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dpfe-dmem");
-	priv->dmem = devm_ioremap_resource(dev, res);
+	priv->dmem = devm_platform_ioremap_resource_byname(pdev, "dpfe-dmem");
 	if (IS_ERR(priv->dmem)) {
 		dev_err(dev, "Couldn't map DCPU data memory\n");
 		return -ENOENT;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dpfe-imem");
-	priv->imem = devm_ioremap_resource(dev, res);
+	priv->imem = devm_platform_ioremap_resource_byname(pdev, "dpfe-imem");
 	if (IS_ERR(priv->imem)) {
 		dev_err(dev, "Couldn't map DCPU instruction memory\n");
 		return -ENOENT;
-- 
2.32.0

