Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25C5C77B76
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Apr 2023 22:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233754AbjDUWcX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Apr 2023 18:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233897AbjDUWcD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Apr 2023 18:32:03 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E26A30D2
        for <linux-tegra@vger.kernel.org>; Fri, 21 Apr 2023 15:31:55 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94f1d0d2e03so299258266b.0
        for <linux-tegra@vger.kernel.org>; Fri, 21 Apr 2023 15:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682116314; x=1684708314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ikgfKWd5j9eJ+n4oOSpchtAyPf2HU4vbB61uGglqV1k=;
        b=AtGAQtK2tuG3D6OZu2TboiKtIaXNzBvBtfo6WL7a779+GIfd/lY3hjY0BVsIQIrKBR
         2Ctgk6cN9N52tW/lRsrS14GgbSRnB7GDCZZB2njO1i5565dh2TOZ+i9vtUH6teakeb/J
         QLm1duysZF8ws5S1hQk1KZvHy12OvEVFRxOIHWZ0qzhmvSyfpa9vR4y1DFuQUFNZN7/w
         BMyQxvzz1KJbIqqfkcsib1h8w+f80bssKo9ca6xcA+Muc0QdMNYK0J0b6hDUMtisFG9u
         O+vA0BoLGb+Vt+Abe6Ugs7ua6u0htfkT/yfJ2GgCz5UecIYM+ApQmmS6KZcdGcgLSNey
         jW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682116314; x=1684708314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikgfKWd5j9eJ+n4oOSpchtAyPf2HU4vbB61uGglqV1k=;
        b=dzPOQwu6r1HmL3OESl0VItZ2aUFsTGK/lIgn0mCEGHhWzWv9tywAhB/8/BABQ7oVO2
         C4kiYKmBXJ4A+eqt1l5jmCPPD8U46f7X8CPx3JWonDOfYmxnv0BstZ1Wh8jETrSVOakA
         9FKtnZQCkWBBCqT219vKJJgz5lgAEITKyzDQ0F7Rbq6eEBdYWcTLQErjCppYN5WufJAm
         KvuupEf7ilQtekjfkv76iCgoeQnQ+ATgHo4Rkma7Rx6B3uzUj/XShJzw+YbknDI2Q7dl
         Vy95XQD2C6ww8DU9qn1JL9UNSV3trCK4Xsy2NvVEgUchAaSoOy1W4mcumL3Pj+HMhKt1
         4SoA==
X-Gm-Message-State: AAQBX9d0IKGeY73HZS/YTNS7ODBzdyMxpgEjMz7KBbUcQf0w5SITcbC2
        YzjxePlwHDb4zjSxyjJKTk8QfIFdfYgQRToYogWadA==
X-Google-Smtp-Source: AKy350b2O3rWHFLy6+XzE6dz4ucQ7s0zpqUYq2p/4OGHUudHr3W12BQ0vF5fNXZNuyIXtJZIMv8Jkw==
X-Received: by 2002:a17:906:ecb7:b0:933:3a22:8513 with SMTP id qh23-20020a170906ecb700b009333a228513mr3669254ejb.53.1682116313951;
        Fri, 21 Apr 2023 15:31:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id sd22-20020a1709076e1600b009572bd99281sm1077908ejc.224.2023.04.21.15.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 15:31:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: tegra210: add missing cache properties
Date:   Sat, 22 Apr 2023 00:31:52 +0200
Message-Id: <20230421223152.115285-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

As all level 2 and level 3 caches are unified, add required
cache-unified property to fix warnings like:

  tegra210-p2371-0000.dtb: l2-cache: 'cache-unified' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Please take the patch via sub-arch SoC tree.
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 0e463b3cbe01..617583ff2736 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -2000,6 +2000,7 @@ CPU_SLEEP: cpu-sleep {
 		L2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-unified;
 		};
 	};
 
-- 
2.34.1

