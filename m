Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2381AC43600
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0023D61480
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 20:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhEJU3P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 16:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbhEJU3O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 16:29:14 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE69C061760;
        Mon, 10 May 2021 13:28:08 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2so25311822lft.4;
        Mon, 10 May 2021 13:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=95lVmhwuLPUgOxm7UN11JWblmVyBnSDoDre5KsKZTeI=;
        b=U6RP2p5YTSVC2sCddN+8lsF4jTboBTbvqNvPPdt9ZgZrqtGCohmBsi8mt9j4hcdMEp
         tgzay2CQN/rDAENbQKuXKV3trgHwIgX72bNzLwK9/cXkONaHalTD85QOL/mlXse0Aq1U
         aKSsVGeB/YA2bCKyo6wOoZOiY1/lT3h24isrjOspSCxgKqO9HFwB1oaNIXw23xGyIkTu
         6K/b2m7UJbXFiPKwkIU9qe93d89Ol7xch46T3/nMq9r4AyATBJteJ1Lm4/+p18Z3BtNh
         tAQvUZZqmCwyAap8S8yHAjefkNuUlsiz8I0iH+rgHFmZ/aw7j5xjEFepyNvN834G4S8X
         8Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=95lVmhwuLPUgOxm7UN11JWblmVyBnSDoDre5KsKZTeI=;
        b=NYLic4a/u3CP2cIReuL/+dcRazZd1PcUpciX1nALiBQ6nHkXExZqgosL/6Z8YitieL
         c29OKzbKB6ADv786XZkv+P7w6mo2E6uzeibeXgPWWIINWzp0yeT3UvbcivSVugZH3ThC
         obnT1CSYIDQUfx0ppZzXc1/ZYEXOc+csAX1QNsbgZknWamk7u1rBpa0Pwchiz+UcMkXo
         opyQVj+6eF28p6hKoaIiUJHSGNZAOv9eJhWpqrcf8V7ZS79BcVTKoUj2Kxcjr2wokFvb
         rykKsYLOSTs3wXRfU3XJGeR/tCRLjkvzewdz/5Ila+9IM53QawdmCDloHnlXWKgBzQ9d
         /2Aw==
X-Gm-Message-State: AOAM533sYRLbZRrZJsX9f2HhsZVcRURpriEPVfOpvGv7CFQsuGH5jjx1
        IG8inV1z5t7SlYA7/RB6oes=
X-Google-Smtp-Source: ABdhPJyFE7+z4i10OfudoqyocKqVxwZ34A65nqd3wA8p8Ld1NiumBDSplNaCjLoshcOKaRvLdO4IkA==
X-Received: by 2002:a19:4cd7:: with SMTP id z206mr4052200lfa.487.1620678487255;
        Mon, 10 May 2021 13:28:07 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id z23sm2360662lfq.241.2021.05.10.13.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 13:28:07 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/10] ARM: tegra: wm8903: Fix polarity of headphones-detection GPIO in device-trees
Date:   Mon, 10 May 2021 23:25:55 +0300
Message-Id: <20210510202600.12156-6-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510202600.12156-1-digetx@gmail.com>
References: <20210510202600.12156-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

All Tegra boards which use WM8903 audio codec are specifying a wrong
polarity for the headphones detection GPIO. The kernel driver hardcodes
the polarity to active-low, which is the correct polarity, so we can fix
the device-trees safely.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 arch/arm/boot/dts/tegra20-harmony.dts           | 2 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts       | 2 +-
 arch/arm/boot/dts/tegra20-plutux.dts            | 2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts          | 2 +-
 arch/arm/boot/dts/tegra20-tec.dts               | 2 +-
 arch/arm/boot/dts/tegra20-ventana.dts           | 2 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi           | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 883b76f1039b..1976c383912a 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1033,7 +1033,7 @@ sound {
 		nvidia,audio-codec = <&wm8903>;
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
-		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
 		nvidia,int-mic-en-gpios = <&wm8903 1 GPIO_ACTIVE_HIGH>;
 		nvidia,headset;
 
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 86494cb4d5a1..ae4312eedcbd 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -748,7 +748,7 @@ sound {
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2)
-			GPIO_ACTIVE_HIGH>;
+			GPIO_ACTIVE_LOW>;
 		nvidia,int-mic-en-gpios = <&gpio TEGRA_GPIO(X, 0)
 			GPIO_ACTIVE_HIGH>;
 		nvidia,ext-mic-en-gpios = <&gpio TEGRA_GPIO(X, 1)
diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index a348ca30e522..b31c9bca16e6 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -84,7 +84,7 @@ sound {
 		nvidia,audio-codec = <&wm8903>;
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
-		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
 
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
 			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/tegra20-plutux.dts
index 378f23b2958b..5811b7006a9b 100644
--- a/arch/arm/boot/dts/tegra20-plutux.dts
+++ b/arch/arm/boot/dts/tegra20-plutux.dts
@@ -52,7 +52,7 @@ sound {
 		nvidia,audio-codec = <&wm8903>;
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
-		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
 
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
 			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index c24d4a37613e..92d494b8c3d2 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -911,7 +911,7 @@ sound {
 		nvidia,audio-codec = <&wm8903>;
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
-		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_LOW>;
 
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
 			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
diff --git a/arch/arm/boot/dts/tegra20-tec.dts b/arch/arm/boot/dts/tegra20-tec.dts
index 44ced60315de..10ff09d86efa 100644
--- a/arch/arm/boot/dts/tegra20-tec.dts
+++ b/arch/arm/boot/dts/tegra20-tec.dts
@@ -61,7 +61,7 @@ sound {
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2)
-			GPIO_ACTIVE_HIGH>;
+			GPIO_ACTIVE_LOW>;
 
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
 			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 99a356c1ccec..5a2578b3707f 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -709,7 +709,7 @@ sound {
 		nvidia,audio-codec = <&wm8903>;
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
-		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_HIGH>;
+		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
 		nvidia,int-mic-en-gpios = <&gpio TEGRA_GPIO(X, 0)
 			GPIO_ACTIVE_HIGH>;
 		nvidia,ext-mic-en-gpios = <&gpio TEGRA_GPIO(X, 1)
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 2dff14b87f3e..d9dd11569d4b 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -630,7 +630,7 @@ sound {
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2)
-			GPIO_ACTIVE_HIGH>;
+			GPIO_ACTIVE_LOW>;
 
 		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
 			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-- 
2.30.2

