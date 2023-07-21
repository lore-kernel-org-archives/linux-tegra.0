Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A359C04A6A
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbjGUN6e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjGUN6b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:58:31 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD492D47;
        Fri, 21 Jul 2023 06:58:06 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-991c786369cso307560966b.1;
        Fri, 21 Jul 2023 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689947884; x=1690552684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsEowniGr6Wk6wqHwLPaL+irpr9VN82cw7vXn+mEKas=;
        b=RWwj3xr5hRerGmcDGrcpuQd8WhB4Fb7tIlxcnscETLspdHaygKJYBqvYdeB5un2c1k
         NRH2/zAiYU+ctJjD++uUX2GoP2i19sp7rPwr91vOdI7iGND7zL3weN3900BtafUu1Vz+
         Mg/f7oqcw1qEWE061XGGHNwxPIbDzLH8eLlMwc0hMZeURPVzG4Z499m6yVJ6zCzBIkz5
         rjRKx2o8ccBCoILM2FdLUwJFvgngzp9/boNAUrOwKq7GiTMQvR2QQ0UG7URozObNSHOa
         C5nwQYv+K+u4viumbkyhGSgUyw7tDSy3U8lwh/AYA7jBmy405cstqSB+DGO5Wy0ZrZBB
         npAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689947884; x=1690552684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsEowniGr6Wk6wqHwLPaL+irpr9VN82cw7vXn+mEKas=;
        b=CjKuUPCQNrCSrPFwHLeO0I4nYUwtzN2b60dGzDOUrRYCwi0UxqIdUg19wGsJvmaMcS
         AElSdD6VB0+vzCGCeAsK6XD+Y5lAlXxUx6tHggk0qJSUC++FnBCeewNliqMVKupEcCi3
         NMGydlwsINfCHioewtgTmXFRFQrsDOU0EwfosnBT+j+JiXDJJN5b7zsWGNjx+FTe4mUs
         l87XD3mro5rvQ3+GROfnHfmel2W6XDXxSg3ss9hNHmx7f0Ic7yGrW4wgVjLKlI8Nki2A
         qSV3r6uAGkpP+/AS1xbbMEdOwWmgOZyncldYhAse51N//FY6/Bqf63AZD4lBIdS2rnU9
         p5dw==
X-Gm-Message-State: ABy/qLY+pFzcChSq6TMm2j59C/XdOAezzIaFaYLekEm4BOyjepnqRLs4
        M5rHqUcKzxPy0M2Hn4XK14c=
X-Google-Smtp-Source: APBJJlGqoMAC1BN/Ut087B4UlQOOkbEWOPF3etl3CDHqx5Y+6s+utsxojN1JrjXHCuXwZJ7KP7IaQQ==
X-Received: by 2002:a17:907:2cd7:b0:99b:44aa:fae0 with SMTP id hg23-20020a1709072cd700b0099b44aafae0mr1617141ejc.21.1689947884440;
        Fri, 21 Jul 2023 06:58:04 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l2-20020a170906230200b00997e52cb30bsm2172733eja.121.2023.07.21.06.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:58:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 4/7] dt-bindings: arm: tegra: pmc: Increase maximum number of clocks per powergate
Date:   Fri, 21 Jul 2023 15:57:56 +0200
Message-ID: <20230721135759.2994770-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721135759.2994770-1-thierry.reding@gmail.com>
References: <20230721135759.2994770-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some powergate definitions need more than 8 clocks, so bump the number
up to 10, which is the current maximum in any known device tree file.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add Acked-by: from Rob

 .../devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index d6f2c5862841..a336a75d8b82 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -226,7 +226,7 @@ properties:
         properties:
           clocks:
             minItems: 1
-            maxItems: 8
+            maxItems: 10
 
           resets:
             minItems: 1
-- 
2.41.0

