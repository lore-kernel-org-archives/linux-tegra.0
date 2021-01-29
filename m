Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32539C433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:30:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E24B864E04
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbhA2SaL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 13:30:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8304 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbhA2S3J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 13:29:09 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601453c10000>; Fri, 29 Jan 2021 10:28:17 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:17 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:14 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>
CC:     <kuninori.morimoto.gx@renesas.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 6/9] arm64: tegra: Add RT5658 device entry
Date:   Fri, 29 Jan 2021 23:57:43 +0530
Message-ID: <1611944866-29373-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611944897; bh=kUDuAR+PUTUVvEzciIgYIxo2Rqb7F6D5EW+M6G9chIs=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=Kc9GNouVBTC7R9ls6rMDCasfiC7Q7FhU0oWIJB2JANESZH0w4uwQt9W1boElXF/aR
         4TpHvdCcOOt5TpcTPgxSXjcIBG2P354Xwc0maV78/5hoMq3tFnOMnFSXyHAkepAZmJ
         3X+GW466P5xS0IkrjDnYDCrklrGld925TNGLfHT4+WIHXGMpOW+OKSzV6cSS25wMks
         vGktssYdwvl8qJ6mpenfkEB9JJ2OjrEdjsVELlkimQcSkUGkhLJtCkzqYP4la14XoB
         fWiSoForuZTCfX2H1+KA8DbMB8jBOCZm7qgOfikybU7rvnhQ1edJPxHb8X5ePXohUu
         quFi19RH/0Irg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Jetson AGX Xavier has an on-board audio codec whicn is connected to
Tegra I2S1 interface. Hence add corresponding device node for the
audio codec.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 8697927..36f19c9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -41,6 +41,21 @@
 			status = "okay";
 		};
 
+		i2c@c250000 {
+			status = "okay";
+
+			rt5658: audio-codec@1a {
+				status = "okay";
+
+				compatible = "realtek,rt5658";
+				reg = <0x1a>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+				realtek,jd-src = <2>;
+				sound-name-prefix = "CVB-RT";
+			};
+		};
+
 		/* SDMMC1 (SD/MMC) */
 		mmc@3400000 {
 			status = "okay";
-- 
2.7.4

