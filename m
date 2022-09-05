Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0942BECAAD5
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 16:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbiIEQd0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 12:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236332AbiIEQdX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 12:33:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211582C660;
        Mon,  5 Sep 2022 09:33:20 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id lx1so18050981ejb.12;
        Mon, 05 Sep 2022 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hG5qOC2H13cLCXaupR4+peOyAcb2vcqeBUPSCe9IBNs=;
        b=MBI+gg/logTsOdyivgK1UsqKQyV+jND6xnwUGSJbNZU7TjAaFQ4z74KpS1Dz0Snixy
         mWv/kFOh7fgnTcx7Luh0MsodmrZY7MKPRgYzCudyzKnYDyQ2iGB6/hXt9aGwZosScqB4
         ydoDjMdZW+mBHmG1Pj00mXFgV/Q5iUuhls987uyDWSU/z6oUwTQlJZzhmLDcyLTR90dh
         mnssk4Kfs15LRjireNhxNHqDnYdlN/oepHHrTzzt7uYBytsFx8/JlySjdtslclaZ0Vn4
         tRlNrV4GURTDqyWQLBegzlhofnNuCMnLtbHhFqGowwNYwU4Xs4czikTeoUc9ajWu38bF
         bzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hG5qOC2H13cLCXaupR4+peOyAcb2vcqeBUPSCe9IBNs=;
        b=6YGF+rL5wB+UN0D5td5NcK/8qDjFGgDQQrOLEPDAFn2ZLEF7L1hsot3+qMXeTwPL8C
         OPhZQbDDeT8f/OMkwocRjtfrhO3ErlosJPpadQ1Ojgzb3wqMhqOoKY0Hy9ugUvANlMvx
         FXUUP6FSHA7H8PEaK16Q4XTMRY63nxg8pfS4VY5zhTP2iWb3g9iHbIKvNM/6HOnYE5S3
         B6HvO+AjrwFwixm+FFXl8Hb3QAb0rVt3R9sCh7JwC8xvkuz4ORp2bDkIrUXJY8042sIR
         DrekcNhNU8+ZIwLdWaxXVx0Yv+8CtaCXWL8NkR+F7i5sn/vpcf3COFL3z7Ru9WeTKLmJ
         HXug==
X-Gm-Message-State: ACgBeo33jHWjH+akT9GubxeJ/zIWKkW1ESoD0MD75rKHq9+IE+1AD4ZM
        Pn0vvmBxu8o7ViIhjx2xhno=
X-Google-Smtp-Source: AA6agR61TNYjnDHRsTKAWCI/N+zJmwR6G3Of3lFBODxyik1mowbXKlE2m6prYDYlGfFGBl5sEMdzXw==
X-Received: by 2002:a17:907:7f02:b0:73d:dffa:57b3 with SMTP id qf2-20020a1709077f0200b0073ddffa57b3mr34533961ejc.19.1662395598445;
        Mon, 05 Sep 2022 09:33:18 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ca8-20020aa7cd68000000b0043d7b19abd0sm1962920edb.39.2022.09.05.09.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 09:33:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 6/6] arm64: tegra: Add simple framebuffer on Jetson Xavier NX
Date:   Mon,  5 Sep 2022 18:33:00 +0200
Message-Id: <20220905163300.391692-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the framebuffer carveout reserved memory node as well as a simple-
framebuffer node that is used to bind to the framebuffer that the
bootloader has set up.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia/tegra194-p3509-0000+p3668-0001.dts | 32 +++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
index 238fd98e8e45..163950321c38 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
@@ -7,4 +7,36 @@
 / {
 	model = "NVIDIA Jetson Xavier NX Developer Kit (eMMC)";
 	compatible = "nvidia,p3509-0000+p3668-0001", "nvidia,tegra194";
+
+	chosen {
+		framebuffer {
+			compatible = "simple-framebuffer";
+			memory-region = <&fb>;
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+			clocks = <&bpmp TEGRA194_CLK_SOR1_REF>,
+				 <&bpmp TEGRA194_CLK_SOR1_OUT>,
+				 <&bpmp TEGRA194_CLK_SOR1_PAD_CLKOUT>,
+				 <&bpmp TEGRA194_CLK_PLLD2>,
+				 <&bpmp TEGRA194_CLK_PLLDP>,
+				 <&bpmp TEGRA194_CLK_NVDISPLAY_DISP>,
+				 <&bpmp TEGRA194_CLK_NVDISPLAYHUB>,
+				 <&bpmp TEGRA194_CLK_NVDISPLAY_P0>;
+			width = <1920>;
+			height = <1080>;
+			stride = <7680>;
+			format = "a8b8g8r8";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		fb: framebuffer@2,573a0000 {
+			compatible = "framebuffer";
+			reg = <0x2 0x573a0000 0x0 0x007e9000>;
+			iommu-addresses = <&dc0 0x2 0x573a0000 0x0 0x007e9000>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 3e6ac20ace3d..5c5343cf8dc9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1929,7 +1929,7 @@ display-hub@15200000 {
 
 				ranges = <0x15200000 0x15200000 0x40000>;
 
-				display@15200000 {
+				dc0: display@15200000 {
 					compatible = "nvidia,tegra194-dc";
 					reg = <0x15200000 0x10000>;
 					interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.37.2

