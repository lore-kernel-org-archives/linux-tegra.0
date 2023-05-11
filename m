Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F4DC7EE25
	for <linux-tegra@archiver.kernel.org>; Thu, 11 May 2023 08:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234868AbjEKIh1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 May 2023 04:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235831AbjEKIhY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 May 2023 04:37:24 -0400
X-Greylist: delayed 364 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 11 May 2023 01:37:18 PDT
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1B949D6;
        Thu, 11 May 2023 01:37:18 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 3F6B66001418;
        Thu, 11 May 2023 09:31:11 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id TmGA-BY02HpO; Thu, 11 May 2023 09:31:08 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D3449600142E;
        Thu, 11 May 2023 09:31:08 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1683793868;
        bh=RbjKnd5gHvy7UWuHTMMFYJSF8cHCWLTOFPxaoC4Uq+8=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=UyFte6GCQr0pjmgv9f5ZXwn69ofoZ2GUEoWXhMT1XOVn0l9QeNNb+Zi80u36cAXRb
         WzwMYebXPWRiuZ8uFN/VPIMoX8x92PJE+QT6m+xbSRwNg+Sf/i0JRM84HloxjKexXB
         Eu4dekmN4xTOg1aQv2dncXy0MO4ipczjSfHvPzaU=
Received: from wslaptop.Home (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 9BF44360072;
        Thu, 11 May 2023 09:31:08 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, diogo.ivo@tecnico.ulisboa.pt,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: tegra: smaug: add GPU node
Date:   Thu, 11 May 2023 09:31:01 +0100
Message-Id: <20230511083101.78516-3-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511083101.78516-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230511083101.78516-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the GPU on the Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 8973fcf1e219..709f3f417a19 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -67,6 +67,11 @@ dpaux: dpaux@545c0000 {
 		};
 	};
 
+	gpu@57000000 {
+		vdd-supply = <&max77621_gpu>;
+		status = "okay";
+	};
+
 	pinmux: pinmux@700008d4 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
-- 
2.40.1

