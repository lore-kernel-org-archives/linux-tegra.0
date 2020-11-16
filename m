Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39BAC63699
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 16:21:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62CF822265
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 16:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="CfxBPIwR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbgKPQUj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:20:39 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5675 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731932AbgKPQUi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 11:20:38 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb2a6e00000>; Mon, 16 Nov 2020 08:20:48 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Nov
 2020 16:20:37 +0000
Received: from thunderball.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 16 Nov 2020 16:20:36 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ARM64: tegra: Disable the ACONNECT for Jetson TX2
Date:   Mon, 16 Nov 2020 16:20:26 +0000
Message-ID: <20201116162026.5324-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605543648; bh=0nqF3sVXBBRyuBpYV3tfZHHlcdqt140Li43Wa2GIlls=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=CfxBPIwRn8yMJ7EjFhVITEXgE/MeYo1notk9e4TL84PuCu+maeidHIbGUlgHj+Z3s
         Gd+AJlcTGZOD8GLTsiyocYlJV9TsZDpVgWmcSDrjTskZ72cz1nLWbM5WCPk/Auj2Bf
         GD779wzZic+hvwR26IKve/ztTXd9zcp5KTc0j1EDAXJxCp49YZ/q2UvbO2XlLkM21A
         C6AwpBd3bhAE1XkO/+qaG6mUonUsJTDS4qnQJdaI77MF+EeVDSBXvNL4rF2eKiy/kV
         j/y6Ql1Eehek56FDxN6kKUiZf6Ik8ybPrnfCvwThsaVX1Djz4ss5u4phNTzH8NlDTU
         CNki7ekLNveJg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit ff4c371d2bc0 ("arm64: defconfig: Build ADMA and ACONNECT driver")
enable the Tegra ADMA and ACONNECT drivers and this is causing resume
from system suspend to fail on Jetson TX2. Resume is failing because the
ACONNECT driver is being resumed before the BPMP driver, and the ACONNECT
driver is attempting to power on a power-domain that is provided by the
BPMP. While a proper fix for the resume sequencing problem is identified,
disable the ACONNECT for Jetson TX2 temporarily to avoid breaking system
suspend.

Please note that ACONNECT driver is used by the Audio Processing Engine
(APE) on Tegra, but because there is no mainline support for APE on
Jetson TX2 currently, disabling the ACONNECT does not disable any useful
feature at the moment.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 381a84912ba8..c28d51cc5797 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -10,18 +10,6 @@
 	model = "NVIDIA Jetson TX2 Developer Kit";
 	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
 
-	aconnect {
-		status = "okay";
-
-		dma-controller@2930000 {
-			status = "okay";
-		};
-
-		interrupt-controller@2a40000 {
-			status = "okay";
-		};
-	};
-
 	i2c@3160000 {
 		power-monitor@42 {
 			compatible = "ti,ina3221";
-- 
2.17.1

