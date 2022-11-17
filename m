Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06588C4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240602AbiKQSlC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:41:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240575AbiKQSlB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:41:01 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219C985175;
        Thu, 17 Nov 2022 10:40:59 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id f18so7331893ejz.5;
        Thu, 17 Nov 2022 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1XmyqLWH4AqUOHKKfV1yv3QMSJcaiHXG6zk/U0Icvk=;
        b=aVpjZjUmugzu/Zf4UlP/gNFrPeVw2QoCsRb8vQyv+jCL2d8y5OsKj0GZ64BylixKY0
         NfuzLBkmZe8U4Wk8RmKUxISvrCQxlekxCVlwh1jsS1d3zSbod1iElJrNETfONX6hd34B
         uTxQxEo8KEASodUrTV8If32PYhb+hH5pppYTuYRmGBsgATHW1APz8U0Z++AVWuzVBvqH
         JIyPjQ5y4tjj+sWJB5ZdTTgjDNb11EMmdDAw6J0W5teFOHpT3FNKzUsp7OBOR79yctoF
         fMy/I2WJ3TdIvil4m8cnjwiYPvF6Gu5HIix1clcbsjTLjE6t+iA2JJLXTSmH164iVJJL
         BpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1XmyqLWH4AqUOHKKfV1yv3QMSJcaiHXG6zk/U0Icvk=;
        b=btqDlpNFjc21PIgb9uaFW+I1GaYzbog6a8P8tzbyTOEZ1L8vFXEzVvV87sYRvipi6j
         MVt7nlDfBtHz+VvT/S9ckIw+cjV6W2mO/uBFSwTCmPQA8mmSouX5IXGpZHbmJcQMyyfa
         OfHvywbxjwTTpZw2ZVt9oTOGs4n6wP3ZVwSCdF0tTXQAx5nwPQX04y+iqe2+D/CEQlho
         QFEgCrK6nk3kGUQ+pa9mQVqNnUIHTek67Km2OHKwqEc2qRZ3SLASHDZvCA+JYoE+i1w2
         P3gMx1ruvt/rYMaAV/aFbsgVTx3JVnX3/HLSQEgtMFdCxR8unjX6EnwhoW4XIceKPhW2
         pCng==
X-Gm-Message-State: ANoB5pmOQcd4bMgbuhf8wJb1swbhC1OI+lJ5QYQ0s26UZxxOydp6noBL
        /lmNzR1S3UlR6nTK3nU5ABShFFcK3Uc=
X-Google-Smtp-Source: AA0mqf6JIF4Hi+lfPgCjyHzvwjQnYPd8qpC0JNMVn/jTtG1nufCYivUOlHMB4CEB9me5Awc/DBy1CA==
X-Received: by 2002:a17:906:3792:b0:7aa:97c7:2bfe with SMTP id n18-20020a170906379200b007aa97c72bfemr3146515ejc.196.1668710457524;
        Thu, 17 Nov 2022 10:40:57 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a13-20020a17090682cd00b0078d424e8c09sm695617ejy.77.2022.11.17.10.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:40:56 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 8/8] arm64: tegra: Add simple framebuffer on Jetson Xavier NX
Date:   Thu, 17 Nov 2022 19:40:39 +0100
Message-Id: <20221117184039.2291937-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
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
index d0dbfafbc930..ec318b9e700c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1972,7 +1972,7 @@ display-hub@15200000 {
 
 				ranges = <0x15200000 0x15200000 0x40000>;
 
-				display@15200000 {
+				dc0: display@15200000 {
 					compatible = "nvidia,tegra194-dc";
 					reg = <0x15200000 0x10000>;
 					interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.38.1

