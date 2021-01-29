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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555C8C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09A0B64E08
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 18:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbhA2Sas (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 13:30:48 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8344 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbhA2SaA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 13:30:00 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601453c50000>; Fri, 29 Jan 2021 10:28:21 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:21 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:17 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>
CC:     <kuninori.morimoto.gx@renesas.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 7/9] Revert "arm64: tegra: Disable the ACONNECT for Jetson TX2"
Date:   Fri, 29 Jan 2021 23:57:44 +0530
Message-ID: <1611944866-29373-8-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611944901; bh=I95udSMV/XUfuFEVmUIVdulMrVLxZ9bvj1yUdPIvxCs=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=OmoUYQrg/YSr24+iyc4mBwtIC21nefrGcNzKRO0gpVqfnOAJ6XhBMf3ktqB6jNYzj
         f/BWhzZtg34HHNo1lfpTYa1L1IhmVwveXsNmlm1zukZYy7AlZe9ORbjDX2On4WomHG
         /XUFfxOrlPanTylpJpYvhjA81e1dyJH48Sss4XlLwKV7AMKr45zhH8j35tI02mZpcr
         pNwgQdc+RGNED/mwKgG3DA7a+0wb8VxoCnOFNtAIbKUdt+6ManrAlSKSLPGLnHz+mG
         luQyuyf8mQMc2i70WiBDrHLQ+tXuOmoyNERz7CfEY5ErTVtHdskz74A2lD8SAcWck0
         tEHf7wthl3/mg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This reverts commit fb319496935b ("arm64: tegra: Disable the
ACONNECT for Jetson TX2").

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 6fd2e05..7e1723e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -10,6 +10,18 @@
 	model = "NVIDIA Jetson TX2 Developer Kit";
 	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
 
+	aconnect {
+		status = "okay";
+
+		dma-controller@2930000 {
+			status = "okay";
+		};
+
+		interrupt-controller@2a40000 {
+			status = "okay";
+		};
+	};
+
 	i2c@3160000 {
 		power-monitor@42 {
 			compatible = "ti,ina3221";
-- 
2.7.4

