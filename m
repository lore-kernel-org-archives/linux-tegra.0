Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBEFC001B0
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 13:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbjGGNRZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjGGNRX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 09:17:23 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F501FEB;
        Fri,  7 Jul 2023 06:17:21 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso20041105e9.2;
        Fri, 07 Jul 2023 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688735840; x=1691327840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsrBAfCGVNelsA/PKAK3tw2obc1qEvMP8nTj/zVYfec=;
        b=ALTfZxaV9Ay79vQgcqBUR7L/uoOwQZZ4jqPzkDebLybEhumAJeQuiitOiS3IFRdtNU
         aEOugqyOK8dOAvaZcY8WbKor9ofD3qGJzWvneu5dMVaee2yuNwXmhO9CWGtg+dwwBEkP
         cxbmvAApXjkTrOfP4surh6FfZ3B1QHvy4XP6TrIDlCKmIdNuPcudnDiDL35JV1HNkYpJ
         ljUSmpHp0CUtuMGiP2nxGvHGxng1eW/FkhKI2Cbx7lNZ4u5+r0xDdisikVkZYiCHZZ3t
         fihhUMZO1W0e75msALszFCHrYe+plKKFpa6lC4dPBx8LudzTOhvb3eRRmsCwaDSXnV93
         qZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735840; x=1691327840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsrBAfCGVNelsA/PKAK3tw2obc1qEvMP8nTj/zVYfec=;
        b=C0/pIMLte5eEYeZ/MU7PUrsCzHDQSX7d3DjW9GkOl/UYhY8Qpmd44CYy5WcuNXJV8/
         oct9M0I9uXQFZwtqrmtcapy3duOLokJ5OYQT3emWGLV3hJQUWKJAAka6IiUA2x1Bzc6L
         nyH9DCXkxOAQMxKU+4GNjXp5Uz6Bfsz0dNsnH5VoE/FI450yok+bLa0mgFX99mCdKyau
         zaI7U2h+NO5gIy0jSBXebXLWRvgGxSYT9WEAHlnJdbnuJEmzxTMIti6RATLmt7LWBCVy
         Ukph+XEMql5qcG5W5sMYPZP+7H/JlC9e12rKuGOGhYmoLVykg4Ix+iZS4l3apIpLUQUd
         JaAg==
X-Gm-Message-State: ABy/qLZAx8PYwkC1WE05uJyNGq8a6rYZflzTw1cH5FHe6qeQYQ/X1kWB
        S71ADIsHTRjPiDalM2BQ7sc=
X-Google-Smtp-Source: APBJJlE3gF5ilMRMliA8OtVBdwST0BYBJ3/KBkBLZzNnt9HNDVx3SaSZ1l8cwBv7q6jQx63fSDAtAQ==
X-Received: by 2002:adf:e504:0:b0:314:248d:d9df with SMTP id j4-20020adfe504000000b00314248dd9dfmr4260597wrm.13.1688735840197;
        Fri, 07 Jul 2023 06:17:20 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a5-20020adffb85000000b00313e4d02be8sm4458268wrr.55.2023.07.07.06.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:17:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: arm: tegra: pmc: Reformat example
Date:   Fri,  7 Jul 2023 15:17:10 +0200
Message-ID: <20230707131711.2997956-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707131711.2997956-1-thierry.reding@gmail.com>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Reformat the example using 4 spaces for indentation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm/tegra/nvidia,tegra20-pmc.yaml         | 77 +++++++++----------
 1 file changed, 38 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 271aa8f80a65..f709a4a0853c 100644
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

