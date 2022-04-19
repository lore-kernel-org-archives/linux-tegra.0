Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A76C43217
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Apr 2022 14:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353388AbiDSOcH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Apr 2022 10:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353401AbiDSOcB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Apr 2022 10:32:01 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFF4396BE
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:16 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 11so16489660edw.0
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xWS9zh5KMUXIqFZALN21cYcGLfXB3BzUXuFD0a0fUOw=;
        b=aLV9hLaJJ0NaAlRkO0aHQgwZPtV2CafANhXdezXlvGXflg0FXgSZKgiFBo5azgdpoe
         iBsB2CHPZElvVUvAhCQ3YTfehyZNBGF/wZ8qHQY31N/Z50eaxl1riMkeh9PUq+zVURKW
         tXd2/Ec5cDNI8Bfqi8RcV/4NeeTvpgkhiQ77dO0LlWLWI36dyTvhAelFG86MD/MncwRX
         EN5nuCJ6EflxmGNk9yKMixNIqf4J5Ypj2faFSv2VXc6uNHhqhcNNEBiamuJTDaw1zsUx
         u8BjjM1d/7Jm9SbC9x48/U0ZqLOxSwiu+NQ6eazi7QF2U/gsIx6Iw8lOKImpLy81KsZa
         y2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xWS9zh5KMUXIqFZALN21cYcGLfXB3BzUXuFD0a0fUOw=;
        b=U09b+ZD5YwjX/11uimfQzuPEwrqmZYwCc0gkzjibx+2BFE0PIP9bmSnAFzFcKfa9/Q
         KqHeu3wit6OP2ehE3TJ4xrIwpgFEabyLHl3eLu2smCC+CB8Adx0mqPNQhZMNkmMpKR9E
         SLUkSKuaaOqBLB+PDlfaZ4Vw4CH73fZtOcN3/Gno8YG6c5HvwE1eMsT07vr8UJkI2DzR
         DGeVVGzZ8FGfFlLNqN3ATgad0bdoLTfUs+egjavtcuTkp/j/QUvw0nbrLQP6hQh9tDOv
         0wSgnRs8s3hYacEwKE4lOMqVoP/+MkYd8NAd6bkWOC8v26lv5Z/YrhrRXy4X4B7038Nn
         4uUg==
X-Gm-Message-State: AOAM530r+ifNGcJq7kpOl5c6fa9xvlNiWnAkKB2kGlXbrZbVk/fJcu3Y
        7KWyMQZwlx0aXbXd4dA73CGLfw==
X-Google-Smtp-Source: ABdhPJzkzsncCIKBUOGljWWovNy5FkPnFo0osExDv5Sz3kp3CcXwRLh62x+x0uhbvqikml8HwNYnRw==
X-Received: by 2002:a05:6402:1e8c:b0:424:1d6:1b71 with SMTP id f12-20020a0564021e8c00b0042401d61b71mr3019255edf.211.1650378554873;
        Tue, 19 Apr 2022 07:29:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906b10a00b006e1004406easm5761884ejy.93.2022.04.19.07.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 07:29:14 -0700 (PDT)
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
Subject: [PATCH 7/7] memory: renesas-rpc-if: simplify platform_get_resource_byname()
Date:   Tue, 19 Apr 2022 16:28:59 +0200
Message-Id: <20220419142859.380566-7-krzysztof.kozlowski@linaro.org>
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
 drivers/memory/renesas-rpc-if.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index ba9c526833c0..4316988d791a 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -259,8 +259,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
 
 	rpc->dev = dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
-	rpc->base = devm_ioremap_resource(&pdev->dev, res);
+	rpc->base = devm_platform_ioremap_resource_byname(pdev, "regs");
 	if (IS_ERR(rpc->base))
 		return PTR_ERR(rpc->base);
 
-- 
2.32.0

