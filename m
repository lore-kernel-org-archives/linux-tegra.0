Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE928C43381
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Feb 2021 06:45:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 764B364E56
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Feb 2021 06:45:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbhBJGpA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Feb 2021 01:45:00 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1921 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbhBJGoq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Feb 2021 01:44:46 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B602380b50002>; Tue, 09 Feb 2021 22:44:05 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 06:44:05 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 10 Feb 2021 06:44:02 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <robh@kernel.org>, <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Move clocks from RT5658 endpoint to device node
Date:   Wed, 10 Feb 2021 12:13:41 +0530
Message-ID: <1612939421-19900-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
References: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612939446; bh=6SW2nvW04ev7nQ4NL1cPmnyz03i1DCHkXGNng6u1qwA=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=FwIIzewBZ0gzhL6UOvyyBHy9Na4CyfxoavNcihNI+DrM+34yih/iKBYQPNaHD0iUb
         cBbndyUKJwAZUVUIhDGxxx4R5+RRa5IGBtroxfVD2ZCqRSuNtYQ9q9FPMa9F89SYIz
         mIWMy/WiFeaj9i1rx7gbMVJci7ePP2Sfmi8gjDl7or2r9AbKAW7NJLJeNVq/ao2r23
         Hl8lUyF06oh3HjkNx/2NcJqLeEfwRhtKQ491RCkoDBj/L+A23VcW7RyLX5mrw8uetQ
         xEZ9kuQxsHBbxCXoneKHMXUumm76Lar3KSt4OvLOKTjbYluc3QBizeNZITTc9fZJSI
         U0DvaW6kRIFBQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

An endpoint is not a device and it is recommended to use clocks property
in device node. RT5658 Codec binding already specifies the usage of
clocks property. Thus move the clocks from endpoint to device node.

Fixes: 5b4f6323096a ("arm64: tegra: Audio graph sound card for Jetson AGX Xavier")
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index b079420..ef41349e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -651,6 +651,7 @@
 				reg = <0x1a>;
 				interrupt-parent = <&gpio>;
 				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+				clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
 				realtek,jd-src = <2>;
 				sound-name-prefix = "CVB-RT";
 
@@ -658,7 +659,6 @@
 					rt5658_ep: endpoint {
 						remote-endpoint = <&i2s1_dap_ep>;
 						mclk-fs = <256>;
-						clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
 					};
 				};
 			};
-- 
2.7.4

