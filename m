Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C014DC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352184AbhKXWKE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:10:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351917AbhKXWJ4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:56 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4409FC06173E;
        Wed, 24 Nov 2021 14:06:46 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b1so10874469lfs.13;
        Wed, 24 Nov 2021 14:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
        b=mMaACgOERSenGcWLmEoPPJgHhkMiAOulay0sv0LWaWQjUgzWbk0njA+eHQFw6bf7L7
         9XOnsWVMupgevKRLOiZaqLG7dUZtOV945CJFwJh+7sx2lVMJQsN9OxuK39vlXGU3Yg3v
         TfcqyppW6ujcpicdJLj2rGXrQoksV+Uak9OjjPypM7+V9tZjmsnUFUgtTCWr7nPvedKI
         ROQEs5xMbEXm3QH/VzvAaH6EIbPm17ixh11PUZQYbEfWCT5id6Hkk3f7WBW/IRnccKjB
         x76kMWlBeOlh1hj/idXLQ6q82W8Mzuz4dSJ7vrZfTH0b3QPcXlPEIIEJ4Dhx+/2CzbV4
         fS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pyWXKSD/ngAWTwm6HA1HadGHkUDHHAfqetu21/vFVIM=;
        b=8I5puj4yMpLOIKXVcgysCAEgGFqRu/LzuRgSUVNs67Gj9PsB1F3s0BRceJgQjHbf/t
         SBVWCvlZShDfYBMKEB32gVZ7XEVnVy9iwznqfz6PF8ts3OtoiP4oH6NEigPyD3rFCZBW
         7gCunxsPoYDyH4hbsj4lQcTk1XBJc2B1USGMdfWT6A3CDrdVhh6PwUj/pbz4diVM/ui5
         RuQbHLGFSs+MjiH0BLDsgkCgtDuB7YbyznaEfzWY286Bi5aJB8v+BLmz8SCiurDxl7F1
         22ElBnvTrhTTsuzIyku/+fSm1k/P0E/UyBaxgOU5cTQJS7XDDw92qd8wIuk4HgoFdInb
         CcEw==
X-Gm-Message-State: AOAM532SQwhB+3IW1F7IhLqqp0k6xfQms9cVpXyJ/Sw58ve5ojCPuuyf
        qMPD+Gf0j+obgVqn6+8PigI=
X-Google-Smtp-Source: ABdhPJza1gucFIMiw7WDt9rwXdn3NZAoRTr2XAdbH095/UnxQNN+DzGeh7xH7/8MELMaGpv5Zlm2Vg==
X-Received: by 2002:a05:6512:2292:: with SMTP id f18mr18381994lfu.18.1637791604612;
        Wed, 24 Nov 2021 14:06:44 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:44 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 17/20] ARM: tegra: Add S/PDIF node to Tegra20 device-tree
Date:   Thu, 25 Nov 2021 01:00:54 +0300
Message-Id: <20211124220057.15763-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
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

