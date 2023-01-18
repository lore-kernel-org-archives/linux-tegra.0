Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54E2C38159
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Jan 2023 18:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbjARSEa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 Jan 2023 13:04:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjARSEO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Jan 2023 13:04:14 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2157E5D13C
        for <linux-tegra@vger.kernel.org>; Wed, 18 Jan 2023 10:02:02 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id q10so15472090wrs.2
        for <linux-tegra@vger.kernel.org>; Wed, 18 Jan 2023 10:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zp84JUX2wPLB6FAIMuryYBX4UoBq5satkVPoiHfbwC8=;
        b=SuzsQHg+VL7NqkwjrA63pCX0Wh/ri6IncPBZXyPuINUTQvvp788mh5J4vJJxBa9Mc/
         y/ttCKrX0uNIm+tw6/vqD5JFPoJIAH/m1xJd12MANZgmNBGvfqVoslitJaDVlpYG6Gcg
         ljT6biT3+fWn72zFSlQeveqfkUxSwqcVzuAg0RUZL3rklTY4sVg1jBK14OM92QHKLI48
         rjYxW/75SOrTLmszDt2eq00ibyhe+I+UMNVBKLJKKppm//AV5dM89TEYBDgLS70RCG60
         7ZznQt3ixUsuMaRIYB+5yX51Oph7bYwjr0NIzHepDaw7N5dDr9M05cbdJmoCBItHwWrH
         SkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zp84JUX2wPLB6FAIMuryYBX4UoBq5satkVPoiHfbwC8=;
        b=bX9NOwWZmI9njHaBCD2SmJE8cVfD+AukB1rpp1H3+weKHLBwJPRqLWN7l6XtBrIx3P
         Cl8P1dGzJp7d0tBXZ/CEMOX/L8kaw0JuI1lNVlkOgSfvX5RAFE68TVKMKl3X+cRjkl+X
         rDii2ctmAwE6UyRQlpgVy+urOgLSk882MKEe4lpYv8zumleCLIa0f+UKf0YBjMWI0Pr3
         SuqDimVAHMG2Se+clN5eyO6bRlsGmrrCb1YsvY+2NsDnrICoNsbE4EXv/sj5vP/0rfZk
         m+EpvyeEOTGvTwWFJqGqy6RCUeEhafDz7fL53YDG2/HB3ISCgt+4KHAknZqExhjTSQls
         Mcfw==
X-Gm-Message-State: AFqh2kqbFLcA/PZ7OH9Q0eZcZxbvdQJUbkxNASAJQNNWofPw/J90f6gl
        /DH0xvN1vwYzrCFIADA0TmCnUQ==
X-Google-Smtp-Source: AMrXdXv3mSWZmyjShmt7WtX7nY6Hcxtp9KvdQ4XjWZI2xRezvrvP5e54ZFq9WAbXPQXpGcFKgypXlQ==
X-Received: by 2002:adf:efc8:0:b0:29d:f817:42d4 with SMTP id i8-20020adfefc8000000b0029df81742d4mr16973520wrp.19.1674064912700;
        Wed, 18 Jan 2023 10:01:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w4-20020a5d4b44000000b002366dd0e030sm31657450wrs.68.2023.01.18.10.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:01:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Olivier Dautricourt <olivierdautricourt@gmail.com>,
        Stefan Roese <sr@denx.de>, Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Green Wan <green.wan@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?q?=A1er?= <povik+lin@cutebit.org>,
        Peng Fan <peng.fan@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        - <chuanhua.lei@intel.com>, Long Cheng <long.cheng@mediatek.com>,
        Rajesh Gumasta <rgumasta@nvidia.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Palmer Debbelt <palmer@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-actions@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: dma: cleanup examples - indentation, lowercase hex
Date:   Wed, 18 Jan 2023 19:01:44 +0100
Message-Id: <20230118180144.364756-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Cleanup examples:
 - use 4-space indentation (for cases when it is neither 4 not 2 space),
 - use lowercase hex.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 36 +++++++++----------
 .../bindings/dma/stericsson,dma40.yaml        |  4 +--
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 2bedab1f74e0..d34d0fa62ab5 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -113,21 +113,21 @@ additionalProperties: false
 
 examples:
   - |
-     #include <dt-bindings/interrupt-controller/arm-gic.h>
-     #include <dt-bindings/interrupt-controller/irq.h>
-     /* example with snps,dw-axi-dmac */
-     dmac: dma-controller@80000 {
-         compatible = "snps,axi-dma-1.01a";
-         reg = <0x80000 0x400>;
-         clocks = <&core_clk>, <&cfgr_clk>;
-         clock-names = "core-clk", "cfgr-clk";
-         interrupt-parent = <&intc>;
-         interrupts = <27>;
-         #dma-cells = <1>;
-         dma-channels = <4>;
-         snps,dma-masters = <2>;
-         snps,data-width = <3>;
-         snps,block-size = <4096 4096 4096 4096>;
-         snps,priority = <0 1 2 3>;
-         snps,axi-max-burst-len = <16>;
-     };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    /* example with snps,dw-axi-dmac */
+    dmac: dma-controller@80000 {
+        compatible = "snps,axi-dma-1.01a";
+        reg = <0x80000 0x400>;
+        clocks = <&core_clk>, <&cfgr_clk>;
+        clock-names = "core-clk", "cfgr-clk";
+        interrupt-parent = <&intc>;
+        interrupts = <27>;
+        #dma-cells = <1>;
+        dma-channels = <4>;
+        snps,dma-masters = <2>;
+        snps,data-width = <3>;
+        snps,block-size = <4096 4096 4096 4096>;
+        snps,priority = <0 1 2 3>;
+        snps,axi-max-burst-len = <16>;
+    };
diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
index 664ee61a00d8..57395a810719 100644
--- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
+++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
@@ -147,9 +147,9 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mfd/dbx500-prcmu.h>
-    dma-controller@801C0000 {
+    dma-controller@801c0000 {
       compatible = "stericsson,db8500-dma40", "stericsson,dma40";
-      reg = <0x801C0000 0x1000>, <0x40010000 0x800>;
+      reg = <0x801c0000 0x1000>, <0x40010000 0x800>;
       reg-names = "base", "lcpa";
       interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
       #dma-cells = <3>;
-- 
2.34.1

