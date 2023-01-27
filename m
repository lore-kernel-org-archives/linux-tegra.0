Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931F9C38142
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 10:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbjA0KOd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 05:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbjA0KOd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 05:14:33 -0500
X-Greylist: delayed 2107 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 27 Jan 2023 02:14:26 PST
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D6176B3;
        Fri, 27 Jan 2023 02:14:26 -0800 (PST)
Received: from [167.98.27.226] (helo=rainbowdash)
        by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
        id 1pLLCR-000onR-8B; Fri, 27 Jan 2023 09:39:11 +0000
Received: from ben by rainbowdash with local (Exim 4.96)
        (envelope-from <ben@rainbowdash>)
        id 1pLLCR-001msw-1I;
        Fri, 27 Jan 2023 09:39:11 +0000
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] arm64: tegra: dts: add vccmq on p3310 TX2 SoM
Date:   Fri, 27 Jan 2023 09:39:10 +0000
Message-Id: <20230127093910.426233-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The TX2 SoM's SDIO WiFI card is connected via mmc@3440000 however it does
not look like the upstream kernel is even bothering to power this (and
the regulator framework shuts down this power rail post kernel init).

The issue seems to be a missing link for vccq from the MAX77620 PMIC's LDO5
which is labeled vddio_sdmmc3 (and not used anywhere else) to the mmc@3440000
node to ensure there is at leasr bus power.

Note this does not fix the WiFi issue on upstream kernels, there is still
something else missing that gets the BCM WiFi device to detect properly.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Note, probably a candidate for stable.
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index aff857df25cf..3fd34d3d912a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -145,6 +145,7 @@ mmc@3400000 {
 	/* SDMMC3 (SDIO) */
 	mmc@3440000 {
 		status = "okay";
+		vqmmc-supply = <&vddio_sdmmc3>;
 	};
 
 	/* SDMMC4 (eMMC) */
-- 
2.39.0

