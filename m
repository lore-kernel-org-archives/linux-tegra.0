Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF63C64E7C
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Dec 2020 09:01:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC0E8221FB
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Dec 2020 09:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgLBJBY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Dec 2020 04:01:24 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9207 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgLBJBY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Dec 2020 04:01:24 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc757bc0000>; Wed, 02 Dec 2020 01:00:44 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 09:00:43 +0000
Received: from moonraker.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 2 Dec 2020 09:00:42 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, "Jon Hunter" <jonathanh@nvidia.com>
Subject: [PATCH 1/2] arm64: defconfig: Enable Tegra SoC Thermal driver
Date:   Wed, 2 Dec 2020 09:00:11 +0000
Message-ID: <20201202090012.306327-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1606899644; bh=HZof7pDj52cslU0wQrFct0+zLVBBix8axsqJzdzx9Xw=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=IEv6YHl4oyXAJ2Vt7Aaq6UqHGb3j8F+qGIuvKTKDFTD0CiIKvGG6uA+t+dSaNITkZ
         LtLJpXpwXkbCJ0wFvTIEI5T0ji4dMgqoA1kaJwRmSpJMbp2X+iTzB1fnCR0NSUysdY
         v7kv0ZogmO0Myfr3/AeinVsVSsvMDJIueyGZ5ZfjfxWumm03YCKH6RPeY0KgCfidGS
         Xeqqf7ISeTjg4SevucSTVmRs/+SGd9efsQjJeLgFkDFHq4KwnWIVd1xWZVNgT2rD9n
         KsWhadAc2+boHxRuNAFHbLC24BWwGO4OiCuz9rLREbfPR2uMC9hCfp/+5SV2rvgfn8
         ofluahgHnoTVw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the Tegra SoC Thermal driver that is used by Tegra132 and
Tegra210 platforms to be built as a module by default for ARM64 builds.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 867cc4a5f00f..079d2762ce20 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -550,6 +550,7 @@ CONFIG_BCM2835_THERMAL=3Dm
 CONFIG_BRCMSTB_THERMAL=3Dm
 CONFIG_EXYNOS_THERMAL=3Dy
 CONFIG_TEGRA_BPMP_THERMAL=3Dm
+CONFIG_TEGRA_SOCTHERM=3Dm
 CONFIG_QCOM_TSENS=3Dy
 CONFIG_QCOM_SPMI_TEMP_ALARM=3Dm
 CONFIG_UNIPHIER_THERMAL=3Dy
--=20
2.25.1

