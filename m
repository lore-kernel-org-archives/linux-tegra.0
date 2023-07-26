Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FA8C05051
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 16:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbjGZQ2E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbjGZQ15 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 12:27:57 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0887626A1;
        Wed, 26 Jul 2023 09:27:56 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-992ca792065so1135532066b.2;
        Wed, 26 Jul 2023 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690388874; x=1690993674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDS7h6vfbqbdn44ZCx2nQW3rrOLUzA1WpqdTNa3vHJE=;
        b=MXJOVQ949OZGG+0GVwiDV7Ojwb2r50qRb4Ec75dymMICXiZCu0x5/8AkprH+57GMuh
         2e4VD7Qo1AoYkawt76X7owJw5t3g7M/upNalH9MXsG+12/c1dSrdSZ+xPD9ffrgDJ7XG
         8dF4fD3Rp+wucxiQmQ0tKwP1DjZCQ98PQ1hje3BXlDZj1LkH21aGj044+b5Q23DKqsBL
         H3qvpV6uuG/6t/R41Vh2/TI8vPivw26NRdKgQOz4cKJH+ZjNVrL+0Iuq8tDOQv/HgOfp
         TsTP1Q9qR0yXu4Ta7RtrufHJWuarFd73VYZ8mZ0G7HzpRHOl0cL1xO0eEVxR3K3kK1WD
         JPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690388874; x=1690993674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDS7h6vfbqbdn44ZCx2nQW3rrOLUzA1WpqdTNa3vHJE=;
        b=T2WEMnAq4zH1R4tbME15gjde+tUf2zKIRayAyYVSV5j3j/UtTZouNtiV4ShrzFCP7y
         gDJA0tsrvXi0qVuyFwZ5i4aFijZKpM5LJ9Lcy/7/6T7uk13OtkIxx581Czejfyuvd4nN
         7VvZXqER6gqmhnocqS/4o3PfmeYufjoZD69FTNtaKYZeuyGCBhwVcTm1n0qAxkxVD1Ng
         +8QSOO2p1JiqGVgEqMOXHoMEx/v9BuTppLpu2bBPzLCQPFNFUymcNmiuvPzI1wa1wVro
         eHc2tFvdTOlqDKLcsZAbgIsZkTF4UW/dlEzgL3oh7s439kjWrAYgR/LD9SxINxmm3NaC
         W1Hg==
X-Gm-Message-State: ABy/qLYERobokVs7PywqzKq+JxM8XhTG5UKgzYropM7oTVvc7Mnd5J5q
        3mct5vFFiJRseUYH/vndCoVySb41n1w=
X-Google-Smtp-Source: APBJJlGku7X3d+Slx7ozbqDE9ElTrdc4+nkl2jlBTEdb/3kOiwP0AJSzn2lgfnwuz+XJJhEqacscuA==
X-Received: by 2002:a17:906:2219:b0:99b:cf7a:c8f1 with SMTP id s25-20020a170906221900b0099bcf7ac8f1mr847616ejs.70.1690388874450;
        Wed, 26 Jul 2023 09:27:54 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o2-20020a1709061b0200b00992f309cfe8sm9860934ejg.178.2023.07.26.09.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:27:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 6/7] dt-bindings: arm: tegra: pmc: Reformat example
Date:   Wed, 26 Jul 2023 18:27:43 +0200
Message-ID: <20230726162744.2113008-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162744.2113008-1-thierry.reding@gmail.com>
References: <20230726162744.2113008-1-thierry.reding@gmail.com>
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
index de1b23167658..a54b562e2a1c 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -371,47 +371,46 @@ dependencies:
 
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

