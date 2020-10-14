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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F7FC433DF
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 18:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9C3B2222A
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 18:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbgJNSGA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Oct 2020 14:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbgJNSGA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Oct 2020 14:06:00 -0400
Received: from hera.iit.uni-miskolc.hu (hera.iit.uni-miskolc.hu [IPv6:2001:738:6001:500::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8178EC0613D2;
        Wed, 14 Oct 2020 11:06:00 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTP id AF5E526C0;
        Wed, 14 Oct 2020 19:56:56 +0200 (CEST)
X-Virus-Scanned: Kamavis at iit.uni-miskolc.hu
Received: from hera.iit.uni-miskolc.hu ([127.0.0.1])
        by localhost (hera.iit.uni-miskolc.hu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2gSJAL_kGamn; Wed, 14 Oct 2020 19:56:50 +0200 (CEST)
Received: from titan.hitronhub.home (unknown [IPv6:2a02:8109:a180:908:226:9eff:fe30:2af8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: szucst@iit.uni-miskolc.hu)
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTPSA id 19F5E26C1;
        Wed, 14 Oct 2020 19:56:40 +0200 (CEST)
From:   =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH v3 4/5] arm64: tegra: Add vmmc-supply regulator for Jetson AGX Xavier SDMMC1
Date:   Wed, 14 Oct 2020 19:56:26 +0200
Message-Id: <20201014175627.5585-5-tszucs@protonmail.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201014175627.5585-1-tszucs@protonmail.ch>
References: <20201014175627.5585-1-tszucs@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Create regulator for VDD_3V3_SD and add it to SDMMC1. When vmmc-supply is
undefined the initialization sequence specified in aliases is disregarded.

Signed-off-by: Tamás Szűcs <tszucs@protonmail.ch>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 31b5f00a7547..604a2c8a7478 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -78,6 +78,8 @@
 			bus-width = <4>;
 			cd-gpios = <&gpio TEGRA194_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
 			disable-wp;
+
+			vmmc-supply = <&vdd_3v3_sd>;
 		};
 
 		/* SDMMC4 (eMMC) */
@@ -356,4 +358,14 @@
 		gpio = <&gpio TEGRA194_MAIN_GPIO(Z, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	vdd_3v3_sd: regulator@5 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_3V3_SD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio TEGRA194_MAIN_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		enable-active-high;
+	};
 };
-- 
2.20.1

