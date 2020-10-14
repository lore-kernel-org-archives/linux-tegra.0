Return-Path: <SRS0=m5en=DV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9BAC433DF
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 18:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0820F22248
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 18:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgJNSGN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Oct 2020 14:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729205AbgJNSGB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Oct 2020 14:06:01 -0400
Received: from hera.iit.uni-miskolc.hu (hera.iit.uni-miskolc.hu [IPv6:2001:738:6001:500::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D677DC061755;
        Wed, 14 Oct 2020 11:06:00 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTP id 0E59126C4;
        Wed, 14 Oct 2020 19:56:49 +0200 (CEST)
X-Virus-Scanned: Kamavis at iit.uni-miskolc.hu
Received: from hera.iit.uni-miskolc.hu ([127.0.0.1])
        by localhost (hera.iit.uni-miskolc.hu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id StLslTQC6hdb; Wed, 14 Oct 2020 19:56:38 +0200 (CEST)
Received: from titan.hitronhub.home (unknown [IPv6:2a02:8109:a180:908:226:9eff:fe30:2af8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: szucst@iit.uni-miskolc.hu)
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTPSA id C3D4413E;
        Wed, 14 Oct 2020 19:56:37 +0200 (CEST)
From:   =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH v3 1/5] arm64: tegra: Enable signal voltage switching on Tegra194 SDMMC1 and SDMMC3
Date:   Wed, 14 Oct 2020 19:56:23 +0200
Message-Id: <20201014175627.5585-2-tszucs@protonmail.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201014175627.5585-1-tszucs@protonmail.ch>
References: <20201014175627.5585-1-tszucs@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add pad voltage configuration nodes for SDMMC pads with configurable voltages
and enable supported SD card, SDIO and eMMC modes.

Signed-off-by: Tamás Szűcs <tszucs@protonmail.ch>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index e9c90f0f44ff..058fdb1ffa1a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+#include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
 #include <dt-bindings/power/tegra194-powergate.h>
 #include <dt-bindings/reset/tegra194-reset.h>
 #include <dt-bindings/thermal/tegra194-bpmp-thermal.h>
@@ -705,6 +706,9 @@
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRA &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWA &emc>;
 			interconnect-names = "dma-mem", "write";
+			pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
+			pinctrl-0 = <&sdmmc1_3v3>;
+			pinctrl-1 = <&sdmmc1_1v8>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
 									<0x07>;
 			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
@@ -716,6 +720,15 @@
 			nvidia,pad-autocal-pull-down-offset-sdr104 = <0x00>;
 			nvidia,default-tap = <0x9>;
 			nvidia,default-trim = <0x5>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			sd-uhs-sdr12;
+			sd-uhs-sdr25;
+			sd-uhs-sdr50;
+			sd-uhs-sdr104;
+			cap-sdio-irq;
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
 			status = "disabled";
 		};
 
@@ -731,6 +744,9 @@
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCR &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_SDMMCW &emc>;
 			interconnect-names = "dma-mem", "write";
+			pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
+			pinctrl-0 = <&sdmmc3_3v3>;
+			pinctrl-1 = <&sdmmc3_1v8>;
 			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x07>;
@@ -743,6 +759,15 @@
 			nvidia,pad-autocal-pull-down-offset-sdr104 = <0x00>;
 			nvidia,default-tap = <0x9>;
 			nvidia,default-trim = <0x5>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			sd-uhs-sdr12;
+			sd-uhs-sdr25;
+			sd-uhs-sdr50;
+			sd-uhs-sdr104;
+			cap-sdio-irq;
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
 			status = "disabled";
 		};
 
@@ -1269,6 +1294,26 @@
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
+
+			sdmmc1_3v3: sdmmc1-3v3 {
+				pins = "sdmmc1-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
+			};
+
+			sdmmc1_1v8: sdmmc1-1v8 {
+				pins = "sdmmc1-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
+			};
+
+			sdmmc3_3v3: sdmmc3-3v3 {
+				pins = "sdmmc3-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
+			};
+
+			sdmmc3_1v8: sdmmc3-1v8 {
+				pins = "sdmmc3-hv";
+				power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
+			};
 		};
 
 		host1x@13e00000 {
-- 
2.20.1

