Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36210C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242903AbhLIR27 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242896AbhLIR26 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:28:58 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13B3C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:24 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id j3so10995067wrp.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TPLnyhEeQ8IC1sdxs0QOSr1vVJg7XkLsG/OIFsZnjpc=;
        b=Ai7S/HSrZ9tGeRBB4PUtas59Ure6akb2myH5cdbCQZ1yQqbUonPMI+SSsEptRPGBre
         m6/4uf2zrLC7hdzQYah6kzCB8vv4K5gGoK7GeaJBjMre2DwaqChFFcW1Z+hpVcfl6UX3
         uLIkwidz6gb4wpyRrbujN5W/EqBikkQNvaR2NQYAYtPs5RKOfW+FJWcO3dVDYlii8TvZ
         u5u2S6CXaoHCMkrlmLyCXae13gtt59E5DiSFjJrKwB1rEBxzGS1PVpDbCQP0IL2EoUvk
         4V1SzBifH2JedJMo0Y6Zs/do1YsxmyjASAe3o1gGhSKIfl57SOutBnrjgAueK/NMqwJ0
         oIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TPLnyhEeQ8IC1sdxs0QOSr1vVJg7XkLsG/OIFsZnjpc=;
        b=lhWWtEDpoDxwvskgMguOEltMHHvHokNNo2lxZhPnqLCGIIKu/lxURDocVRIc54eVQq
         dWqawHHC1qiTju8mKN6yAGZlIRNsrKvF5eeI/8KFBcTpJLm4DWqIHRTVSnNOkVLIl0Yd
         LxXSDRHUrfG1vAUWDpOUuhB72IJW1G0B0v74MsyqEu7MYLQWsjNAGBcRy20H8qJinKv7
         Vhw3z1o/4PHT0uTKXxrIp/ckTrFlBJx9KzAjWcKAEwl49SgD1sFQ02S4Xyn4hdoIfDeM
         JyCzpuxafKQkDsufeN2UMrT2LqQKbBAbgDpDw8/ghJqbDmZWDOLDRrpQc9BjJ2Uh/J+6
         iIWA==
X-Gm-Message-State: AOAM531JpxGnbG1XA6o3lvffXxce64MvhvAbFEyT7UBTBmF/KlPEBdls
        xKH2ZC+V8uzStgqJ08DD3Zca/4hRGttFtQ==
X-Google-Smtp-Source: ABdhPJyQHcbsBbFGhsCKl2ygbJnCchNGMizaQIaofW/ErbBUQDJq/EvEzI3cVWL5m5oEpCsDfLSxBQ==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr7939472wrs.237.1639070723251;
        Thu, 09 Dec 2021 09:25:23 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 138sm9487899wma.17.2021.12.09.09.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:22 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 07/30] arm64: tegra: Add OPP tables on Tegra132
Date:   Thu,  9 Dec 2021 18:24:40 +0100
Message-Id: <20211209172503.617716-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add peripheral OPP tables on Tegra132 and wire them up to ACTMON and the
EMC. While at it, add the missing "#interconnect-cells" properties to
the memory controller and external memory controller nodes. Also set the
"#reset-cells" property for the memory controller because it exports the
hotflush reset controls.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../dts/nvidia/tegra132-peripherals-opp.dtsi  | 426 ++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra132.dtsi      |  13 +-
 2 files changed, 438 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra132-peripherals-opp.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-peripherals-opp.dtsi b/arch/arm64/boot/dts/nvidia/tegra132-peripherals-opp.dtsi
