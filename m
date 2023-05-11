Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02747C77B7F
	for <linux-tegra@archiver.kernel.org>; Thu, 11 May 2023 08:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235855AbjEKIhZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 May 2023 04:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjEKIhX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 May 2023 04:37:23 -0400
X-Greylist: delayed 364 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 11 May 2023 01:37:18 PDT
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59201469F;
        Thu, 11 May 2023 01:37:18 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 7D5C1600087B;
        Thu, 11 May 2023 09:31:10 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id eF7r51ZbhSje; Thu, 11 May 2023 09:31:08 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 1CB726000423;
        Thu, 11 May 2023 09:31:08 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1683793868;
        bh=cUy24OHC2PDWv/LYVymcQqarn0AG+4ttuowe7gVcDe8=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=cpmQjkQOITjuHYbpXMG4PoHKeFpwspTCxbfqVV5RK7hz9oUMBj0KNuro2ZffkwXK9
         2BKgConITWzwLkf1jU3BAj0OTJaFXytsnR8ZOCTuOayApN/obn1FFbsvjBihtVUi2H
         KOlLGoBRm2tbddXzrABNMmxunCJa/C4S5MjPyOMs=
Received: from wslaptop.Home (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id EB386360073;
        Thu, 11 May 2023 09:31:07 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, diogo.ivo@tecnico.ulisboa.pt,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: tegra: smaug: add GPU power rail regulator
Date:   Thu, 11 May 2023 09:31:00 +0100
Message-Id: <20230511083101.78516-2-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511083101.78516-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230511083101.78516-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the GPU power rail regulator node for the Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index e55bff859692..8973fcf1e219 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1406,6 +1406,23 @@ max77621_cpu: max77621@1b {
 			maxim,externally-enable;
 		};
 
+		max77621_gpu: max77621@1c {
+			compatible = "maxim,max77621";
+			reg = <0x1c>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(A, 6) IRQ_TYPE_LEVEL_LOW>;
+			regulator-min-microvolt = <840000>;
+			regulator-max-microvolt = <1150000>;
+			regulator-name = "PPVAR_GPU";
+			regulator-ramp-delay = <12500>;
+			maxim,dvs-default-state = <1>;
+			maxim,enable-active-discharge;
+			maxim,enable-bias-control;
+			maxim,disable-etr;
+			maxim,enable-gpio = <&pmic 6 0>;
+			maxim,externally-enable;
+		};
+
 		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
-- 
2.40.1

