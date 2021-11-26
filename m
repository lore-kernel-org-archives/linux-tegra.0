Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD29C43217
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbhKZQkj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348152AbhKZQii (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:38:38 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29B6C06175A;
        Fri, 26 Nov 2021 08:19:58 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id k23so19800566lje.1;
        Fri, 26 Nov 2021 08:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
        b=bdbspkD2uxc8qeriYgYo3urTgP3sVL8LPoyinGG3VjF3C7Lw0RK+XZckeGj0vFEJHn
         XQ4zadccolf5Ix433mkdFsT6vgImRa6Txk210jDxGGs2WztWVW5Y9CpKN8ks1hCa1VoP
         MxyOOSkQGswD28YdxKvlc2JDyMc1jj0NVGVovHOfgYq6LoJTdWVQXajaanCtGL1TdQ1i
         +WwdN6tfAhUArRz59d16jrN3THi5VHiu1P1uHM7Egb1SzwU0RYaOxhLHHfG3Uw+UoD3O
         LtVtusEJIBWcyT1kojXzI8gP4RLEwwLnfE9bWG5pUgcIpqyp/yhYbnhxT7suOiB95i7B
         AOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
        b=U/eO2mmj0GgMQA+WgQ2B76IyPnt7SQVqg+s02fniiUk5AbsMeKViEaolaMjUCVNtb+
         bp/pXN+udAA9sDhFJR8R4PESgagOcC2wOce0nkoWLftHZBR72Vf7Ogqk9lPZhwdImjUc
         OlQGqDgnq87iPdlVDUKbf7mremg9YR2OpwrEagLSAOdaLMxZubvuelxpgnPWJ7UyJQft
         x2kyDNG7XH+1V5l1Jrc/NmlA06gH/DSlNeyJJSKkVlTka0utgdTafTX06g58N5rkU7H1
         1PvgI++IUQ8/DblXDuleSPujfgRGcBGv04DEmT96jdeSruGdU+pDZe7eNWCETUu9JpC/
         JOMg==
X-Gm-Message-State: AOAM531fudgPdAnn7WkOJaGpD8cCRUElrgY2I7UM0xsGnKkpRg1KjKas
        0AvjG/FoFiMRzLnM20q/wxs=
X-Google-Smtp-Source: ABdhPJxpm9nqKWKezaZcIWKSbgNt+5aswTDFHwGvFf90WbQr4/XEZVYSn1hrv8SDqgkyr4alLXIBbw==
X-Received: by 2002:a2e:9217:: with SMTP id k23mr31531018ljg.267.1637943597317;
        Fri, 26 Nov 2021 08:19:57 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:56 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/20] ARM: tegra: Add S/PDIF node to Tegra20 device-tree
Date:   Fri, 26 Nov 2021 19:18:04 +0300
Message-Id: <20211126161807.15776-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add S/PDIF node to Tegra20 device-tree. It's needed for enabling HDMI
audio support.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 63c2c2f8c0ce..799da7dc929b 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -197,6 +197,7 @@ hdmi@54280000 {
 			reset-names = "hdmi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&hdmi_dvfs_opp_table>;
+			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
 
@@ -396,6 +397,23 @@ tegra_ac97: ac97@70002000 {
 		status = "disabled";
 	};
 
+	tegra_spdif: spdif@70002400 {
+		compatible = "nvidia,tegra20-spdif";
+		reg = <0x70002400 0x200>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>,
+			 <&tegra_car TEGRA20_CLK_SPDIF_IN>;
+		clock-names = "spdif_out", "spdif_in";
+		resets = <&tegra_car 10>;
+		dmas = <&apbdma 3>, <&apbdma 3>;
+		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		assigned-clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>;
+		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_A_OUT0>;
+	};
+
 	tegra_i2s1: i2s@70002800 {
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002800 0x200>;
-- 
2.33.1

