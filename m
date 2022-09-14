Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB340ECAAD8
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Sep 2022 11:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiINLNC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Sep 2022 07:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiINLNB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Sep 2022 07:13:01 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661445FAE3;
        Wed, 14 Sep 2022 04:12:59 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id CCC076008769;
        Wed, 14 Sep 2022 12:12:57 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id zI4coHjeCo5B; Wed, 14 Sep 2022 12:12:54 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E4D406007C02;
        Wed, 14 Sep 2022 12:12:53 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1663153973;
        bh=CJQ0G0mq+t8EAFufh+9zSbkOe8T4djbo6UCGC6sqBfc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=fLdFIzxuU1PDU72a4tYNpFQZ22oldRFxeOTmvvgPjh+Sk2GcFRbi1EvwtNx1hsoLN
         nu+CLRYax5H4p0Ltccn3+gbwgryj5kZmUJZAGPJ1I6u7KXgqo2KLBGzyqI1xcAS+0M
         7106eDJF++7upngWSXhrFZq7ChRUbTPvwgm4Hwp4=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id C7F2E360089;
        Wed, 14 Sep 2022 12:12:53 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: tegra: smaug: Add Wi-Fi node
Date:   Wed, 14 Sep 2022 12:12:21 +0100
Message-Id: <20220914111221.862929-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220914111221.862929-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20220914111221.862929-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Google Pixel C contains a BRCM4354 Wi-Fi + BT module.
Add a DT node for its Wi-Fi functionality. Tested on Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 7ae503a29508..ffe37d7c66ba 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1709,6 +1709,25 @@ usb3-0 {
 		};
 	};
 
+	mmc@700b0200 {
+		power-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+		bus-width = <4>;
+		non-removable;
+		vqmmc-supply = <&pp1800>;
+		vmmc-supply = <&pp3300>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		wifi@1 {
+			compatible = "brcm,bcm4354-fmac", "brcm,bcm4329-fmac";
+			reg = <1>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(H, 2) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host-wake";
+		};
+	};
+
 	mmc@700b0600 {
 		bus-width = <8>;
 		non-removable;
-- 
2.37.3

