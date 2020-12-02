Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43106C64E8A
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Dec 2020 09:01:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC95422202
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Dec 2020 09:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729114AbgLBJB0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Dec 2020 04:01:26 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19043 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729107AbgLBJB0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Dec 2020 04:01:26 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc757bd0003>; Wed, 02 Dec 2020 01:00:45 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 09:00:45 +0000
Received: from moonraker.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 2 Dec 2020 09:00:44 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, "Jon Hunter" <jonathanh@nvidia.com>
Subject: [PATCH 2/2] ARM: config: Enable Tegra SoC Thermal driver
Date:   Wed, 2 Dec 2020 09:00:12 +0000
Message-ID: <20201202090012.306327-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202090012.306327-1-jonathanh@nvidia.com>
References: <20201202090012.306327-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1606899645; bh=8p7860+awh8IciLAhgRckW1Z7Nb8VlsgvEe2p448J4o=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=SqATl/bFmzPUFWTAD5eGIbdir1cu3lG2DPDlxzdFGcTrdhH/k19H/iGD51gsivz+g
         KWiD+ruvs7LtshH/4rZVVjdO+wwc5UsYeB5llrofO9VQkcK4P4MqgumL0pyXCzTI+o
         tYYq0Wu+aoaIeHMjeIKpoQzYcFfNMKWzadU1l1pPNxNk3rN81bNhOBuoxjg+MqK5QJ
         LtY3Vz9NOMVF1bFxJiB3AKb4ttYCJ1PZTfsvq5x62zlGEEFRGWnkwM1QYoAppM0S0X
         yxsjJUWeQ19/1Gz8bzexVybJStICG+5t2qAMwdQuuaBhr9GcxQ6XMt5XqgT4ouOfwP
         ZRb44dVZIOEvg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the Tegra SoC Thermal driver that is used by Tegra124 platforms
to be built as a module by default for ARM tegra_defconfig and
multi_v7_defconfig builds.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/tegra_defconfig    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v=
7_defconfig
index 1bcfb8211e51..9398ffb016f7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -513,6 +513,7 @@ CONFIG_BCM2711_THERMAL=3Dm
 CONFIG_BCM2835_THERMAL=3Dm
 CONFIG_BRCMSTB_THERMAL=3Dm
 CONFIG_ST_THERMAL_MEMMAP=3Dy
+CONFIG_TEGRA_SOCTHERM=3Dm
 CONFIG_UNIPHIER_THERMAL=3Dy
 CONFIG_DA9063_WATCHDOG=3Dm
 CONFIG_XILINX_WATCHDOG=3Dy
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defc=
onfig
index fff5fae0db30..a4bce17447be 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -167,6 +167,7 @@ CONFIG_SENSORS_LM95245=3Dy
 CONFIG_THERMAL=3Dy
 CONFIG_THERMAL_STATISTICS=3Dy
 CONFIG_CPU_THERMAL=3Dy
+CONFIG_TEGRA_SOCTHERM=3Dm
 CONFIG_WATCHDOG=3Dy
 CONFIG_MAX77620_WATCHDOG=3Dy
 CONFIG_TEGRA_WATCHDOG=3Dy
--=20
2.25.1

