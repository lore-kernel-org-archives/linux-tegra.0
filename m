Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58BFC04A94
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 13:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjGUN6f (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjGUN6d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 09:58:33 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5192D50;
        Fri, 21 Jul 2023 06:58:09 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so2663072a12.3;
        Fri, 21 Jul 2023 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689947886; x=1690552686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWqMB3Z6eA0gtm3C24bBTyUL2IADR5Mx3MSeqCPmjd8=;
        b=WfQ3RemO29FqWAZKKGNRk7GaDPE5o3FhQc5unyLgZVe8cDMiHXTJVFk3nb9w1/tBPy
         p8X/92W+xMBchdzhYzmJ3vgkEdRLA7tKztI5a5INO8Ua8ercNHxMpViw7bo88+py7Gu0
         naax288ujQ6LJZem0NKTxot72Io4DHT6KA9MgfSv81vjExekEvzIAJm+w8LllJFWTpcR
         4mGLjBGeI5tMHZoOaICuuHTaepFeS+YagnPTHjVzMa+zCrF2l+gTzxTmp6bsZau1YcRe
         0pRlDcj3OHDuawNxw9//SEPvvry/sI7Ef2FCm+d+BiQ8G97IshENWw3slUgxkM4U8803
         kzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689947886; x=1690552686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWqMB3Z6eA0gtm3C24bBTyUL2IADR5Mx3MSeqCPmjd8=;
        b=VR+A7WenyYlML9DOfe1gYy7PAmYt8VXTlQapO3zXBU8P3teOr7NqZAclGMh4Ejb5VY
         +anfb7IdDJRY3g76+PYy+5hFHYqUoZE/+6RiZFpv9GaAJE+ONC4t98hTmtWP7n83hZf3
         iSpWxLjVqRcXv0HPnmaJuhnpPYTnT1lcOV3Xz7fN217nDLB6RTxgowBofwSI5HPTDjqC
         E3ANdi35rygiycqpyBudUoJhuaJbCQ6HWRs+ToydcqBlMqhVUzs6fl5ymPuNvH6Gt84J
         aVN2eJyUO074HSB3URIYpmj5yXpIVXlQ2xaee9HTPzbzTpaqT+7lkXjdVKwRki8JT0do
         eoPA==
X-Gm-Message-State: ABy/qLYuZuslifKAdBD/OXZeBzePUpYvog6H0ohXgOx+e31AGhkyzYQN
        Y7CksnKx91npkSFEkDVwNIU=
X-Google-Smtp-Source: APBJJlG3V/LyTD4HRDkIVhClpgD4iLCCqpfj3A36wMBfXN26KyKUABoqEGZbY3hYl6lsfRaRNacXEQ==
X-Received: by 2002:a05:6402:1357:b0:51a:265a:8fca with SMTP id y23-20020a056402135700b0051a265a8fcamr1485489edw.27.1689947886314;
        Fri, 21 Jul 2023 06:58:06 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u24-20020a05640207d800b0051a53d7b160sm2152212edy.80.2023.07.21.06.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:58:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 6/7] dt-bindings: arm: tegra: pmc: Reformat example
Date:   Fri, 21 Jul 2023 15:57:58 +0200
Message-ID: <20230721135759.2994770-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721135759.2994770-1-thierry.reding@gmail.com>
References: <20230721135759.2994770-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Reformat the example using 4 spaces for indentation.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add Acked-by: from Rob

 .../arm/tegra/nvidia,tegra20-pmc.yaml         | 77 +++++++++----------
 1 file changed, 38 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 0cbc16ec4267..67d69926f756 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -384,47 +384,46 @@ dependencies:
 
 examples:
   - |
-
     #include <dt-bindings/clock/tegra210-car.h>
     #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
     #include <dt-bindings/soc/tegra-pmc.h>
 
-    tegra_pmc: pmc@7000e400 {
-              compatible = "nvidia,tegra210-pmc";
-              reg = <0x7000e400 0x400>;
-              core-supply = <&regulator>;
-              clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
-              clock-names = "pclk", "clk32k_in";
-              #clock-cells = <1>;
-
-              nvidia,invert-interrupt;
-              nvidia,suspend-mode = <0>;
-              nvidia,cpu-pwr-good-time = <0>;
-              nvidia,cpu-pwr-off-time = <0>;
-              nvidia,core-pwr-good-time = <4587 3876>;
-              nvidia,core-pwr-off-time = <39065>;
-              nvidia,core-power-req-active-high;
-              nvidia,sys-clock-req-active-high;
-
-              pd_core: core-domain {
-                      operating-points-v2 = <&core_opp_table>;
-                      #power-domain-cells = <0>;
-              };
-
-              powergates {
-                    pd_audio: aud {
-                            clocks = <&tegra_car TEGRA210_CLK_APE>,
-                                     <&tegra_car TEGRA210_CLK_APB2APE>;
-                            resets = <&tegra_car 198>;
-                            power-domains = <&pd_core>;
-                            #power-domain-cells = <0>;
-                    };
-
-                    pd_xusbss: xusba {
-                            clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
-                            resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
-                            power-domains = <&pd_core>;
-                            #power-domain-cells = <0>;
-                    };
-              };
+    pmc@7000e400 {
+        compatible = "nvidia,tegra210-pmc";
+        reg = <0x7000e400 0x400>;
+        core-supply = <&regulator>;
+        clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
+        clock-names = "pclk", "clk32k_in";
+        #clock-cells = <1>;
+
+        nvidia,invert-interrupt;
+        nvidia,suspend-mode = <0>;
+        nvidia,cpu-pwr-good-time = <0>;
+        nvidia,cpu-pwr-off-time = <0>;
+        nvidia,core-pwr-good-time = <4587 3876>;
+        nvidia,core-pwr-off-time = <39065>;
+        nvidia,core-power-req-active-high;
+        nvidia,sys-clock-req-active-high;
+
+        pd_core: core-domain {
+            operating-points-v2 = <&core_opp_table>;
+            #power-domain-cells = <0>;
+        };
+
+        powergates {
+            pd_audio: aud {
+                clocks = <&tegra_car TEGRA210_CLK_APE>,
+                         <&tegra_car TEGRA210_CLK_APB2APE>;
+                resets = <&tegra_car 198>;
+                power-domains = <&pd_core>;
+                #power-domain-cells = <0>;
+            };
+
+            pd_xusbss: xusba {
+                clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
+                resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
+                power-domains = <&pd_core>;
+                #power-domain-cells = <0>;
+            };
+        };
     };
-- 
2.41.0