new file mode 100644
index 000000000000..66ffb7f8aaa7
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra132-peripherals-opp.dtsi
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	/* EMC DVFS OPP table */
+	emc_icc_dvfs_opp_table: opp-table-dvfs0 {
+		compatible = "operating-points-v2";
+
+		opp-12750000-800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-12750000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-12750000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-12750000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-20400000-800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-20400000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-20400000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-20400000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-40800000-800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-40800000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-40800000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-40800000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-68000000-800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-68000000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-68000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-68000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-102000000-800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-102000000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-102000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-102000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-204000000-800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0003>;
+			opp-suspend;
+		};
+
+		opp-204000000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0008>;
+			opp-suspend;
+		};
+
+		opp-204000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0010>;
+			opp-suspend;
+		};
+
+		opp-204000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x0004>;
+			opp-suspend;
+		};
+
+		opp-264000000-800 {
+			opp-microvolt = <800000 800000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-264000000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-264000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-264000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-300000000-850 {
+			opp-microvolt = <850000 850000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-300000000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-300000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-300000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-348000000-850 {
+			opp-microvolt = <850000 850000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-348000000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-348000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-348000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-396000000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-396000000-1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-396000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-396000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-528000000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-528000000-1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-528000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-528000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-600000000-950 {
+			opp-microvolt = <950000 950000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0008>;
+		};
+
+		opp-600000000-1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0003>;
+		};
+
+		opp-600000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-600000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-792000000-1000 {
+			opp-microvolt = <1000000 1000000 1150000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x000B>;
+		};
+
+		opp-792000000-1050 {
+			opp-microvolt = <1050000 1050000 1150000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x0010>;
+		};
+
+		opp-792000000-1110 {
+			opp-microvolt = <1110000 1110000 1150000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x0004>;
+		};
+
+		opp-924000000-1100 {
+			opp-microvolt = <1100000 1100000 1150000>;
+			opp-hz = /bits/ 64 <924000000>;
+			opp-supported-hw = <0x0013>;
+		};
+
+		opp-1200000000-1100 {
+			opp-microvolt = <1100000 1100000 1150000>;
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x0003>;
+		};
+	};
+
+	/* EMC bandwidth OPP table */
+	emc_bw_dfs_opp_table: opp-table-dvfs1 {
+		compatible = "operating-points-v2";
+
+		opp-12750000 {
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <204000>;
+		};
+
+		opp-20400000 {
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <326400>;
+		};
+
+		opp-40800000 {
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <652800>;
+		};
+
+		opp-68000000 {
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <1088000>;
+		};
+
+		opp-102000000 {
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <1632000>;
+		};
+
+		opp-204000000 {
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <3264000>;
+			opp-suspend;
+		};
+
+		opp-264000000 {
+			opp-hz = /bits/ 64 <264000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <4224000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <4800000>;
+		};
+
+		opp-348000000 {
+			opp-hz = /bits/ 64 <348000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <5568000>;
+		};
+
+		opp-396000000 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <6336000>;
+		};
+
+		opp-528000000 {
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <8448000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <9600000>;
+		};
+
+		opp-792000000 {
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x001F>;
+			opp-peak-kBps = <12672000>;
+		};
+
+		opp-924000000 {
+			opp-hz = /bits/ 64 <924000000>;
+			opp-supported-hw = <0x0013>;
+			opp-peak-kBps = <14784000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x0003>;
+			opp-peak-kBps = <19200000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 95bdcc8f31c9..7f5cbcd63a25 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/thermal/tegra124-soctherm.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
+#include "tegra132-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra132", "nvidia,tegra124";
 	interrupt-parent = <&lic>;
@@ -244,6 +246,10 @@ actmon@6000c800 {
 		clock-names = "actmon", "emc";
 		resets = <&tegra_car 119>;
 		reset-names = "actmon";
+		operating-points-v2 = <&emc_bw_dfs_opp_table>;
+		interconnects = <&mc TEGRA124_MC_MPCORER &emc>;
+		interconnect-names = "cpu-read";
+		#cooling-cells = <2>;
 	};
 
 	gpio: gpio@6000d000 {
@@ -607,15 +613,20 @@ mc: memory-controller@70019000 {
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 
 		#iommu-cells = <1>;
+		#reset-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
-		compatible = "nvidia,tegra132-emc";
+		compatible = "nvidia,tegra132-emc", "nvidia,tegra124-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>;
 		clocks = <&tegra_car TEGRA124_CLK_EMC>;
 		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
+
+		#interconnect-cells = <0>;
 	};
 
 	sata@70020000 {
-- 
2.34.1

