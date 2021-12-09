Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32021C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242950AbhLIR2x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242925AbhLIR2s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:28:48 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A93C061D5F
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:15 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id i5so10969808wrb.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ksnz4Wb2JQHFABsnVlzsIG8LCQ+ze+rwluAF9zTn3L4=;
        b=Cb7k1oZtd8Ety2ItK9pF5OUHz0K6sAcQ0qdliOljCoFP2GB2bUks8Surj1KNiETVZL
         QzIYIOAs2rPWJL3dEu6iGy0/z2lbCCvSTlJQBXP6eNUGYBHhj62jhqoWIsW20MS76RWp
         uPxnFE3w/fgXrXWlLFqKoSeCeUbSqZYKyFdUmsO9GGPbpLI5x0friQZ9DFk+AtT4o2LB
         pmVup/e3JPDooXpCgkN4BIqbfVzUyDvwnOxOfeN66Vm3Fsol+3q2vnvuetQFqU0l6hCp
         ms7Kz+uUXpn1gmttfmZyknOmbvbzGrtshSojy1/UtJXa19K+N2tWAzwaDIKcwLF7BKcQ
         guvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ksnz4Wb2JQHFABsnVlzsIG8LCQ+ze+rwluAF9zTn3L4=;
        b=wuBNybR7ri658EdbKgSxDxgswY+z4mgRNDHfpSQAdFz+2vbenX1mWSR/FmOOXqLN9Q
         KPAzQpu4vgUrW9E5eUl3ZzaleN20+CriP+Y7AYw60vb1u7M6R4FrV6kwCwZ7lPD+gCcM
         0Tcr5pQg7FPxlHsdGqWPlb8B8noLlQQoBby4oKuBQHlA3e+z6mLwsixpA0fnNee99PXq
         lQ3XP/fxoEkfiDl9gODruQN1czREARCe76sBykLRmhEiT0snlGA/LF61wl+84cA3ZMGY
         JDgS6d8Z2qVe2y61UrqLpW/RfFk5vUVktlDUff862muJXyx2ltPrNLwGcSV5D1IzhLoJ
         g+zg==
X-Gm-Message-State: AOAM533XM+PucQGfytTVo7LbEfXITC+5tRKYmQYCnxS3dGdDWfyvBXxR
        dr5G7DLhmUbR5jhwpnEcsIUHetkzkkiM+w==
X-Google-Smtp-Source: ABdhPJxSfs+zqo+a/dHUhaI0a6gg6RQYUxJob90J0isH0xB+gwnCEivCvNkrhXggejApwpP47GhxSw==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr7984974wru.182.1639070713529;
        Thu, 09 Dec 2021 09:25:13 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id f7sm379144wri.74.2021.12.09.09.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:12 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 03/30] arm64: tegra: Add native timer support on Tegra186
Date:   Thu,  9 Dec 2021 18:24:36 +0100
Message-Id: <20211209172503.617716-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The native timers IP block found on NVIDIA Tegra SoCs implements a
watchdog timer that can be used to recover from system hangs. Add the
device tree node on Tegra186.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index eb739ffbdfce..35679d2eda69 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -508,6 +508,22 @@ emc: external-memory-controller@2c60000 {
 		};
 	};
 
+	timer@3010000 {
+		compatible = "nvidia,tegra186-timer";
+		reg = <0x0 0x03010000 0x0 0x000e0000>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
 	uarta: serial@3100000 {
 		compatible = "nvidia,tegra186-uart", "nvidia,tegra20-uart";
 		reg = <0x0 0x03100000 0x0 0x40>;
-- 
2.34.1

