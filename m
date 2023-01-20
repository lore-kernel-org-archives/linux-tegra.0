Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5249C25B4E
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjATRbc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjATRbY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:24 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C4ADBD8;
        Fri, 20 Jan 2023 09:31:16 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id r9so5484964wrw.4;
        Fri, 20 Jan 2023 09:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXw2j+x/kse2yPakxaPEW51TbrZ6J1HBieALff4c+rE=;
        b=HxB+Fql78ZELN8ESqJE0nr2QjjtSelDWlhBG63jeCWznR746a2arSU5WR3Dewrng8J
         hpKPCB/+XGVCnjaTSb1hBPnnCks1ywfdHU+gPv3prNvf2m9uSypF49PArI3DIbh+dhY7
         4nVMQ4nvctMibIveBehx3EiUs32eAwRfj6lK57zOYWSAtKFH4lWEpBYZGqeGbe9KSThS
         04EFH383Mi+M8yIjSXIltHW3DxMU4XvnnpWXjQ0sSXERqs9JfRb2KWddyQcV84rKHvjs
         bMNZ0JF7OgQ40n613YIyLOzpeSBfnd7bwq5wCtQ1EbPLfPanVxxa+hjUM/JnY9bEAgX/
         bhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXw2j+x/kse2yPakxaPEW51TbrZ6J1HBieALff4c+rE=;
        b=T5Mf6zdstogWfCFhB85vhzecHRi/Ar90oI2+U1wAEDsm1fbedkEma4gERBT4ZyrLal
         3VKNmC3GoHq2P1XxtXAN8VMtRj25K+S3oDtWPJO8f0RZFJZbUYoC7Uoc1rOEwjOOP8om
         Rqlan0kollQnvNPETCT0/2mXBm9j1y0XrIlaHx9ps1A7nm9hci2djU04pNP4oA11mOtz
         3Qz9KJ6L5B4vpwPf/4Fkjugd+RBFIXMutgcxat0ykdsyKZEryxSVe1qGFF992k6WoE9K
         VFrEO9TbGw5atCUl2MGC5AovK26GlBhmAgYvACVOmOHbhwGnY7AvGCw0lh/esxXt+BBs
         XSjA==
X-Gm-Message-State: AFqh2koO1TDv/2Y2mkT2c/s3c8ypRWn/2o8wLbHjerpQJDyWOeHoc86y
        Cnr+igC7mvmCpAsyt794pcU=
X-Google-Smtp-Source: AMrXdXsb64RJIKDpmJTAga1GYyceTGETa/aMFyd6rGzsds7lxOLOWxwF53TLNJ7Cy29mMswL5rWqhA==
X-Received: by 2002:adf:ce90:0:b0:2bb:edc7:504 with SMTP id r16-20020adfce90000000b002bbedc70504mr14353213wrn.26.1674235874883;
        Fri, 20 Jan 2023 09:31:14 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id z12-20020adfd0cc000000b002bdff778d87sm13470524wrh.34.2023.01.20.09.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 8/8] arm64: tegra: Add simple framebuffer on Jetson Xavier NX
Date:   Fri, 20 Jan 2023 18:31:03 +0100
Message-Id: <20230120173103.4002342-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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

 .../nvidia/tegra194-p3509-0000+p3668-0001.dts | 43 +++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
index 238fd98e8e45..85b4aaa2ad4e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
@@ -7,4 +7,47 @@
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
+			format = "x8b8g8r8";
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
+
+	bus@0 {
+		host1x@13e00000 {
+			display-hub@15200000 {
+				display@15200000 {
+					memory-region = <&fb>;
+				};
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 5ce2650128b1..e0ce54eae17d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1975,7 +1975,7 @@ display-hub@15200000 {
 				#size-cells = <2>;
 				ranges = <0x0 0x15200000 0x0 0x15200000 0x0 0x40000>;
 
-				display@15200000 {
+				dc0: display@15200000 {
 					compatible = "nvidia,tegra194-dc";
 					reg = <0x0 0x15200000 0x0 0x10000>;
 					interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.39.0

