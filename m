Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDCFC43217
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 12:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiJGMuX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 08:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiJGMuV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 08:50:21 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FBD50528;
        Fri,  7 Oct 2022 05:50:08 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id m14so5603682ljg.2;
        Fri, 07 Oct 2022 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y5rrHwKLrZ4oqRyovAy2VnaQoMJrQoBHsrafxjglos=;
        b=G/OrJ8zqmuYb/kkS4UhLEWzbWimpcbgnoO9d6aBezAILPtzafFiTWoGM+F66GRzlIY
         LMgAgEJ7Pa0gdROKyt8NntQDeLrEljz9GLjSH4Ij0rmhfjVCx9vqEEYof2j6rHosktm7
         owcS11xjt87jTesZhyoO3+2tL04cTlwYm2PanSbXSmttF/TZ7KDeRv4EODiWkEDn5bty
         VEhqWZpIN8w/fx+AvQb6Jb0okDEgwOy/GdZvwLB82j232EfKPsLKcbNV0TJB11M0jLzs
         FjZHe1UOO1A0JCJFHOPoXE1/zxW+6j0g+6TRHnU+5i+dw6Fic7iwCHfKeEYUUOSKDXw1
         FWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y5rrHwKLrZ4oqRyovAy2VnaQoMJrQoBHsrafxjglos=;
        b=j9Ylv6uwsZQGQPSKUn/uFvr0llIVIfi1Ovj3pYfSM70AwsOyCFX8Kjj+r4XlfSmb5S
         7IdJeehgpxt0wzTV4Se9GUSJrKimbX2JUFkSuEEW8RBBHGogZ5fcYYm2wbrglLyTI7vN
         0pjYDguKzYifMG602FCyn2jzI7okU9cj54xiKNR3mbhyWJdmKhAE2kgTSwLnE0QTPvpq
         /sNow9LVuQSdppmY3k/emKtuN9AXYCJ7il9i7SZIaJL9Vj2S/T0LJ0On8MhPyS68/qYW
         UcAdQUAWnZdIdC7yLk20FitbHJdNBotNrRkdgTSahsMnc1RMItOQm0vBkbr6iSDGoJe8
         76lw==
X-Gm-Message-State: ACrzQf0OHIwo/c3NLdBc1553/d8u4y6OI84oo6ARZwAevrF6oGgzQ9Ea
        ijVsOB+0E8E9kxpAvJgRIto=
X-Google-Smtp-Source: AMsMyM5ifxC7UlGdvc8qqaOEFBsU8euuliNMcSqjfAmJ19hRmNULRYAXYUCwGxaNG7vixk8xgJwMYg==
X-Received: by 2002:a2e:96d0:0:b0:26a:8a3c:861e with SMTP id d16-20020a2e96d0000000b0026a8a3c861emr1574575ljj.54.1665147006947;
        Fri, 07 Oct 2022 05:50:06 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t27-20020a2e8e7b000000b0026dfe55be7fsm241505ljk.63.2022.10.07.05.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:50:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: tegra: Add simple framebuffer on Jetson Xavier NX
Date:   Fri,  7 Oct 2022 14:49:46 +0200
Message-Id: <20221007124946.406808-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
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
Changes in v2:
- clear out dynamic fields and leave it up to firmware to fill them in
- mark simple-framebuffer node as disabled by default

 .../nvidia/tegra194-p3509-0000+p3668-0001.dts | 33 +++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
index 238fd98e8e45..44600479ea5f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
@@ -7,4 +7,37 @@
 / {
 	model = "NVIDIA Jetson Xavier NX Developer Kit (eMMC)";
 	compatible = "nvidia,p3509-0000+p3668-0001", "nvidia,tegra194";
+
+	chosen {
+		framebuffer {
+			compatible = "simple-framebuffer";
+			status = "disabled";
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
+			width = <0>;
+			height = <0>;
+			stride = <0>;
+			format = "";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		fb: framebuffer@0,0 {
+			compatible = "framebuffer";
+			reg = <0x0 0x0 0x0 0x0>;
+			iommu-addresses = <&dc0 0x0 0x0 0x0 0x0>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4d10b6b5324d..a961d42c81d6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1960,7 +1960,7 @@ display-hub@15200000 {
 
 				ranges = <0x15200000 0x15200000 0x40000>;
 
-				display@15200000 {
+				dc0: display@15200000 {
 					compatible = "nvidia,tegra194-dc";
 					reg = <0x15200000 0x10000>;
 					interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.37.3

