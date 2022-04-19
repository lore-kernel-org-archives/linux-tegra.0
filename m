Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AF6C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Apr 2022 14:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353386AbiDSOcF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Apr 2022 10:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353385AbiDSOb6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Apr 2022 10:31:58 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D995038DB8
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:13 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id lc2so33264076ejb.12
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i/hN55LeSGds7voIOUUoPsxviI3bjusf3r96NnDo1ow=;
        b=erc++na5IYszO5wD8taOo41/Sz64NrybRt5aDQ637rH+Ye2Hxzm8HHUbZd8DwQgcrc
         oLKz/qmjWVgptv4zdgb+jWJQuh2VzG+y97ql+s9Cemx+YtjY1bAgSbuz2qc2uNDTcnxE
         ZBp19VX7rDBux4a8y/vHiFalDlOUpRRTdPNcqcxF6BM1Hm/YPz8A5LACIQeR0nrDr4b3
         BlE7zCxwyfStUbGKZhVFrZH4J/92UGg5Aq/1bKmMYAr/Pt9oky2gVvoVnAWvVNoSY7w7
         7hL5n/ow2UEPRI8OTRqNAHBT0ws+XPbo7qGS/AYiMQCBt35EcMa3OjiVdZL1Fw35c8tl
         Ihug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i/hN55LeSGds7voIOUUoPsxviI3bjusf3r96NnDo1ow=;
        b=irdCQWyeqflm2R6sp7dglHsffd2PHXnEKDy8Ogg9+D1wiHvaBMXUiBN/33psY/cvEC
         w4jaYLodVgsoEyqHHTvkUdvC8j9D4slhkmod3LTM2hMJBKCQuv6I77Ft0nzj8IaU4NWR
         I58ak8m4XnnOD0miT0gDPU144MbprwImbgRZWkpn/hcWWcjE8XK9fL8Vbz7raVCMUvd1
         h3C+jAluovQwDQP7hIfb+y0AiDyBW+G7MQZ49nshfnHEBQChXaqWwRvHeFPjM0dNPgcZ
         wGdWLEXwPqUYHOZiu+BGlVXThWrkT/7O6hHheJjtsBx9i5rDv4WsZSp1opmjcF9rsx3L
         5nGQ==
X-Gm-Message-State: AOAM533lpodVrIQZV0JEY8msQSTXftM4t+bh3+VM8hHPs4Cr0BeL7chu
        ZKoruwJMMIl8i43cVkcy267zEshd61Pr6Q==
X-Google-Smtp-Source: ABdhPJzA/phqkEgE3akbqqYpR+ZmzvEjslSTWMBd8zP7oXLh9y3yzspwHeL2fRi5vV+x4YEpvDUobg==
X-Received: by 2002:a17:907:7811:b0:6ef:a896:b407 with SMTP id la17-20020a170907781100b006efa896b407mr9053271ejc.645.1650378552458;
        Tue, 19 Apr 2022 07:29:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906b10a00b006e1004406easm5761884ejy.93.2022.04.19.07.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 07:29:11 -0700 (PDT)
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
Subject: [PATCH 5/7] memory: tegra: mc: simplify platform_get_resource()
Date:   Tue, 19 Apr 2022 16:28:57 +0200
Message-Id: <20220419142859.380566-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419142859.380566-1-krzysztof.kozlowski@linaro.org>
References: <20220419142859.380566-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() instead of platform_get_resource()
and devm_ioremap_resource().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/mc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index bf3abb6d8354..580e0987e5cd 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -719,7 +719,6 @@ static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
 
 static int tegra_mc_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct tegra_mc *mc;
 	u64 mask;
 	int err;
@@ -744,8 +743,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	/* length of MC tick in nanoseconds */
 	mc->tick = 30;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mc->regs = devm_ioremap_resource(&pdev->dev, res);
+	mc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mc->regs))
 		return PTR_ERR(mc->regs);
 
-- 
2.32.0

