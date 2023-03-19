Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621D6C7618A
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Mar 2023 19:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjCSTol (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 19 Mar 2023 15:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjCSTok (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Mar 2023 15:44:40 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0692C17B
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 12:44:38 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id B40016000872;
        Sun, 19 Mar 2023 19:44:34 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id gRWjNL0OMLCI; Sun, 19 Mar 2023 19:44:32 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 3EA5E6003C2E;
        Sun, 19 Mar 2023 19:44:32 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1679255072;
        bh=c4rQrlqDPFEOdS/WfDdi6Su47sx8u1aL1Tn+pvyQ4vI=;
        h=From:To:Subject:Date;
        b=EJ290Q8bKRAWm826LdF9UYSWXEBLjC+owOdm1A2UsPj4oTDtTVkBgeyv4HnhtWcsI
         FoIQMVlHzNFbrF+EO2JpA/TWE8i5WFTNbCKc/eP0BKzNjX5FKgtN4nIARqsfZWwaGb
         3/3bWsgyMWmmeXzjlUaDsyypRmNBVau2iPCNGHIM=
Received: from wslaptop.Home (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id F2A57360071;
        Sun, 19 Mar 2023 19:44:30 +0000 (WET)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     diogo.ivo@tecnico.ulisboa.pt, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, arnd@arndb.de, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: dts: smaug: Add EMC frequency change tables
Date:   Sun, 19 Mar 2023 19:42:55 +0000
Message-Id: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the reserved-memory regions of the nominal and derated tables setup by
the bootloader so that the EMC frequency change code can access them.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 709f3f417a19..a74826ae97b4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -30,6 +30,22 @@ memory {
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		nominal: emc-table@f67cc000 {
+			compatible = "nvidia,tegra210-emc-table";
+			reg = <0x0 0xf67cc000 0x0 0xbea0>;
+		};
+
+		derated: emc-table@f67d7ea0 {
+			compatible = "nvidia,tegra210-emc-table";
+			reg = <0x0 0xf67d7ea0 0x0 0xbea0>;
+		};
+	};
+
 	host1x@50000000 {
 		dc@54200000 {
 			status = "okay";
@@ -1735,6 +1751,11 @@ pmc@7000e400 {
 		status = "okay";
 	};
 
+	emc: external-memory-controller@7001b000 {
+		memory-region = <&nominal>, <&derated>;
+		memory-region-names = "nominal", "derated";
+	};
+
 	usb@70090000 {
 		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>,
 		       <&{/padctl@7009f000/pads/pcie/lanes/pcie-6}>;
-- 
2.40.0

