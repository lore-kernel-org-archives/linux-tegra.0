Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8188C56202
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 08:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5567B2417E
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 08:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="jz8pZt0U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgKRIGi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:06:38 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:12838 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgKRIGi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Nov 2020 03:06:38 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb4d6120000>; Wed, 18 Nov 2020 00:06:42 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 08:06:37 +0000
Received: from audio.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:34 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <broonie@kernel.org>
CC:     <jonathanh@nvidia.com>, <sharadg@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 1/3] arm64: tegra: Fix Tegra194 HDA {clock,reset}-names ordering
Date:   Wed, 18 Nov 2020 13:36:20 +0530
Message-ID: <1605686782-29469-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
References: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605686802; bh=5+i2Us2XoqokmBo59PMW/PDmxf9BY2baahXD2ObGdOo=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=jz8pZt0UlfYGjujrBtGkxBbEEcPt2tA0RLOS2IHsfP/36DUM6itDIISeaDpiIzZsh
         iu/cO1UCMBYgPXkdaTeE8kAzSLDa27GzJ9irjBiifR+l4F+JDE7BZx+PysUkEuUb6V
         D3IuoCnrKUdTjYQVQVSeT+haQRs1DZ/8goBTHAXESWt1Ah4fftSIESeGWA/zd523Gt
         wYno5mAUsUSavI1nT4XCHDp94INKCLXNx6wePDJsfvYdD4k6MCmUU3n9O2ZfAXUqCq
         KWoIz0BZ7m5T+59uJJMn34UVST/JrcTSCYCRQUTdUha53kKOftv26annTWuPp5xhqN
         7RNwPa6LtAS0A==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

As per the HDA binding doc reorder {clock,reset}-names entries for
Tegra194. This also serves as a preparation for converting existing
binding doc to json-schema.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 6946fb2..e3cab26 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -782,13 +782,13 @@
 			reg = <0x3510000 0x10000>;
 			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_HDA>,
-				 <&bpmp TEGRA194_CLK_HDA2CODEC_2X>,
-				 <&bpmp TEGRA194_CLK_HDA2HDMICODEC>;
-			clock-names = "hda", "hda2codec_2x", "hda2hdmi";
+				 <&bpmp TEGRA194_CLK_HDA2HDMICODEC>,
+				 <&bpmp TEGRA194_CLK_HDA2CODEC_2X>;
+			clock-names = "hda", "hda2hdmi", "hda2codec_2x";
 			resets = <&bpmp TEGRA194_RESET_HDA>,
-				 <&bpmp TEGRA194_RESET_HDA2CODEC_2X>,
-				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
-			reset-names = "hda", "hda2codec_2x", "hda2hdmi";
+				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>,
+				 <&bpmp TEGRA194_RESET_HDA2CODEC_2X>;
+			reset-names = "hda", "hda2hdmi", "hda2codec_2x";
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HDAR &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_HDAW &emc>;
-- 
2.7.4

