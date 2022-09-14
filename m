Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5D9C6FA8A
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Sep 2022 11:13:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiINLNE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Sep 2022 07:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiINLNC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Sep 2022 07:13:02 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EB35E643;
        Wed, 14 Sep 2022 04:12:58 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 1F4326007C12;
        Wed, 14 Sep 2022 12:12:55 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id 8uI3pcrmVLhY; Wed, 14 Sep 2022 12:12:52 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id AB2646007C0F;
        Wed, 14 Sep 2022 12:12:52 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1663153972;
        bh=1F25R9TmJ+XPgpvmFc9bytaCvAg1W4j5vCdm/FevPeE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=uPbB+mm/PWnKFCI8EFCLMN8MceDDQECzv95fG9Ib6FDWPUcVwVcdsHZ4QvqKHkmuy
         sIQi2sx5Urt9Rth1CDfq2zH/xzo5wrc2TBJrlCL62bynq5AQXDSPlkJYzp3MZCirAl
         zdROKm4ZL5kbuTphzwd+I/VV9t/rvLDa9dnknPJk=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 4304A360089;
        Wed, 14 Sep 2022 12:12:52 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: tegra: smaug: Add Bluetooth node
Date:   Wed, 14 Sep 2022 12:12:20 +0100
Message-Id: <20220914111221.862929-2-diogo.ivo@tecnico.ulisboa.pt>
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
Add a DT node for its BT functionality. Tested on Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index a263d51882ee..7ae503a29508 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -17,6 +17,7 @@ / {
 
 	aliases {
 		serial0 = &uarta;
+		serial3 = &uartd;
 	};
 
 	chosen {
@@ -1309,6 +1310,22 @@ serial@70006000 {
 		status = "okay";
 	};
 
+	uartd: serial@70006300 {
+		compatible = "nvidia,tegra30-hsuart";
+		status = "okay";
+
+		bluetooth {
+			compatible = "brcm,bcm43540-bt";
+			max-speed = <4000000>;
+			brcm,bt-pcm-int-params = [01 02 00 01 01];
+			device-wakeup-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+			shutdown-gpios = <&gpio TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(H, 5) IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "host-wakeup";
+		};
+	};
+
 	i2c@7000c400 {
 		status = "okay";
 		clock-frequency = <1000000>;
-- 
2.37.3

